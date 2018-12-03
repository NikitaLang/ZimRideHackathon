//
//  PostRideViewController3.swift
//  ZimRideMobile
//
//  Created by Xinye Liu on 2018/12/2.
//  Copyright © 2018 Nikita Lang. All rights reserved.
//

import UIKit

enum PaymentType:uint {
    case cash = 1, paypal = 2, both = 3
}

class PostRideViewController3: UIViewController {
    
    var navBar:UIView!
    var viewWidth:Double!
    var numberPanel:UIView!
    var payPanel:UIView!
    var paymentPanel:UIView!
    var nextPanel:UIView!
    var infoPanel: UIView!
    
    var titleImage: UIImageView!
    
    var paymentType:PaymentType!
    
    let cashTag = 1
    let paypalTag = 2
    let bothTag = 3

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
        self.initNext()
        self.initNumber()
        self.initPay()
        self.initPayment()
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
    
    func initNext(){
        self.nextPanel = UIView.init(frame: CGRect.init(x: 10, y: 600, width: self.viewWidth, height: 50))
        self.view.addSubview(self.nextPanel)
        
        let nextButton = UIButton.init(frame: CGRect.init(x: (self.viewWidth - 300)/2, y: 0, width: 300, height: 52))
        nextButton.backgroundColor = .white
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.contentHorizontalAlignment = .center
        nextButton.layer.cornerRadius = 26
        nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        self.nextPanel.addSubview(nextButton)
        
    }
    
    func initNumber(){
        self.numberPanel = UIView.init(frame: CGRect.init(x: 10, y: 130, width: self.viewWidth, height: 130))
        self.view.addSubview(self.numberPanel)
        
        let textLabel = UILabel.init(frame: CGRect.init(x: 10, y: 5, width: self.viewWidth - 30, height: 30))
        textLabel.text = "Number of available seats?"
        textLabel.textColor = .white
        textLabel.textAlignment = .left
        self.numberPanel.addSubview(textLabel)
        
        let numberTextField = UITextField.init(frame: CGRect.init(x: 10, y: 50, width: 70, height: 70))
        numberTextField.backgroundColor = .white
        numberTextField.textColor = .black
        numberTextField.layer.cornerRadius = 4
        numberTextField.textAlignment = .center
        numberTextField.adjustsFontSizeToFitWidth = true
        self.numberPanel.addSubview(numberTextField)
        
        let numberLabel = UILabel.init(frame: CGRect.init(x: 90, y: 50, width: 50, height: 70))
        numberLabel.text = "seats"
        numberLabel.textColor = .white
        numberLabel.textAlignment = .center
        self.numberPanel.addSubview(numberLabel)
        
    }
    
    func initPay(){
        self.payPanel = UIView.init(frame: CGRect.init(x: 10, y: 270, width: self.viewWidth, height: 130))
        self.view.addSubview(self.payPanel)
        
        let textLabel = UILabel.init(frame: CGRect.init(x: 10, y: 5, width: self.viewWidth - 30, height: 30))
        textLabel.text = "How much do you want each passenger to contribute?"
        textLabel.textColor = .white
        textLabel.textAlignment = .left
        textLabel.adjustsFontSizeToFitWidth = true
        self.payPanel.addSubview(textLabel)
        
        let numberTextField = UITextField.init(frame: CGRect.init(x: 10, y: 50, width: 70, height: 70))
        numberTextField.backgroundColor = .white
        numberTextField.textColor = .black
        numberTextField.layer.cornerRadius = 4
        numberTextField.textAlignment = .center
        numberTextField.adjustsFontSizeToFitWidth = true
        self.payPanel.addSubview(numberTextField)
        
        let numberLabel = UILabel.init(frame: CGRect.init(x: 90, y: 50, width: 100, height: 70))
        numberLabel.text = "each way"
        numberLabel.textColor = .white
        numberLabel.textAlignment = .center
        self.payPanel.addSubview(numberLabel)
        
        
    }
    
    func initPayment(){
        self.paymentPanel = UIView.init(frame: CGRect.init(x: 10, y: 410, width: self.viewWidth, height: 190))
        self.view.addSubview(self.paymentPanel)
        
        let textLabel = UILabel.init(frame: CGRect.init(x: 10, y: 5, width: self.viewWidth - 30, height: 30))
        textLabel.text = "Accepted forms of payment"
        textLabel.textColor = .white
        textLabel.textAlignment = .left
        textLabel.adjustsFontSizeToFitWidth = true
        self.paymentPanel.addSubview(textLabel)
        
        let cashButton = UIButton.init(frame: CGRect.init(x: 10, y: 50, width: 150, height: 30))
        cashButton.tag = Int(PaymentType.cash.rawValue)
        cashButton.backgroundColor = .white
        cashButton.setTitle("Cash", for: .normal)
        cashButton.setTitleColor(.lightGray, for: .normal)
        cashButton.setTitleColor(.black, for: .selected)
        cashButton.addTarget(self, action: #selector(selectPayment(_:)), for: .touchUpInside)
        cashButton.layer.cornerRadius = 4
        self.paymentPanel.addSubview(cashButton)
        self.paymentPanel.isUserInteractionEnabled = true
        
        let paypalButton = UIButton.init(frame: CGRect.init(x: 10, y: 90, width: 150, height: 30))
        paypalButton.tag = Int(PaymentType.paypal.rawValue)
        paypalButton.backgroundColor = .white
        paypalButton.setTitle("Paypal", for: .normal)
        paypalButton.setTitleColor(.lightGray, for: .normal)
        paypalButton.setTitleColor(.black, for: .selected)
        paypalButton.addTarget(self, action: #selector(selectPayment(_:)), for: .touchUpInside)
        paypalButton.layer.cornerRadius = 4
        self.paymentPanel.addSubview(paypalButton)
        
        let bothButton = UIButton.init(frame: CGRect.init(x: 10, y: 130, width: 150, height: 30))
        bothButton.tag = Int(PaymentType.both.rawValue)
        bothButton.backgroundColor = .white
        bothButton.setTitle("Cash & Paypal", for: .normal)
        bothButton.setTitleColor(.lightGray, for: .normal)
        bothButton.setTitleColor(.black, for: .selected)
        bothButton.addTarget(self, action: #selector(selectPayment(_:)), for: .touchUpInside)
        bothButton.layer.cornerRadius = 4
        self.paymentPanel.addSubview(bothButton)
        
        self.infoPanel = UIView.init(frame: CGRect.init(x: 170, y: 50, width: self.viewWidth - 190, height: 150))
        infoPanel.isHidden = true
        self.paymentPanel.addSubview(infoPanel)
        
        let infoLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 60, height: 30))
        infoLabel.text = "Paypal"
        infoLabel.textColor = .black
        infoLabel.textAlignment = .center
        infoLabel.adjustsFontSizeToFitWidth = true
        self.infoPanel.addSubview(infoLabel)
        
        let infoTextField = UITextField.init(frame: CGRect.init(x: 70, y: 0, width: self.viewWidth - 265, height: 30))
        infoTextField.backgroundColor = .white
        infoTextField.textColor = .black
        infoTextField.layer.cornerRadius = 4
        self.infoPanel.addSubview(infoTextField)
        
        let nameLabel = UILabel.init(frame: CGRect.init(x: 0, y: 38, width: 60, height: 30))
        nameLabel.text = "Name"
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontSizeToFitWidth = true
        self.infoPanel.addSubview(nameLabel)
        
        let firstTextField = UITextField.init(frame: CGRect.init(x: 70, y: 38, width: self.viewWidth - 342, height: 30))
        firstTextField.backgroundColor = .white
        firstTextField.textColor = .black
        firstTextField.layer.cornerRadius = 4
        firstTextField.placeholder = "First"
        firstTextField.textAlignment = .center
        firstTextField.adjustsFontSizeToFitWidth = true
        self.infoPanel.addSubview(firstTextField)
        
        let lastTextField = UITextField.init(frame: CGRect.init(x: 147, y: 38, width: self.viewWidth - 342, height: 30))
        lastTextField.backgroundColor = .white
        lastTextField.textColor = .black
        lastTextField.layer.cornerRadius = 4
        lastTextField.placeholder = "Last"
        lastTextField.textAlignment = .center
        lastTextField.adjustsFontSizeToFitWidth = true
        self.infoPanel.addSubview(lastTextField)
    }
    
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextPage(){
        let vc = PostRideViewController4()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func selectPayment(_ sender: UIButton){
        let array = self.paymentPanel.subviews
        for view in array{
            if view is UIButton{
                let button = view as! UIButton
                button.isSelected = false
            }
        }
        sender.isSelected = true
        self.paymentType = PaymentType(rawValue: uint(sender.tag))
        self.paymentControl()
    }
    
    func paymentControl(){
        if self.paymentType == PaymentType.cash{
            self.infoPanel.isHidden = true
        
        }
        else {
            self.infoPanel.isHidden = false
        }
        
    }


}
