//
//  PassService.swift
//  DelegateCheck
//
//  Created by Supreet on 11/11/23.
//

import Foundation
protocol services{
    func passServiceCall(completion: ([String])->())
}
class PassService: services{
    
    func passServiceCall(completion: ([String])->()) {
        completion(["asd","asd","11"])
    }
}
