//
//  PostRideViewController2.swift
//  ZimRideMobile
//
//  Created by Xinye Liu on 2018/11/30.
//  Copyright © 2018 Nikita Lang. All rights reserved.
//

import Foundation
import UIKit

enum RideType:uint {
    case round = 1, single = 2
}

class PostRideViewController2: UIViewController {
    var navBar:UIView!
    var viewWidth:Double!
    var ridePanel:UIView!
    var timePanel:UIView!
    var nextPanel:UIView!
    
    var depatureTextField: UITextField!
    var depatureTimeTextField: UITextField!
    var returnDateTextField:UITextField!
    var returnTimeTextField:UITextField!
    
    var rideType:RideType!
    
    var titleImage: UIImageView!
    
    let roundTag = 1
    let singleTag = 2
    
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
        self.initRidePanel()
        self.initTime()
        self.initNext()
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
    
    func initRidePanel(){
        let panelHeight = 50.0
        
        self.ridePanel = UIView.init(frame: CGRect.init(x: 10, y: 140, width: self.viewWidth, height: panelHeight))
        self.view.addSubview(self.ridePanel)
        
        let buttonWidth = (self.viewWidth - 50)/2.0
        let buttonHeight = 40.0
        
        let leftButton = UIButton.init(frame: CGRect.init(x: 10, y: 10, width: buttonWidth, height: buttonHeight))
        leftButton.tag = Int(RideType.round.rawValue)
        leftButton.backgroundColor = .white
        leftButton.setTitle("Round Trip", for: .normal)
        leftButton.setTitleColor(.lightGray, for: .normal)
        leftButton.setTitleColor(.black, for: .selected)
        leftButton.addTarget(self, action: #selector(selectRide(_:)), for: .touchUpInside)
        leftButton.layer.cornerRadius = 4
        self.ridePanel.addSubview(leftButton)
        self.ridePanel.isUserInteractionEnabled = true
        
        let rightButton = UIButton.init(frame: CGRect.init(x: viewWidth - 35 - buttonWidth, y: 10, width: buttonWidth, height: buttonHeight))
        rightButton.tag = Int(RideType.single.rawValue)
        rightButton.backgroundColor = .white
        rightButton.setTitle("Single Trip", for: .normal)
        rightButton.setTitleColor(.lightGray, for: .normal)
        rightButton.setTitleColor(.black, for: .selected)
        rightButton.addTarget(self, action: #selector(selectRide(_:)), for: .touchUpInside)
        rightButton.layer.cornerRadius = 4
        self.ridePanel.addSubview(rightButton)
    }
    
    func initTime(){
        self.timePanel = UIView.init(frame: CGRect.init(x: 10, y: 220, width: self.viewWidth - 20, height: 400))
        self.view.addSubview(self.timePanel)
        
        let depatureLable = UILabel.init(frame: CGRect.init(x: 10, y: 10, width: 80, height: 52))
        depatureLable.text = "Departure: "
        depatureLable.textAlignment = .right
        depatureLable.adjustsFontSizeToFitWidth = true
        depatureLable.textColor = .white
        depatureLable.layer.cornerRadius = 4
        self.timePanel.addSubview(depatureLable)
        
        depatureTextField = UITextField.init(frame: CGRect.init(x: 100, y: 10, width: (self.viewWidth ) - 150, height: 52))
        depatureTextField.backgroundColor = .white
        depatureTextField.textColor = .black
        depatureTextField.layer.cornerRadius = 4
        self.timePanel.addSubview(depatureTextField)
        
        let depaDatePicker = UIDatePicker()
        depaDatePicker.locale = NSLocale(localeIdentifier: "en_US") as Locale
        depaDatePicker.datePickerMode = UIDatePicker.Mode.date
        depaDatePicker.addTarget(self, action: #selector(depaDate), for: .valueChanged)
        depaDatePicker.layer.backgroundColor = UIColor.white.cgColor
        depaDatePicker.layer.masksToBounds = true
        
        depatureTextField.inputView = depaDatePicker
        
        let depatureTimeLable = UILabel.init(frame: CGRect.init(x: 10, y: 72, width: 80, height: 52))
        depatureTimeLable.text = "Time: "
        depatureTimeLable.textAlignment = .right
        depatureTimeLable.adjustsFontSizeToFitWidth = true
        depatureTimeLable.textColor = .white
        depatureTimeLable.layer.cornerRadius = 4
        self.timePanel.addSubview(depatureTimeLable)
        
        depatureTimeTextField = UITextField.init(frame: CGRect.init(x: 100, y: 72, width: (self.viewWidth ) - 150, height: 52))
        depatureTimeTextField.backgroundColor = .white
        depatureTimeTextField.textColor = .black
        depatureTimeTextField.layer.cornerRadius = 4
        self.timePanel.addSubview(depatureTimeTextField)
        
        let depaTimePicker = UIDatePicker()
        depaTimePicker.locale = NSLocale(localeIdentifier: "en_US") as Locale
        depaTimePicker.datePickerMode = UIDatePicker.Mode.time
        depaTimePicker.addTarget(self, action: #selector(depaTime), for: .valueChanged)
        depaTimePicker.layer.backgroundColor = UIColor.white.cgColor
        depaTimePicker.layer.masksToBounds = true
        
        depatureTimeTextField.inputView = depaTimePicker
        
        let returnDateLable = UILabel.init(frame: CGRect.init(x: 10, y: 134, width: 80, height: 52))
        returnDateLable.text = "Return: "
        returnDateLable.textAlignment = .right
        returnDateLable.adjustsFontSizeToFitWidth = true
        returnDateLable.textColor = .white
        returnDateLable.layer.cornerRadius = 4
        self.timePanel.addSubview(returnDateLable)
        
        returnDateTextField = UITextField.init(frame: CGRect.init(x: 100, y: 134, width: (self.viewWidth ) - 150, height: 52))
        returnDateTextField.backgroundColor = .white
        returnDateTextField.textColor = .black
        returnDateTextField.layer.cornerRadius = 4
        self.timePanel.addSubview(returnDateTextField)
        
        let returnDatePicker = UIDatePicker()
        returnDatePicker.locale = NSLocale(localeIdentifier: "en_US") as Locale
        returnDatePicker.datePickerMode = UIDatePicker.Mode.date
        returnDatePicker.addTarget(self, action: #selector(returnDate), for: .valueChanged)
        returnDatePicker.layer.backgroundColor = UIColor.white.cgColor
        returnDatePicker.layer.masksToBounds = true
        
        returnDateTextField.inputView = returnDatePicker
        
        let returnTimeLable = UILabel.init(frame: CGRect.init(x: 10, y: 196, width: 80, height: 52))
        returnTimeLable.text = "Time"
        returnTimeLable.textAlignment = .right
        returnTimeLable.adjustsFontSizeToFitWidth = true
        returnTimeLable.textColor = .white
        returnTimeLable.layer.cornerRadius = 4
        self.timePanel.addSubview(returnTimeLable)
        
        returnTimeTextField = UITextField.init(frame: CGRect.init(x: 100, y: 196, width: (self.viewWidth ) - 150, height: 52))
        returnTimeTextField.backgroundColor = .white
        returnTimeTextField.textColor = .black
        returnTimeTextField.layer.cornerRadius = 4
        self.timePanel.addSubview(returnTimeTextField)
        
        let returnTimePicker = UIDatePicker()
        returnTimePicker.locale = NSLocale(localeIdentifier: "en_US") as Locale
        returnTimePicker.datePickerMode = UIDatePicker.Mode.time
        returnTimePicker.addTarget(self, action: #selector(returnTime), for: .valueChanged)
        returnTimePicker.layer.backgroundColor = UIColor.white.cgColor
        returnTimePicker.layer.masksToBounds = true
        
        
        returnTimeTextField.inputView = returnTimePicker
        
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(dismissPicker))
        depatureTextField.inputAccessoryView = toolBar
        depatureTimeTextField.inputAccessoryView = toolBar
        returnDateTextField.inputAccessoryView = toolBar
        returnTimeTextField.inputAccessoryView = toolBar
    
        
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func selectRide(_ sender: UIButton){
        let array = self.ridePanel.subviews
        for view in array{
            if view is UIButton{
                let button = view as! UIButton
                button.isSelected = false
            }
        }
        sender.isSelected = true
        self.rideType = RideType(rawValue: uint(sender.tag))
        self.switchInputControl()
    }
    
    func switchInputControl(){
        if self.rideType == RideType.round{
            self.returnTimeTextField.isEnabled = true
            self.returnDateTextField.isEnabled = true
            self.returnTimeTextField.backgroundColor = .white
            self.returnDateTextField.backgroundColor = .white
        }
        else if self.rideType == RideType.single{
            self.returnDateTextField.isEnabled = false
            self.returnTimeTextField.isEnabled = false
            self.returnDateTextField.backgroundColor = .lightGray
            self.returnTimeTextField.backgroundColor = .lightGray
        }
    }
    
    @objc func nextPage(){
        let vc = PostRideViewController3()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func depaDate(depaDatepicker:UIDatePicker){
        let format = DateFormatter()
        let date = depaDatepicker.date
        format.dateFormat = "MM-dd-YYYY"
        let dateStr = format.string(from: date)
        self.depatureTextField.text = dateStr
        
    }
    
    @objc func depaTime(depaTimepicker:UIDatePicker){
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let time = depaTimepicker.date
        let dateStr = format.string(from: time)
        self.depatureTimeTextField.text = dateStr
        
    }
    
    @objc func returnDate(returnDatepicker:UIDatePicker){
        let format = DateFormatter()
        let date = returnDatepicker.date
        format.dateFormat = "MM-dd-YYYY"
        let dateStr = format.string(from: date)
        self.returnDateTextField.text = dateStr
        
    }
    
    @objc func returnTime(returnTimepicker:UIDatePicker){
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let time = returnTimepicker.date
        let dateStr = format.string(from: time)
        self.returnTimeTextField.text = dateStr
        
    }
    
    @objc func dismissPicker() {
        
        view.endEditing(true)
        
    }
}
extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}
