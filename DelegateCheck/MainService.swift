//
//  MainService.swift
//  DelegateCheck
//
//  Created by Supreet on 11/11/23.
//

import Foundation
enum Errors: String, Error{
    case customError = "API ISSUE"
}
class MainService{
    
    class func fetchServiceData<T: Decodable>(responseType: T.Type ,completion: @escaping (Result<T,Errors>)->()){
        
        let url = URL(string: "https://openexchangerates.org/api/latest.json?app_id=58e8ee51d7c34223a5f99445c8a45ca3")!
        
        URLSession.shared.dataTask(with: url){ (data, response,error) in
            guard error == nil else {return}
            let decoder = JSONDecoder()
            if let json = try? decoder.decode(responseType, from: data!){
                completion(.success(json))
            }
        }
    }
}
