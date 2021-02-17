//
//  EventListCell.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 16/02/21.
//

import UIKit

class EventListCell: UITableViewCell {
    @IBOutlet weak var imgEvent: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
