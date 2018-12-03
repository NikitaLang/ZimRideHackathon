//
//  PostRideViewController4.swift
//  ZimRideMobile
//
//  Created by Xinye Liu on 2018/12/2.
//  Copyright © 2018 Nikita Lang. All rights reserved.
//

import UIKit

class PostRideViewController4: UIViewController {
    
    var navBar:UIView!
    var viewWidth:Double!
    var postPanel:UIView!
    var notePanel:UIView!
    var titleImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0.16, green: 0.49, blue: 0.68, alpha: 1.0)
        self.edgesForExtendedLayout = []
        self.initview()
        
        titleImage = UIImageView()
        titleImage.image = UIImage(named: "Header")
        titleImage.clipsToBounds = true
        titleImage.contentMode = .scaleToFill
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleImage)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: view.topAnchor), titleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor), titleImage.widthAnchor.constraint(equalTo: view.widthAnchor), titleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor), titleImage.heightAnchor.constraint(equalToConstant: 80)])
    }
    
    func initview(){
        self.viewWidth = Double(view.frame.width)
        self.initNavBar()
        self.initTopBarView()
        self.initPost()
        self.initNote()
    }
    
    func initNavBar(){
        let navHeight = 30.0
        self.navBar = UIView.init(frame: CGRect.init(x: 20, y: 100, width: self.viewWidth, height: navHeight))
        self.view.addSubview(self.navBar)
        
        let backImage = UIImage.init(named: "Back")
        
        let backButton = UIButton.init(frame: CGRect(x: 0, y: 0, width: 100, height: 28))
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(self, action: #selector(back), for: UIControl.Event.touchUpInside)
        self.navBar.addSubview(backButton)
    }
    
    func initTopBarView(){
        var image = UIImage.init(named: "bg")
        let edge = UIEdgeInsets.init(top: 0, left: 127, bottom: 9, right: 121)
        image = image?.resizableImage(withCapInsets: edge, resizingMode: UIImage.ResizingMode.stretch)
        self.navigationController?.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        self.navigationItem.hidesBackButton = true
    }
    
    func initPost(){
        self.postPanel = UIView.init(frame: CGRect.init(x: 10, y: 600, width: self.viewWidth, height: 50))
        self.view.addSubview(self.postPanel)
        
        let postButton = UIButton.init(frame: CGRect.init(x: (self.viewWidth - 300)/2, y: 0, width: 300, height: 52))
        postButton.backgroundColor = .white
        postButton.setTitle("Post", for: .normal)
        postButton.setTitleColor(.black, for: .normal)
        postButton.contentHorizontalAlignment = .center
        postButton.layer.cornerRadius = 26
        postButton.addTarget(self, action: #selector(post), for: .touchUpInside)
        self.postPanel.addSubview(postButton)
        
    }
    
    func initNote(){
        self.notePanel = UIView.init(frame: CGRect.init(x: 10, y: 130, width: self.viewWidth, height: 430))
        self.view.addSubview(notePanel)
        
        let noteLabel = UILabel.init(frame: CGRect.init(x: 10, y: 0, width: self.viewWidth - 20, height: 50))
        noteLabel.text = "Notes"
        noteLabel.textColor = .white
        noteLabel.textAlignment = .left
        noteLabel.font = UIFont.systemFont(ofSize: 24)
        self.notePanel.addSubview(noteLabel)
        
        let noteTextfField = UITextField.init(frame: CGRect.init(x: 10, y: 50, width: self.viewWidth - 40, height: 330))
        noteTextfField.backgroundColor = .white
        noteTextfField.placeholder = "Any additional details for passengers"
        noteTextfField.layer.cornerRadius = 4
        noteTextfField.contentVerticalAlignment = .top
        noteTextfField.textAlignment = .left
        self.notePanel.addSubview(noteTextfField)
        
    }
    
    
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //TODO finsh this function in order to back to home screen.
    @objc func post(){
        navigationController!.popToViewController(navigationController!.viewControllers[1] as UIViewController, animated: true)
    }

}
