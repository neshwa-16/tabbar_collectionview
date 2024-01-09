//
//  CustomTabBar.swift
//  MerchantApp
//
//  Created by Neshwa on 04/01/24.
//

import UIKit
import Photos

class CustomTabBar : UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        setupMiddleButton()
    }
    
    func checkPhotoAccess() {
        let photos = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        if photos == .notDetermined {
            requestAccess()
        } else if photos == .authorized {
            self.navigate()
            print("access accepted")
        } else {
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                   UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
               }
        }
    }
    
    @objc func navigateToPhotos() {
        print("sell button tapped")
        checkPhotoAccess()
    }
    
    func requestAccess() {
        PHPhotoLibrary.requestAuthorization( { status in
            
            if status == .authorized {
                print("access accepted")
                self.navigate()
            } else {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: " Photos Access Denied", message: "App needs access to photos library", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(action)
                    self.present(alert, animated: true)
                }
            }
        })
    }
    
    func navigate() {
        DispatchQueue.main.async {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotosViewController") as! PhotosViewController
            //navigationController?.pushViewController(vc, animated: true)
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
    
    func setupMiddleButton() {
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 20, y: -20, width: 50, height: 50))
        middleButton.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.1
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.tabBar.addSubview(middleButton)
        
        middleButton.addTarget(self, action: #selector(navigateToPhotos), for: .touchUpInside)
        self.view.layoutIfNeeded()
    }
    
    
}
