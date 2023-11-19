//
//  HealthKitService.swift
//  TailoredTaste
//
//  Created by Marc Beil on 18.11.23.
//

import Foundation
import HealthKit


class HealthKitService {
    static let shared = HealthKitService()
    
    let healthStore: HKHealthStore
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            self.healthStore = HKHealthStore()
        } else {
            fatalError("HealthKitData not available!")
        }
    }
    
    
    func requestPermission() -> Void {
        let writeDataTypes: Set<HKQuantityType> = Set([HKQuantityType.quantityType(forIdentifier: .dietaryProtein)!,
                                                       HKQuantityType.quantityType(forIdentifier: .dietaryFatTotal)!,
                                                       HKQuantityType.quantityType(forIdentifier: .dietaryFatSaturated)!,
                                                       HKQuantityType.quantityType(forIdentifier: .dietaryFiber)!,
                                                       HKQuantityType.quantityType(forIdentifier: .dietarySugar)!,
                                                       HKQuantityType.quantityType(forIdentifier: .dietaryCarbohydrates)!,
                                                       HKQuantityType.quantityType(forIdentifier: .dietaryEnergyConsumed)!])
        let readDataTypes: Set<HKObjectType> = Set([HKObjectType.clinicalType(forIdentifier: .allergyRecord)!,
                                                    HKObjectType.activitySummaryType()])
        
        healthStore.requestAuthorization(toShare: writeDataTypes, read: readDataTypes) { (success, error) in
            guard success else {
                // Handle errors here.
                fatalError("*** An error occurred while requesting authorization: \(error!.localizedDescription) ***")
            }
        }
    }
    
    func fetchData() -> Void {
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
    }
    
    func exportNutritionData(calories: Int, fat: Int, satFat: Int, carbs: Int, fiber: Int, protein: Int, sugar: Int) {
        guard HKHealthStore.isHealthDataAvailable() else {
            print("HealthKit is not available on this device.")
            return
        }
        
        let samples = createQuantitySamples(calories: calories, fat: fat, satFat: satFat, carbs: carbs, fiber: fiber, protein: protein, sugar: sugar)
        healthStore.save(samples) { (success, error) in
                    if let error = error {
                        print("Error saving dietary data: \(error.localizedDescription)")
                    } else {
                        print("Dietary data saved successfully.")
                    }
                }
        
    }
    
    private func createQuantitySamples(calories: Int, fat: Int, satFat: Int, carbs: Int, fiber: Int, protein: Int, sugar: Int) -> [HKQuantitySample] {
        let calorieType = HKObjectType.quantityType(forIdentifier: .dietaryEnergyConsumed)!
        let proteinType = HKObjectType.quantityType(forIdentifier: .dietaryProtein)!
        let fatType = HKObjectType.quantityType(forIdentifier: .dietaryFatTotal)!
        let satFatType = HKObjectType.quantityType(forIdentifier: .dietaryFatSaturated)!
        let fiberType = HKObjectType.quantityType(forIdentifier: .dietaryFiber)!
        let sugarType = HKObjectType.quantityType(forIdentifier: .dietarySugar)!
        let carbType = HKObjectType.quantityType(forIdentifier: .dietaryCarbohydrates)!
        
        
        let calorieSample = HKQuantitySample(type: calorieType, quantity: HKQuantity(unit: .kilocalorie(), doubleValue: Double(calories)), start: Date(), end: Date())
        let proteinSample = createQuantitySample(for: proteinType, value: protein)
        let totalFatSample = createQuantitySample(for: fatType, value: fat)
        let saturatedFatSample = createQuantitySample(for: satFatType, value: satFat)
        let fiberSample = createQuantitySample(for: fiberType, value: fiber)
        let sugarSample = createQuantitySample(for: sugarType, value: sugar)
        let carbSample = createQuantitySample(for: carbType, value: carbs)
        
        
        return [proteinSample, totalFatSample, saturatedFatSample, fiberSample, sugarSample, carbSample, calorieSample]
    }
    
    private func createQuantitySample(for type: HKQuantityType, value: Int) -> HKQuantitySample {
        return HKQuantitySample(type: type, quantity: HKQuantity(unit: .gram(), doubleValue: Double(value)), start: Date(), end: Date())
    }
}
