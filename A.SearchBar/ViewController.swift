//
//  ViewController.swift
//  A.SearchBar
//
//  Created by apple on 2/17/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK:- Utilities
    @IBOutlet weak var tableViewController: UITableView!
    @IBOutlet weak var SearchBar: UISearchBar!
    var items = ["A","B","b","c","C","a","d","D"]
    var search = [String]()
    var searching = false
    
    
    
    
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewController.delegate = self
        tableViewController.dataSource = self
        SearchBar.delegate = self
        // Do any additional setup after loading the view.
    }


}

//MARK:- Table View
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return search.count
        }
        else{
            return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewController.dequeueReusableCell(withIdentifier: "cell")
        if searching{
            cell?.textLabel?.text = search[indexPath.row]
        }
        else{
            cell?.textLabel?.text = items[indexPath.row]
        }
        
        return cell!
    }
    
    
}


//MARK:- Search View
extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search = items.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableViewController.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        SearchBar.text = ""
        tableViewController.reloadData()
        
    }
    
    
}
