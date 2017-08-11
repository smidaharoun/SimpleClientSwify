//
//  ViewController.swift
//  sample
//
//  Created by odc on 03/08/2017.
//  Copyright © 2017 Haroun Smida. All rights reserved.
//

import UIKit

class ViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var data: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showActivityIndicator(view: self.view)
        Api.sharedInstance.getUserInfo { (response) in
            self.hideActivityIndicator(view: self.view)
            do {
                self.data = try response.unwrap()
                self.tableView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row].email
        cell.detailTextLabel?.text = data[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 
    }

}

