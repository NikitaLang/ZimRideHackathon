//
//  NotificationViewCell.swift
//  ZimRideMobile
//
//  Created by Nikita Lang on 11/07/18.
//  Copyright © 2018 Nikita Lang. All rights reserved.
//

import UIKit

class NotificationViewCell: UICollectionViewCell {
    
    var titleName: UILabel!
    var message: UILabel!
    var coverImageView: UIImageView!
    
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
        titleName.textColor = UIColor.gray
        
        message = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        message.font = UIFont (name: "SF Pro", size: 28)
        
        coverImageView = UIImageView()
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(titleName)
        contentView.addSubview(message)
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
        
        super.updateConstraints()
    }
    
    func configure(for notification: Notification) {
        titleName.text = notification.titleName
        message.text = notification.message
        coverImageView.image = UIImage(named: notification.coverName)
    }
    
    // MARK: - Private Helpers
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

