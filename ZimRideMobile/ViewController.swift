//
//  ViewController.swift
//  ZimRideMobile
//
//  Created by Nikita Lang on 11/24/18.
//  Copyright © 2018 Nikita Lang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var logoImage:UIImageView!
    var signInImage: UIImageView!
    var signInButton: UIButton!
    
    var backGroundColor = UIColor.init(red: 0.16, green: 0.49, blue: 0.68, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = backGroundColor
        
        logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "loginLogo")
        logoImage.clipsToBounds = true
        logoImage.contentMode = .scaleToFill
        view.addSubview(logoImage)
        
        signInImage = UIImageView()
        signInImage.translatesAutoresizingMaskIntoConstraints = false
        signInImage.image = UIImage(named: "cornellLogo")
        signInImage.clipsToBounds = true
        signInImage.contentMode = .scaleAspectFit
        view.addSubview(signInImage)
        
        signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.backgroundColor = .white
        signInButton.setTitle("Login with Cornell NetID", for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.addTarget(self, action: #selector(pushHomeScreen), for: .touchUpInside)
        
        view.addSubview(signInButton)
        
        setupConstraints()
        
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 385),
            signInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -37.5),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 87.5),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
            
            ])
        
        NSLayoutConstraint.activate([
            signInImage.topAnchor.constraint(equalTo: signInButton.topAnchor),
            signInImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 37.5),
            signInImage.widthAnchor.constraint(equalToConstant: 50),
            signInImage.heightAnchor.constraint(equalToConstant: 50)
            
            ])
        

        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 147),
            logoImage.leadingAnchor.constraint(equalTo: signInImage.leadingAnchor),
            logoImage.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 167.5)
            
            ])
    }
    
    @objc func pushHomeScreen(){
        //TODO: change to actual home screen controller's name
        let homeController = HomeScreen()
        navigationController?.pushViewController(homeController, animated: true)
    }
    
    
    
}


