//
//  ViewController.swift
//  DelegateCheck
//
//  Created by Supreet on 10/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var swiftModel = TableViewDelegateAndData()
    var ViewModel = ModelViewModel()
    var modelc: CurrencyModel?
    var modeString: [[String: Any]] = []{
        didSet{
            swiftModel.setItems(currencyData: modeString)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        swiftModel.refreshDelegate = self
        swiftModel.setItems(currencyData: nil)
        tableView.delegate = swiftModel
        tableView.dataSource = swiftModel
    
        ViewModel.performFetchOperation{ val in
            switch val {
            case.success(let val):
                self.modelc = val
                self.modeString = StructureData.shared.convertToArray(dict: (self.modelc?.rates as? [String: Any])!)
            case .failure(let error):
                print("failure..",error)
            }
          
            
        }
        
    }


}

extension ViewController: RefreshTableView{
    func refresh() {
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
       
        print("fetch value...")
    }
    
    
}
