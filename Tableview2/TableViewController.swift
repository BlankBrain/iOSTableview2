//
//  TableViewController.swift
//  Tableview2
//
//  Created by Md. Mehedi Hasan on 6/1/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
//

import UIKit

class TableViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    var myDictionary: [String: [String]] = ["a": ["apple" , "audi"], "b": ["belkin" , "bose"] , "c" : ["compaq" , "comcast"] , "d" : ["dell" , "dos"] , "e" : ["exon mobil" , "ericson"]]
    
    @IBOutlet weak var table1: UITableView!
    @IBOutlet weak var table2: UITableView!
    let cellIdentifiar : String = "cell"
    var numberOfCellsTable1:Int = 0
    var numberOfCellsTable2:Int = 0
    var keyValue:String = "a"

  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            numberOfCellsTable1 = myDictionary.keys.count
            return numberOfCellsTable1
        }
        else if tableView.tag == 2 {
            numberOfCellsTable2 = myDictionary[keyValue]!.count
            return numberOfCellsTable2
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiar, for: indexPath) as UITableViewCell
        if tableView.tag == 1 {
            cell.textLabel?.text =  Array(myDictionary.keys)[indexPath.row]
            
        }
        else if tableView.tag == 2 {
            cell.textLabel?.text = myDictionary[keyValue]?[indexPath.row ]
        }

        return cell
        
    }
    

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        print(indexPath.row)
         if tableView.tag == 1 {
        keyValue = Array(myDictionary.keys)[indexPath.row]
            
        }
        
        table2.reloadData()
                
       }

 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table1.delegate = self
        table2.delegate = self
        table1.dataSource = self
        table2.dataSource = self
       

        
    }
    



}


