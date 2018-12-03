//
//  HomeScreen.swift
//  ZimRideMobile
//
//  Created by Nikita Lang on 11/24/18.
//  Copyright © 2018 Nikita Lang. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var titleImage : UIImageView!
    var titleLabel : UILabel!
    var collectionView : UICollectionView!
    var questionLabel : UILabel!
    var searchButton : UIButton!
    var postButton : UIButton!
    var notificationArray: [Notification]!
    
    let CellReuseIdentifier = "CellReuseIdentifier"
    let headerReuseIdentifier = "headerReuseIdentifier"
    let padding: CGFloat = 8
    let headerHeight: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.init(displayP3Red: 40/255, green: 124/255, blue: 174/255, alpha: 1)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        titleImage = UIImageView()
        titleImage.image = UIImage(named: "Header")
        titleImage.clipsToBounds = true
        titleImage.contentMode = .scaleToFill
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleImage)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Hi! You have new alerts:"
        titleLabel.font = UIFont(name: "SF Pro", size: 28)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .white
        view.addSubview(titleLabel)
        
        let note1 = Notification(titleName: "Alex's Ride to Evanston", message: "Your request has been denied.", coverName: "Alex")
        let note2 = Notification(titleName: "Lina's Ride to New York", message: "Lina has accepted your booking!", coverName: "Lina")
        let note3 = Notification(titleName: "Mohit's Ride to Ithaca", message: "'There is going to be a quick stop :)'", coverName: "Mohit")
        notificationArray = [note1, note2, note3]
        
        let layout = UICollectionViewFlowLayout()
        // scrollDirection can be vertical or horizontal
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.init(displayP3Red: 40/255, green: 124/255, blue: 174/255, alpha: 1)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(NotificationViewCell.self, forCellWithReuseIdentifier: CellReuseIdentifier)
        view.addSubview(collectionView)
        
        questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.text = "What are you looking for?"
        questionLabel.font = UIFont(name: "SF Pro", size: 28)
        questionLabel.textAlignment = .left
        questionLabel.textColor = .white
        view.addSubview(questionLabel)
        
        let searchImage = UIImage(named: "Search")
        searchButton = UIButton()
        searchButton.setImage(searchImage, for: .normal)
        searchButton.addTarget(self, action: #selector(self.searchButtonAction(sender:)), for: .touchUpInside)
        self.searchButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(searchButton)
        
        let postImage = UIImage(named: "Post")
        postButton = UIButton()
        postButton.setImage(postImage, for: .normal)
        postButton.addTarget(self, action: #selector(self.postButtonAction(sender:)), for: .touchUpInside)
        self.postButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(postButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: view.topAnchor), titleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor), titleImage.widthAnchor.constraint(equalTo: view.widthAnchor), titleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor), titleImage.heightAnchor.constraint(equalToConstant: 80)])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 20), titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12), titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75), titleLabel.heightAnchor.constraint(equalToConstant: 28)])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 250),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([questionLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 50), questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12), questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75), questionLabel.heightAnchor.constraint(equalToConstant: 28)])
        
        NSLayoutConstraint.activate([searchButton.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 12), searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12), searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12), searchButton.heightAnchor.constraint(equalToConstant: 70)])
        
        NSLayoutConstraint.activate([postButton.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 12), postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12), postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12), postButton.heightAnchor.constraint(equalToConstant: 70)])
    }
    
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellReuseIdentifier, for: indexPath) as! NotificationViewCell
        let notess = notificationArray[indexPath.item]
        cell.configure(for: notess)
        cell.setNeedsUpdateConstraints()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notificationArray.count
    }
    
    // MARK: - UICollectionViewDelegate (all of these methods are optional)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Run some code upon tapping a cell
        // For example, if we wanted to remove the cell upon tap:
        notificationArray.remove(at: indexPath.item)
        collectionView.reloadData()
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // We want || padding IMAGE padding IMAGE padding IMAGE padding ||
        let length = (collectionView.frame.width - padding * 4)
        return CGSize(width: length, height: 100)
    }
    
    @objc func searchButtonAction(sender: UIButton) {
        //TODO: Login
        let newScreen = SearchRide()
        self.navigationController?.pushViewController(newScreen, animated: true)
    }
    @objc func postButtonAction(sender: UIButton) {
        //TODO: Login
        let newScreen = PostRideViewController1()
        self.navigationController?.pushViewController(newScreen, animated: true)
    }
}
