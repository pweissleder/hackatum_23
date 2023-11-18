//
//  HealthKitService.swift
//  TailoredTaste
//
//  Created by Marc Beil on 18.11.23.
//

import Foundation
import HealthKit

class HealthKitService {
    let healthStore: HKHealthStore
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            self.healthStore = HKHealthStore()
        } else {
            fatalError("HealthKitData not available!")
        }
        print("Permissionrequest for HealthKit: \(requestPermission()).")
        fetchAllergies()

    }
    
    
    func requestPermission() -> Bool {
        if HKHealthStore.isHealthDataAvailable() {
            guard let allergiesType: HKObjectType = HKObjectType.clinicalType(forIdentifier: .allergyRecord)
            else {
                fatalError("*** Unable to create the requested types ***")
            }
            
            healthStore.requestAuthorization(toShare: nil, read: [allergiesType]) { (success, error) in
                guard success else {
                    // Handle errors here.
                    fatalError("*** An error occurred while requesting authorization: \(error!.localizedDescription) ***")
                }
            }
            return true
        }
        return false
    }
    
    
    func fetchAllergies() -> [HKClinicalRecord] {
        print("start fetching allergies")
        guard let allergiesType: HKObjectType = HKObjectType.clinicalType(forIdentifier: .allergyRecord)
        else {
            fatalError("*** Unable to create the requested types ***")
        }
        
        let allergyQuery = HKSampleQuery(sampleType: allergiesType as! HKSampleType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, samples, error) in
            
            guard let actualSamples = samples else {
                // Handle the error here.
                print("*** An error occurred: \(error?.localizedDescription ?? "nil") ***")
                return
            }
            
            let allergySamples = actualSamples as? [HKClinicalRecord]
            
            print("first Allergy: \(allergySamples!.first!.displayName)")
        }
        healthStore.execute(allergyQuery)
        return []
    }
     
}
