//
//  ObjectModel.swift
//  DelegateCheck
//
//  Created by Supreet on 10/11/23.
//

import Foundation

final class StructureData{
    static let shared = StructureData()
    private init(){
        
    }
    
    func convertToArray(dict: [String: Any]) -> [[String: Any]] {
        var result: [[String: Any]] = [[:]]
        for val in dict {
            var temp: [String:Any] = [:]
            temp["currency"] = val.key
            temp["value"] = val.value
            
            result.append(temp)
        }
        return result.filter{!$0.isEmpty}
    }
}
