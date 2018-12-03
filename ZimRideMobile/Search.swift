//
//  Notification.swift
//  ZimRideMobile
//
//  Created by Nikita Lang on 11/29/18.
//  Copyright © 2018 Nikita Lang. All rights reserved.
//

import UIKit

class Search {

    var titleName: String
    var message: String
    var seats: String
    var cost: String
    var coverName: String
    
    init(titleName: String, message: String, seats: String, cost: String, coverName: String) {
        self.titleName = titleName
        self.message = message
        self.seats = seats
        self.cost = cost
        self.coverName = coverName
    }
}
