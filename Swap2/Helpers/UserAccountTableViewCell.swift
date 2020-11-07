//
//  UserAccountTableViewCell.swift
//  Swap2
//
//  Created by Gillian Dibbs Laming on 11/7/20.
//

import UIKit

class UserAccountTableViewCell: UITableViewCell {

    lazy var backView : UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 100))
        return view
    }()
    
  
    lazy var socialLogo: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: self.frame.width/2 - 50, y: 10, width: 180, height: 100))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(socialLogo)
    }
    
}
