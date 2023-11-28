//
//  CurrencyModel.swift
//  DelegateCheck
//
//  Created by Supreet on 15/11/23.
//
import Foundation

struct CurrencyModel: Decodable{
    
    var base: String = ""
    var rates: [String: Double] = [:]
}
