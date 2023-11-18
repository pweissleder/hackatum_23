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
    }
    
    
    func requestPermission() -> Bool {
        let writeDataTypes: Set<HKQuantityType> = Set([HKQuantityType.quantityType(forIdentifier: .dietaryProtein)!,
                                                  HKQuantityType.quantityType(forIdentifier: .dietaryFatTotal)!,
                                                  HKQuantityType.quantityType(forIdentifier: .dietaryFatSaturated)!,
                                                  HKQuantityType.quantityType(forIdentifier: .dietaryFiber)!,
                                                  HKQuantityType.quantityType(forIdentifier: .dietarySugar)!])
        let readDataTypes: Set<HKObjectType> = Set([HKObjectType.clinicalType(forIdentifier: .allergyRecord)!,
                                               HKObjectType.activitySummaryType()])
            
        healthStore.requestAuthorization(toShare: writeDataTypes, read: readDataTypes) { (success, error) in
                guard success else {
                    // Handle errors here.
                    fatalError("*** An error occurred while requesting authorization: \(error!.localizedDescription) ***")
                }
            }
            return true
    }
    
    
    func fetchAllergies() -> [HKClinicalRecord] {
        print("start fetching allergies")
        let allergyType = HKObjectType.clinicalType(forIdentifier: .allergyRecord)!
        
        let allergyQuery = HKSampleQuery(sampleType: allergyType as HKSampleType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, samples, error) in
            
            guard let actualSamples = samples else {
                // Handle the error here.
                print("*** An error occurred: \(error?.localizedDescription ?? "nil") ***")
                return
            }
            
            let allergySamples = actualSamples as! [HKClinicalRecord]
            
            for allergySample in allergySamples {
                DispatchQueue.main.async {
                    switch allergySample.displayName {
                    case "Peanuts":
                        DataViewModel.shared.preferences.peanutFree = false
                        print("peanut allergy")
                    case "Dairy":
                        DataViewModel.shared.preferences.dairyFree = false
                    case "Gluten":
                        DataViewModel.shared.preferences.glutenFree = false
                    default:
                        print("Allergy \(allergySample.displayName) is not recognized by the app")
                    }
                }
            }
            
        }
    
        let activityQuery = HKActivitySummaryQuery(predicate: nil) { (query, samples, error) in
            
            guard let activitySummaries = samples else {
                // Handle the error here.
                print("*** An error occurred: \(error?.localizedDescription ?? "nil") ***")
                return
            }
            
            
            
            print("activity")
            DispatchQueue.main.async {
                DataViewModel.shared.preferences.veryHealthy = true
            }
            if !activitySummaries.isEmpty {
                print(activitySummaries.count)
                DispatchQueue.main.async {
                    DataViewModel.shared.preferences.veryHealthy = true
                }
                if activitySummaries.first!.activeEnergyBurned.doubleValue(for: HKUnit.kilocalorie()) > 0 {
                    print(activitySummaries.first!.activeEnergyBurned.doubleValue(for: HKUnit.kilocalorie()))
                    DispatchQueue.main.async {
                        DataViewModel.shared.preferences.veryHealthy = true
                    }
                }
            }
        }

            
        healthStore.execute(activityQuery)
        healthStore.execute(allergyQuery)
        return []
    }
    
    func exportNutritionData(nutrition: Nutrition) {
       // HKObjectType.quantityType(forIdentifier: .)
    }
     
}
