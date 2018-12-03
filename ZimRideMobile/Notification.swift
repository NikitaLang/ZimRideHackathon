//
//  Notification.swift
//  ZimRideMobile
//
//  Created by Nikita Lang on 11/29/18.
//  Copyright © 2018 Nikita Lang. All rights reserved.
//

import UIKit

class Notification {

    var titleName: String
    var message: String
    var coverName: String
    
    init(titleName: String, message: String, coverName: String) {
        self.titleName = titleName
        self.message = message
        self.coverName = coverName
    }
}
