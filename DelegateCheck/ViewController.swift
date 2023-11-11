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
    var model:[String] = []{
        didSet{
            print("jhfj..")
            swiftModel.setItems(currencyData: model)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        swiftModel.refreshDelegate = self
        swiftModel.setItems(currencyData: ["hello"])
        tableView.delegate = swiftModel
        tableView.dataSource = swiftModel
    
        ViewModel.performFetchOperation{ val in
            print("khk..",val)
            model = val
            
        }
        
    }


}

extension ViewController: RefreshTableView{
    func refresh() {
        tableView.reloadData()
        print("fetch value...")
    }
    
    
}
