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
    var currencyData = [[String: Any]]()
   
    func setItems(currencyData: [[String: Any]]?) {
        guard let currencyData = currencyData else {return }
        self.currencyData = currencyData
      print("dd..",currencyData[0]["value"] as? Double)
        refreshDelegate?.refresh()
    }
    
   

}


extension TableViewDelegateAndData: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currencyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("jhkjh")
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = currencyData[indexPath.row]["currency"] as? String
           cell.detailTextLabel?.text = ">"
           return cell
        
    }
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}



