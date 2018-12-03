//
//  SearchRide.swift
//  ZimRideMobile
//
//  Created by Nikita Lang on 11/24/18.
//  Copyright © 2018 Nikita Lang. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class SearchRide: UIViewController {
    
    var viewWidth:Double!
    var navBar:UIView!
    var pathPanel:UIView!
    var fromSubPanel:UIView!
    var toSubPanel:UIView!
    var fromTextfield:UITextField!
    var toTextfield:UITextField!
    var mainMapView:MKMapView!
    var nextPanel:UIView!
    
    var fromField:String?
    var toField:String?
    
    var addressTableView:UITableView!
    var addressList:NSMutableArray!
    
    var geocoder:CLGeocoder!
    
    var currentAddressType:Int!
    
    var fromPlacemark:CLPlacemark?
    var toPlacemark:CLPlacemark?
    
    var fromAnnotation:MapAnnotation!
    var toAnnotation:MapAnnotation!
    
    var titleImage: UIImageView!
    
    let fromTag = 110
    let toTag = 111
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0.16, green: 0.49, blue: 0.68, alpha: 1.0)
        self.edgesForExtendedLayout = []
        self.geocoder = CLGeocoder()
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
        self.intiPathPanel()
        self.initMapView()
        self.initNext()
        self.initAdressTableView()
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
    
    func intiPathPanel(){
        let pathHeight = 150.0
        
        self.pathPanel = UIView.init(frame: CGRect.init(x: 0, y: 160, width: self.viewWidth, height: pathHeight))
        self.view.addSubview(self.pathPanel)
        
        
        self.fromSubPanel = UIView.init(frame: CGRect.init(x: 10, y: 10, width: self.viewWidth - 30, height: 52))
        self.pathPanel.addSubview(self.fromSubPanel)
        
        self.toSubPanel = UIView.init(frame: CGRect.init(x: 10, y: 78, width: self.viewWidth - 30, height: 52))
        self.pathPanel.addSubview(self.toSubPanel)
        
        //from
        let fromLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 120, height: 52))
        fromLabel.textColor = .white
        fromLabel.text = "Starting From: "
        fromLabel.textAlignment = .right
        fromLabel.adjustsFontSizeToFitWidth = true
        self.fromSubPanel.addSubview(fromLabel)
        
        let fromTextField = UITextField.init(frame: CGRect.init(x: 130, y: 0, width: self.viewWidth - 150, height: 52))
        self.fromTextfield = fromTextField
        fromTextField.tag = fromTag
        fromTextField.backgroundColor = .white
        fromTextField.layer.cornerRadius = 4
        fromTextField.delegate = self
        self.fromTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        self.fromSubPanel.addSubview(fromTextField)
        
        //to
        let toLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 120, height: 52))
        toLabel.textColor = .white
        toLabel.text = "Going To: "
        toLabel.textAlignment = .right
        toLabel.adjustsFontSizeToFitWidth = true
        self.toSubPanel.addSubview(toLabel)
        
        let toTextField = UITextField.init(frame: CGRect.init(x: 130, y: 0, width: self.viewWidth - 150, height: 52))
        self.toTextfield = toTextField
        toTextField.tag = toTag
        toTextField.backgroundColor = .white
        self.toTextfield.delegate = self
        toTextField.layer.cornerRadius = 4
        self.toTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        self.toSubPanel.addSubview(toTextField)
        
    }
    
    func initAdressTableView(){
        self.addressTableView = UITableView.init(frame: CGRect.zero)
        self.addressTableView.isHidden = true
        self.addressTableView.dataSource = self
        self.addressTableView.delegate = self
        self.addressTableView.register(AddressTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.addressTableView)
        self.addressList = NSMutableArray.init(capacity: 0)
    }
    
    func initMapView(){
        self.mainMapView = MKMapView(frame: CGRect.init(x: 10, y: 320, width: self.viewWidth - 20, height: 250))
        self.view.addSubview(self.mainMapView)
        
        self.mainMapView.delegate = self
        self.mainMapView.showsUserLocation = true
        
        let latitudeDelta = self.mainMapView.region.span.latitudeDelta * 0.5
        let longitudeDelta = self.mainMapView.region.span.longitudeDelta * 0.5
        let span = MKCoordinateSpan.init(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let region = MKCoordinateRegion.init(center: self.mainMapView.centerCoordinate, span: span)
        self.mainMapView .setRegion(region, animated: true)
        
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
    
    
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextPage(){
        let vc = SearchRide2()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        self.currentAddressType = textField.tag
        if (textField.text?.count)! > 2 {
            self.searchPlace(input: textField.text) { (placemarks)->Void in
                if (placemarks != nil) {
                    self.addressList.removeAllObjects()
                    self.addressList.addObjects(from: placemarks!)
                    var frame:CGRect
                    var height:CGFloat
                    var maxHeight:CGFloat
                    if self.currentAddressType == self.fromTag {
                        frame = self.fromSubPanel.convert(self.fromTextfield.frame, to: self.view)
                    }else{
                        frame = self.toSubPanel.convert(self.toTextfield.frame, to: self.view)
                    }
                    
                    maxHeight = (self.view.frame.height - frame.maxY)
                    height = CGFloat(self.addressList.count) * 51.0
                    if height > maxHeight {
                        height = maxHeight
                    }
                    
                    self.addressTableView.frame = CGRect.init(x: frame.minX, y: frame.maxY, width: frame.width, height: height)
                    self.addressTableView.isHidden = false
                    self.addressTableView.reloadData()
                }else{
                    self.addressTableView.isHidden = true
                }
            }
        }else{
            self.addressTableView.isHidden = true
        }
    }
    
    func searchPlace(input: String!,completionHandler:@escaping(([CLPlacemark]?)->Void)){
        self.geocoder.geocodeAddressString(input) { (placemarks, error)->Void in
            if error == nil && placemarks!.count > 0 {
                completionHandler(placemarks)
            }else{
                completionHandler(nil)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count == 1 {
            let touch = touches.first
            if !(touch?.view is UITextField) && !(touch?.view is UITableView)  {
                self.toTextfield.resignFirstResponder()
                self.fromTextfield.resignFirstResponder()
            }
        }
    }
    
}
extension SearchRide:MKMapViewDelegate{
    
}

extension SearchRide:UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.addressTableView.isHidden = true
    }
}

extension SearchRide:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.addressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AddressTableViewCell
        let placemark = self.addressList[indexPath.row] as! CLPlacemark
        cell.titleLabel?.text = placemark.name
        cell.subTitleLabel?.text = placemark.locality
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  self.currentAddressType == self.fromTag{
            self.fromPlacemark = self.addressList?[indexPath.row] as? CLPlacemark
            self.fromField = self.fromPlacemark?.name
            self.fromTextfield.resignFirstResponder()
            self.fromTextfield.text = self.fromField
            if  self.fromAnnotation != nil {
                self.mainMapView.removeAnnotation(self.fromAnnotation)
            }
            self.fromAnnotation = MapAnnotation.init(coordinate: (self.fromPlacemark?.location?.coordinate)!, title: "origin", subtitle: (self.fromPlacemark?.name)!)
            self.mainMapView.addAnnotation(self.fromAnnotation)
        }else{
            self.toPlacemark = self.addressList?[indexPath.row] as? CLPlacemark
            self.toField = self.toPlacemark?.name
            self.toTextfield.resignFirstResponder()
            self.toTextfield.text = self.toField
            if self.toAnnotation != nil {
                self.mainMapView.removeAnnotation(self.toAnnotation)
            }
            self.toAnnotation = MapAnnotation.init(coordinate: (self.toPlacemark?.location?.coordinate)!, title: "destination", subtitle: (self.toPlacemark?.name)!)
            self.mainMapView.addAnnotation(self.toAnnotation)
        }
    }
}
