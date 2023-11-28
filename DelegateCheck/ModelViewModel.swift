//
//  ModelViewModel.swift
//  DelegateCheck
//
//  Created by Supreet on 10/11/23.
//

import Foundation

class ModelViewModel{

    var servicesDelegate: services?
    init(obj: services = PassService()){
        servicesDelegate = obj
    }
    func performFetchOperation(completion: @escaping (Result<CurrencyModel, Errors>) -> ()){
        
        servicesDelegate?.passServiceCall(responseType: CurrencyModel.self,completion: completion)
    }
}
