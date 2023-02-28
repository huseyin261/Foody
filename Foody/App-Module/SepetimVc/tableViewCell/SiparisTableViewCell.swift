//
//  SiparisTableViewCell.swift
//  Foody
//
//  Created by Hüseyin Demirkoparan on 25.02.2023.
//

import UIKit

class SiparisTableViewCell: UITableViewCell {
    var callBackForAddCart:(() -> ())?
    @IBOutlet weak var siparisAdetLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var siparisAdi: UILabel!
    @IBOutlet weak var siparisPhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
