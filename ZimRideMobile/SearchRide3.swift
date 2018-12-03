//
//  SearchRide3.swift
//  ZimRideMobile
//
//  Created by Nikita Lang on 11/24/18.
//  Copyright © 2018 Nikita Lang. All rights reserved.
//

import Foundation
import UIKit

class SearchRide3: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var titleImage: UIImageView!
    var navBar:UIView!
    
    var collectionView : UICollectionView!
    let Cell2ReuseIdentifier = "Cell2ReuseIdentifier"
    let headerReuseIdentifier = "headerReuseIdentifier"
    let padding: CGFloat = 8
    let headerHeight: CGFloat = 30
    var searchArray: [Search]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0.16, green: 0.49, blue: 0.68, alpha: 1.0)
        
        // Do any additional setup after loading the view.
        titleImage = UIImageView()
        titleImage.image = UIImage(named: "Header")
        titleImage.clipsToBounds = true
        titleImage.contentMode = .scaleToFill
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleImage)
        
        let note1 = Search(titleName: "Ithaca TO New York", message: "Departs Anytime", seats: "2", cost: "100", coverName: "Queen")
        let note2 = Search(titleName: "Ithaca TO Kansas", message: "Departs 11-10-2018", seats: "4", cost: "0", coverName: "Queen")
        let note3 = Search(titleName: "Ithaca TO Arizona", message: "Departs 12-02-2018", seats: "1", cost: "10", coverName: "Queen")
        let note4 = Search(titleName: "Tucson TO New York", message: "Departs Anytime", seats: "3", cost: "100", coverName: "Queen")
        let note5 = Search(titleName: "Ithaca TO Syracuse", message: "Departs Anytime", seats: "2", cost: "30", coverName: "Queen")
        let note6 = Search(titleName: "Syracuse TO Ithaca", message: "Departs 01-29-2019", seats: "4", cost: "25", coverName: "Queen")
        let note7 = Search(titleName: "Hong Kong TO Ithaca", message: "Departs Anytime", seats: "1", cost: "45", coverName: "Queen")
        searchArray = [note1, note2, note3, note4, note5, note6, note7, note1]
        
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
        collectionView.register(SearchViewCell.self, forCellWithReuseIdentifier: Cell2ReuseIdentifier)
        view.addSubview(collectionView)
        
        setupConstraints()
        self.initNavBar()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: view.topAnchor), titleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor), titleImage.widthAnchor.constraint(equalTo: view.widthAnchor), titleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor), titleImage.heightAnchor.constraint(equalToConstant: 80)])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 70),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    func initNavBar(){
        let viewWidth = Double(view.frame.width)
        let navHeight = 30.0
        self.navBar = UIView.init(frame: CGRect.init(x: 20, y: 100, width: viewWidth, height: navHeight))
        self.view.addSubview(self.navBar)
        
        let backImage = UIImage.init(named: "Back")
        
        let backButton = UIButton.init(frame: CGRect(x: 0, y: 0, width: 100, height: 28))
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(self, action: #selector(back), for: UIControl.Event.touchUpInside)
        self.navBar.addSubview(backButton)
    }
    
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell2ReuseIdentifier, for: indexPath) as! SearchViewCell
        let notess = searchArray[indexPath.item]
        cell.configure(for: notess)
        cell.setNeedsUpdateConstraints()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchArray.count
    }
    
    // MARK: - UICollectionViewDelegate (all of these methods are optional)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Run some code upon tapping a cell
        // For example, if we wanted to remove the cell upon tap:
        searchArray.remove(at: indexPath.item)
        collectionView.reloadData()
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // We want || padding IMAGE padding IMAGE padding IMAGE padding ||
        let length = (collectionView.frame.width - padding * 4)
        return CGSize(width: length, height: 100)
    }
}

