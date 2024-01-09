//
//  ClinicCollectionViewCell.swift
//  MerchantApp
//
//  Created by Neshwa on 05/01/24.
//

import UIKit

class ClinicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var clinicView: UIView!
    @IBOutlet weak var clinicImage: UIImageView!
    @IBOutlet weak var clinicName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clinicImage.layer.cornerRadius = 10
    }

}
