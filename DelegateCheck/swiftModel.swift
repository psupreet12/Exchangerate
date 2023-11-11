//
//  swiftModel.swift
//  DelegateCheck
//
//  Created by Supreet on 10/11/23.
//

import Foundation
import UIKit
protocol RefreshTableView{
    
    func refresh()
}


class TableViewDelegateAndData: NSObject{

    var refreshDelegate: RefreshTableView?
    var closureREF: ((Bool)->())!
    var currencyData = [String]()
   
    func setItems(currencyData: [String]) {
        print("uyi..",currencyData)
        self.currencyData = currencyData
    
        refreshDelegate?.refresh()
    }
    
   

}


extension TableViewDelegateAndData: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currencyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = currencyData[indexPath.row]
           cell.detailTextLabel?.text = ">"
           return cell
        
    }
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}



