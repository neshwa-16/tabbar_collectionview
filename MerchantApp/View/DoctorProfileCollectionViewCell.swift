//
//  DoctorProfileCollectionViewCell.swift
//  MerchantApp
//
//  Created by Neshwa on 05/01/24.
//

import UIKit

protocol CloseViewDelegate : AnyObject {
    func closeViewAction(in cell: DoctorProfileCollectionViewCell)
}

class DoctorProfileCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileView: UIView!
    weak var delegate : CloseViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileView.layer.cornerRadius = 12
        profileImage.layer.cornerRadius = 60
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func closAction(_ sender: Any) {
        delegate?.closeViewAction(in: self)
    }
}
