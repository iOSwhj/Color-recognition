//
//  TableViewCell.swift
//  寻色
//
//  Created by Mengduan on 2024/3/12.
//

import UIKit
import SnapKit
class TableViewCell: UITableViewCell {
    
    lazy var timeLabel : UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var avatarImageView : UIImageView = {
       let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        return  imageview
    }()
    
    lazy var chatLabel : UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
     }
    
    private func configUI(){
        self.contentView.addSubview(timeLabel)
        self.contentView.addSubview(avatarImageView)
        self.contentView.addSubview(chatLabel)
        self.timeLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.contentView.snp.top).offset(8)
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.centerX.equalTo(self.contentView.snp.centerX)
        }
        
        self.avatarImageView.snp.makeConstraints{ make in
            make.right.equalTo(self.contentView.snp.right).offset(-38)
            make.top.equalTo(self.contentView.snp.top).offset(16)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        self.chatLabel.snp.makeConstraints{ make in
            make.top.equalTo(timeLabel.snp.bottom).offset(16)
            make.left.equalTo(self.contentView.snp.left).offset(64)
            make.right.equalTo(self.contentView.snp.right).offset(-64)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-8)
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}
