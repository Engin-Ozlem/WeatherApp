//
//  TableViewCell.swift
//  WeatherApp
//
//  Created by macbookair on 2.06.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var degreLabelCell: UILabel!
    @IBOutlet weak var imageİconCell: UIImageView!
    @IBOutlet weak var dayLabelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
