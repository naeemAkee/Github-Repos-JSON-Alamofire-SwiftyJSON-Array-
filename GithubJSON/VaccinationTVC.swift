//
//  VaccinationTVC.swift
//  TCS
//
//  Created by MNA Developer on 13/02/2019.
//  Copyright © 2019 MNA Developer. All rights reserved.
//

import UIKit

class VaccinationTVC: UITableViewCell {

    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var Description: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
