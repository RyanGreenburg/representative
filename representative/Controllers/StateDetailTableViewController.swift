//
//  StateDetailTableViewController.swift
//  representative
//
//  Created by RYAN GREENBURG on 2/7/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var reps: [Representative] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var state: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateaViews()
    }
    
    func updateaViews() {
        guard let state = state else { return }
        RepresentativeController.searchRepresentatives(forState: state) { (reps) in
            self.reps = reps
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return reps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repCell", for: indexPath) as? RepresentativeTableViewCell
        let rep = reps[indexPath.row]
        cell?.rep = rep
        
        return cell ?? UITableViewCell()
    }

}
