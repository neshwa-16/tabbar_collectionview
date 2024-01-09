//
//  OptionsViewController.swift
//  MerchantApp
//
//  Created by Neshwa on 05/01/24.
//

import UIKit

class OptionsViewController: UIViewController {
    
    let options = ["Clinic appoinment", "Sell books", "Book movie tickets", "Sell groceries", "Buy metro tickets",
                   "Clinic appoinment", "Sell books", "Book movie tickets", "Sell groceries", "Buy metro tickets",
                   "Clinic appoinment", "Sell books", "Book movie tickets", "Sell groceries", "Buy metro tickets",
                   "Clinic appoinment", "Sell books", "Book movie tickets", "Sell groceries", "Buy metro tickets"]

    @IBOutlet weak var optionsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionsCollectionView.delegate = self
        optionsCollectionView.dataSource = self
        optionsCollectionView.register(UINib(nibName: "OptionsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OptionsCollectionViewCell")
    }
}

extension OptionsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OptionsCollectionViewCell", for: indexPath) as? OptionsCollectionViewCell else { return UICollectionViewCell() }
        cell.optionTitle.text = options[indexPath.row]
        cell.optionImage.image = UIImage(named: "boat")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ClinicViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width / 2) - 20, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
