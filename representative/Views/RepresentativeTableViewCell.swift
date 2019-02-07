//
//  RepresentativeTableViewCell.swift
//  representative
//
//  Created by RYAN GREENBURG on 2/7/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    var rep: Representative? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    func updateViews() {
        guard let rep = rep else { return }
        nameLabel.text = rep.name
        partyLabel.text = rep.party
        districtLabel.text = rep.district
        websiteLabel.text = rep.link
        phoneLabel.text = rep.phone
    }
}
