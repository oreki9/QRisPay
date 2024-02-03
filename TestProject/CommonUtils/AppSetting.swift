//
//  AppSetting.swift
//  TestProject
//
//  Created by rickyTA on 03/02/24.
//

import Foundation
class AppSetting {
    static let shared = AppSetting()
    let kUserDefaults = UserDefaults.standard
    var balance: Double {
        get {
            var result : Double = 0
            if let r = kUserDefaults.value(forKey:"balance") as? Double {
                result = r
            }
            return result
        }
        
        set(_balance){
            kUserDefaults.set(_balance, forKey: "balance")
            kUserDefaults.synchronize()
        }
    }
    var isFirstUseApp: Bool {
        get {
            var result = true
            if let r = kUserDefaults.value(forKey:"isFirstUseApp") as? Bool {
                result = r
            }
            return result
        }
        
        set(_isAfterLogin){
            kUserDefaults.set(_isAfterLogin, forKey: "isFirstUseApp")
            kUserDefaults.synchronize()
        }
    }
    func saveHistoryPay(_ array: [ResultPayEntity]) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(array) {
            UserDefaults.standard.set(encodedData, forKey: "historyPay")
        }
    }
    func savePay(_ data: ResultPayEntity) {
        print("save pay is running")
        if let allHistory = AppSetting.shared.loadHistoryPay() as? [ResultPayEntity] {
            print("save history data \(allHistory)")
            print("get pay data \(data)")
            var allHistoryTemp = allHistory+[data]
            let encoder = JSONEncoder()
            if let encodedData = try? encoder.encode(allHistoryTemp) {
                UserDefaults.standard.set(encodedData, forKey: "historyPay")
            }
        }
    }
    func loadHistoryPay() -> [ResultPayEntity] {
        if let savedData = UserDefaults.standard.data(forKey: "historyPay") {
            let decoder = JSONDecoder()
            if let decodedArray = try? decoder.decode([ResultPayEntity].self, from: savedData) {
                return decodedArray
            }
        }
        return [ResultPayEntity]()
    }
}