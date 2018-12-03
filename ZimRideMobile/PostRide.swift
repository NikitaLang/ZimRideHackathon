//
//  PostRide.swift
//  ZimRideMobile
//
//  Created by Nikita Lang on 11/24/18.
//  Copyright © 2018 Nikita Lang. All rights reserved.
//

import UIKit

class PostRide: UIViewController {
    
    var titleImage : UIImageView!
    var titleLabel : UILabel!
    var returnButton : UIButton!
    var filler : UITableView!
    var searchButton : UIButton!
    var postButton : UIButton!
    
    let CellReuseIdentifier = "CellReuseIdentifier"
    let headerReuseIdentifier = "headerReuseIdentifier"
    let padding: CGFloat = 8
    let headerHeight: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        titleImage = UIImageView()
        titleImage.image = UIImage(named: "loginImage")
        titleImage.clipsToBounds = true
        titleImage.contentMode = .scaleAspectFill
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleImage)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Post A Ride"
        titleLabel.font = UIFont(name: "Didot", size: 26)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.backgroundColor = UIColor.gray
        view.addSubview(titleLabel)
        
//        searchButton = UIButton()
//        searchButton.setTitle("Search A Ride", for: .normal)
//        searchButton.setTitleColor(UIColor.black, for: .normal)
//        searchButton.titleLabel!.font = UIFont(name: "Didot", size: 24)
//        searchButton.addTarget(self, action: #selector(self.searchButtonAction(sender:)), for: .touchUpInside)
//        self.searchButton.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(searchButton)
        
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([titleImage.topAnchor.constraint(equalTo: view.topAnchor), titleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor), titleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor), titleImage.heightAnchor.constraint(equalToConstant: 75)])
        
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 24), titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor), titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor), titleLabel.heightAnchor.constraint(equalToConstant: 48)])
        
    }
    @objc func searchButtonAction(sender: UIButton) {
        //TODO: Login
        let newScreen = SearchRide()
        self.navigationController?.pushViewController(newScreen, animated: true)
    }
    @objc func postButtonAction(sender: UIButton) {
        //TODO: Login
        let newScreen = PostRide()
        self.navigationController?.pushViewController(newScreen, animated: true)
    }
}
