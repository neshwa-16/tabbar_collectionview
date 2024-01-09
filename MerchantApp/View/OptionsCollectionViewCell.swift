//
//  OptionsCollectionViewCell.swift
//  MerchantApp
//
//  Created by Neshwa on 05/01/24.
//

import UIKit

class OptionsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var optionImage: UIImageView!
    @IBOutlet weak var optionTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        optionsView.layer.cornerRadius = 10
        optionsView.layer.borderColor = UIColor.black.cgColor
        optionsView.layer.borderWidth = 1
    }

}
