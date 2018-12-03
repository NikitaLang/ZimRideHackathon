//
//  NotificationViewCell.swift
//  ZimRideMobile
//
//  Created by Nikita Lang on 11/07/18.
//  Copyright © 2018 Nikita Lang. All rights reserved.
//

import UIKit

class SearchViewCell: UICollectionViewCell {
    
    var titleName: UILabel!
    var message: UILabel!
    var seats: UILabel!
    var cost: UILabel!
    var coverImageView: UIImageView!
    
    var price: UILabel!
    var seat: UILabel!
    
    let padding: CGFloat = 10
    let labelHeight: CGFloat = 16
    let coverImageWidth: CGFloat = 80
    let coverImageHeight: CGFloat = 80
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 6
        
        titleName = UILabel()
        titleName.translatesAutoresizingMaskIntoConstraints = false
        titleName.font = UIFont (name: "SF Pro", size: 20)
        
        message = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        message.font = UIFont (name: "SF Pro", size: 28)
        message.textColor = UIColor.gray
        
        seats = UILabel()
        seats.translatesAutoresizingMaskIntoConstraints = false
        seats.font = UIFont (name: "SF Pro", size: 28)
        
        cost = UILabel()
        cost.translatesAutoresizingMaskIntoConstraints = false
        cost.font = UIFont (name: "SF Pro", size: 28)
        
        coverImageView = UIImageView()
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.contentMode = .scaleAspectFit
        
        price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.text = "$"
        price.textAlignment = .right
        price.font = UIFont (name: "SF Pro", size: 40)
        
        seat = UILabel()
        seat.translatesAutoresizingMaskIntoConstraints = false
        seat.text = "Seats:"
        seat.textAlignment = .right
        seat.font = UIFont (name: "SF Pro", size: 28)
        
        contentView.addSubview(titleName)
        contentView.addSubview(message)
        contentView.addSubview(seats)
        contentView.addSubview(cost)
        contentView.addSubview(price)
        contentView.addSubview(seat)
        contentView.addSubview(coverImageView)
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            coverImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            coverImageView.heightAnchor.constraint(equalToConstant: coverImageHeight),
            coverImageView.widthAnchor.constraint(equalToConstant: coverImageWidth)
            ])
        
        
        NSLayoutConstraint.activate([
            titleName.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: padding),
            titleName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            titleName.heightAnchor.constraint(equalToConstant: labelHeight + 6)
            ])
        
        NSLayoutConstraint.activate([
            message.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: padding),
            message.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 8),
            message.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            seats.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            seats.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            seats.heightAnchor.constraint(equalToConstant: 30),
            seats.widthAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            seat.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            seat.trailingAnchor.constraint(equalTo: seats.leadingAnchor, constant: -10),
            seat.heightAnchor.constraint(equalToConstant: 30),
            seat.widthAnchor.constraint(equalToConstant: 80)
            ])
        
        NSLayoutConstraint.activate([
            cost.topAnchor.constraint(equalTo: seats.bottomAnchor, constant: padding),
            cost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cost.heightAnchor.constraint(equalToConstant: 30),
            cost.widthAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            price.topAnchor.constraint(equalTo: seats.bottomAnchor, constant: padding),
            price.trailingAnchor.constraint(equalTo: cost.leadingAnchor, constant: -10),
            price.heightAnchor.constraint(equalToConstant: 30),
            price.widthAnchor.constraint(equalToConstant: 30)
            ])
        
        super.updateConstraints()
    }
    
    func configure(for search: Search) {
        titleName.text = search.titleName
        message.text = search.message
        seats.text = search.seats
        cost.text = search.cost
        coverImageView.image = UIImage(named: search.coverName)
    }
    
    // MARK: - Private Helpers
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

