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
        
        let url = URL(string: ENV.URL.main)!
        print("asdsa")
        URLSession.shared.dataTask(with: url){ (data, response,error) in
            guard error == nil else { print("json..."); return}
            let decoder = JSONDecoder()
            if let json = try? decoder.decode(responseType, from: data!){
                print(json)
                completion(.success(json))
            }
        }.resume()
    }
}
