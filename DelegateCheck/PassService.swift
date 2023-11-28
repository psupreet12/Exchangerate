//
//  PassService.swift
//  DelegateCheck
//
//  Created by Supreet on 11/11/23.
//

import Foundation
protocol services{
    func passServiceCall<T: Decodable>(responseType: T.Type,completion: @escaping (Result<T, Errors>) -> ())
}
class PassService: services{
    
    func passServiceCall<T: Decodable>(responseType: T.Type,completion: @escaping (Result<T, Errors>) -> ()) {
        MainService.fetchServiceData(responseType: responseType, completion: completion)
        
    }
}
