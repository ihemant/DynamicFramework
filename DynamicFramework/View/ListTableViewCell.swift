//
//  ListTableViewCell.swift
//  AlomofireSample
//
//  Created by Hemant13 Kumar on 22/04/20.
//  Copyright © 2020 Hemant13 Kumar. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var confirmedCasesIndian: UILabel!
    @IBOutlet weak var discharged: UILabel!
    @IBOutlet weak var deaths: UILabel!
    @IBOutlet weak var confirmedCasesForeign: UILabel!
    @IBOutlet weak var backGroundView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
