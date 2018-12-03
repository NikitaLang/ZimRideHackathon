//
//  MapAnnotation.swift
//  ZimRideMobile
//
//  Created by Xinye Liu on 2018/12/1.
//  Copyright © 2018 Nikita Lang. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapAnnotation: NSObject, MKAnnotation{
    var coordinate:CLLocationCoordinate2D
    var title:String?
    var subtitle: String?
    
    init(coordinate:CLLocationCoordinate2D, title:String, subtitle: String){
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
