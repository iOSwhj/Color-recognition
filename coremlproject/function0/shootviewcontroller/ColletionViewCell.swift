//
//  ColletionViewCell.swift
//  sheet计设
//
//  Created by Mengduan on 2024/3/14.
//

import UIKit

class ColletionViewCell : UICollectionViewCell{
    
    lazy var textLabel00 : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: -30, width: 360, height: 50))
        label.center.x = self.contentView.center.x
        label.textAlignment = .center
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var textLabel0 : UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 50-30, width: 360, height: 50))
        label.center.x = self.contentView.center.x
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var textLabel11 : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 120-30, width: 360, height: 50))
        label.center.x = self.contentView.center.x
        label.textAlignment = .center
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var textLabel1 : UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 170-30, width: 360, height: 50))
        label.center.x = self.contentView.center.x
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    lazy var textLabel22 : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 240-30, width: 360, height: 50))
        label.center.x = self.contentView.center.x
        label.textAlignment = .center
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var textLabel2 : UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 290-30, width: 360, height: 50))
        label.center.x = self.contentView.center.x
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    lazy var textLabel33 : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 360-30, width: 360, height: 50))
        label.center.x = self.contentView.center.x
        label.textAlignment = .center
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        label.textColor = .white
        return label
    }()
    lazy var textLabel3 : UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 410-30, width: 360, height: 50))
        label.center.x = self.contentView.center.x
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(textLabel0)
        self.contentView.addSubview(textLabel1)
        self.contentView.addSubview(textLabel2)
        self.contentView.addSubview(textLabel3)
        self.contentView.addSubview(textLabel00)
        self.contentView.addSubview(textLabel11)
        self.contentView.addSubview(textLabel22)
        self.contentView.addSubview(textLabel33)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}

