//
//  ProductTableViewCell.swift
//
//  Created by Geraldine on 30/10/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageProductView: UIImageView!
    @IBOutlet weak var priceProductLabel: UILabel!
    @IBOutlet weak var titleProductLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        imageProductView.image = nil
        priceProductLabel.text = nil
        titleProductLabel.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
