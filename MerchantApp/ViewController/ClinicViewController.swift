//
//  ClinicViewController.swift
//  MerchantApp
//
//  Created by Neshwa on 05/01/24.
//

import UIKit

class ClinicViewController: UIViewController {

    @IBOutlet weak var clinicsView: UIView!
    @IBOutlet weak var doctorsView: UIView!
    @IBOutlet weak var clinicsCollectionView: UICollectionView!
    @IBOutlet weak var doctorsCollectionView: UICollectionView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var DoctorProfileCollectionView: UICollectionView!
    @IBOutlet weak var backActionView: UIView!
    
    var selectedIndexPath = 0
    let clinics = ["Dr. Terry's Dental Clinic", "ETS Clinic", "Dr. Mathew Memorial Clinic", "EMC Center", "LCC Clinic"]
    let doctors1 = [Doctors(name: "Dr. Ajay", designation: "Senior Cardiologist"),
                   Doctors(name: "Dr. Sham", designation: "Senior Neurologist"),
                   Doctors(name: "Dr. Rani", designation: "Senior ENT Consultant"),
                   Doctors(name: "Dr. Lily", designation: "Junior Cardiologist"),
                   Doctors(name: "Dr. Prath", designation: "Junior Pediatrition"),
    ]
    
    let doctors2 = [Doctors(name: "Dr. Khadeeja", designation: "Senior Cardiologist"),
                   Doctors(name: "Dr. Robin", designation: "Senior Neurologist"),
                   Doctors(name: "Dr. Drake", designation: "Senior ENT Consultant"),
                   Doctors(name: "Dr. Natalie", designation: "Junior Cardiologist"),
                   Doctors(name: "Dr. Kate", designation: "Junior Pediatrition"),
    ]
    let doctors3 = [Doctors(name: "Dr. Ross", designation: "Senior Cardiologist"),
                   Doctors(name: "Dr. Monica", designation: "Senior Neurologist"),
                   Doctors(name: "Dr. Chandler", designation: "Senior ENT Consultant"),
                   Doctors(name: "Dr. Joe", designation: "Junior Cardiologist"),
                   Doctors(name: "Dr. Phoebe", designation: "Junior Pediatrition"),
    ]
    
    let doctors4 = [Doctors(name: "Dr. Rachel", designation: "Senior Cardiologist"),
                   Doctors(name: "Dr. Job", designation: "Senior Neurologist"),
                   Doctors(name: "Dr. Lauv", designation: "Senior ENT Consultant"),
                   Doctors(name: "Dr. Grace", designation: "Junior Cardiologist"),
                   Doctors(name: "Dr. Jesse", designation: "Junior Pediatrition"),
    ]
    let doctors5 = [Doctors(name: "Dr. Michle", designation: "Senior Cardiologist"),
                   Doctors(name: "Dr. Huron", designation: "Senior Neurologist"),
                   Doctors(name: "Dr. John", designation: "Senior ENT Consultant"),
                   Doctors(name: "Dr. Jimmy", designation: "Junior Cardiologist"),
                   Doctors(name: "Dr. Francis", designation: "Junior Pediatrition"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clinicsCollectionView.delegate = self
        clinicsCollectionView.dataSource = self
        doctorsCollectionView.delegate = self
        doctorsCollectionView.dataSource = self
        DoctorProfileCollectionView.delegate = self
        DoctorProfileCollectionView.dataSource = self
        doctorsCollectionView.reloadData()
        DoctorProfileCollectionView.layer.cornerRadius = 13
       
        clinicsCollectionView.register(UINib(nibName: "ClinicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ClinicCollectionViewCell")
        doctorsCollectionView.register(UINib(nibName: "DoctorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DoctorCollectionViewCell")
        DoctorProfileCollectionView.register(UINib(nibName: "DoctorProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DoctorProfileCollectionViewCell")
        
        detailsView.isHidden = true
        DoctorProfileCollectionView.isPagingEnabled = true
    }
}

extension ClinicViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CloseViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == clinicsCollectionView {
            guard let cell = clinicsCollectionView.dequeueReusableCell(withReuseIdentifier: "ClinicCollectionViewCell", for: indexPath) as? ClinicCollectionViewCell else { return UICollectionViewCell ()}
            cell.clinicName.text = clinics[indexPath.row]
            return cell
        } else if collectionView == doctorsCollectionView {
            guard let cell = doctorsCollectionView.dequeueReusableCell(withReuseIdentifier: "DoctorCollectionViewCell", for: indexPath) as? DoctorCollectionViewCell else { return UICollectionViewCell ()}
            switch selectedIndexPath {
            case 0:
                cell.configure(with: doctors1[indexPath.row])
            case 1:
                cell.configure(with: doctors2[indexPath.row])
            case 2:
                cell.configure(with: doctors3[indexPath.row])
            case 3:
                cell.configure(with: doctors4[indexPath.row])
            case 4:
                cell.configure(with: doctors5[indexPath.row])
            default :
                print("Invalid")
            }
            return cell
        }
        else {
            guard let cell = DoctorProfileCollectionView.dequeueReusableCell(withReuseIdentifier: "DoctorProfileCollectionViewCell", for: indexPath) as? DoctorProfileCollectionViewCell else { return UICollectionViewCell () }
            cell.delegate = self
            return cell
        }
    }
    
    func closeViewAction(in cell: DoctorProfileCollectionViewCell) {
        if let indexPath = DoctorProfileCollectionView.indexPath(for: cell) {
            detailsView.isHidden = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == clinicsCollectionView {
            
            selectedIndexPath = indexPath.row
            doctorsCollectionView.reloadData()
            
        } else {
            
            detailsView.isHidden = false
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == clinicsCollectionView {
            return 10
        } else if collectionView == doctorsCollectionView {
            return 10
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == clinicsCollectionView {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        } else if collectionView == doctorsCollectionView {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
        else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == clinicsCollectionView {
            return CGSize(width: (collectionView.bounds.width / 3) - 20, height: 120)
        } else if collectionView == doctorsCollectionView {
            return CGSize(width: (collectionView.bounds.width / 2) - 20, height: 100)
        } else {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        }
    }
}

struct Doctors {
    var name : String
    var designation : String
}
