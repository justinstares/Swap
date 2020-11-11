//
//  UserTableViewCell.swift
//  Swap2
//
//  Created by Gillian Dibbs Laming on 11/8/20.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    var delegate: MyCellDelegate?
    var account: String = ""
    
    lazy var backView : UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 100))
        return view
    }()
  
    lazy var deleteButton: UIButton = {
        let btn = UIButton(frame:CGRect(x: self.frame.width - 20, y: 40, width: 30, height: 30))
        btn.isEnabled = true
        //btn.setTitle("testing", for: .normal)
        let image = UIImage(named: "delete")
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.addTarget(self, action: #selector(buttonAction1), for: .allTouchEvents)
        btn.setImage(image, for: .normal)
        btn.backgroundColor = UIColor.systemTeal
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    
    lazy var socialLogo: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: self.frame.width/2 - 100, y: 10, width: 180, height: 100))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @objc func buttonAction(_ sender:UIButton!) {
        delegate?.didTapButton(account: account)
        print("Button tapped")
    }
    @IBAction func buttonAction1(_ sender:UIButton!) {
        delegate?.didTapButton(account: account)
        print("Button tapped 1")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: true)
        if(super.isSelected){
            buttonAction(self.deleteButton)
        }
        

    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //addSubview(backView)
        addSubview(socialLogo)
        addSubview(deleteButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
protocol MyCellDelegate{
    func didTapButton(account: String)
}
    

