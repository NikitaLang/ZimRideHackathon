//
//  AddressTableViewCell.swift
//  ZimRideMobile
//
//  Created by Xinye Liu on 2018/12/1.
//  Copyright © 2018 Nikita Lang. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell {
    var titleLabel:UILabel!
    var subTitleLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.titleLabel = UILabel.init(frame: CGRect.init(x: 5, y: 2, width: self.frame.width - 20, height: 20))
        self.titleLabel.textColor = .black
        self.titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(titleLabel)
        
        self.subTitleLabel = UILabel.init(frame: CGRect.init(x: 5, y: 24, width: self.frame.width - 20, height: 20))
        self.subTitleLabel.textColor = .gray
        self.subTitleLabel.font = UIFont.systemFont(ofSize: 12)
        self.contentView.addSubview(subTitleLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        self.titleLabel.frame = CGRect.init(x: 5, y: 2, width: self.frame.width - 10, height: 20)
        self.subTitleLabel.frame = CGRect.init(x: 5, y: 24, width: self.frame.width - 10, height: 20)
    }

}
