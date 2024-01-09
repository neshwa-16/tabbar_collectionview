//
//  DoctorCollectionViewCell.swift
//  MerchantApp
//
//  Created by Neshwa on 05/01/24.
//

import UIKit

class DoctorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var doctorView: UIView!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorDesignation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        doctorView.layer.cornerRadius = 10
        doctorView.layer.borderWidth = 0.5
        doctorView.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func configure(with data: Doctors) {
        doctorName.text = data.name
        doctorDesignation.text = data.designation
    }
}
