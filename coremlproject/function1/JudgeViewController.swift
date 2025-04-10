//
//  ViewController3.swift
//  寻色
//
//  Created by Mengduan on 2024/3/11.
//

import UIKit
//color
class JudgeViewController: UIViewController {
    
    lazy var topLabel : UILabel = {
       let label = UILabel(frame: CGRect(x: -2, y: 0, width: 395, height: 100))
        label.text = "A R 识 色"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 2
        return label
    }()
    
    lazy var imageView : UIImageView = {
       let imageview = UIImageView(frame: CGRect(x: 0, y: 150, width: 240, height: 240))
        imageview.center.x = self.view.center.x
        imageview.contentMode = .scaleAspectFill
        imageview.image = UIImage(named: "ar0")
        imageview.backgroundColor = .black
        imageview.layer.cornerRadius = 16
        imageview.layer.borderWidth = 2
        imageview.layer.borderColor = UIColor.white.cgColor
        return imageview
    }()
    lazy var imageView1 : UIView = {
       let imageview = UIView(frame: CGRect(x: 0, y: 150+4, width: 240, height: 240))
        imageview.center.x = self.view.center.x + 7
        imageview.contentMode = .scaleAspectFill
        imageview.layer.cornerRadius = 16
        imageview.backgroundColor = .white
        return imageview
    }()
    
    lazy var label : UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 360, width: 240, height: 240))
        label.text = "在明亮的现实环境中寻找颜色"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 24)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.center.x = self.view.center.x
        label.textColor = .white
        return label
    }()
    lazy var label1 : UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 460, width: 240, height: 240))
        label.text = "寻找到颜色后，会在AR场景中放置3D文字"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        label.numberOfLines = 3
        label.center.x = self.view.center.x
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var enterbutton : UIButton = {
       let button = UIButton(frame: CGRect(x: 0, y: 670, width: 300, height: 70))
        button.setTitle("开 始", for: .normal)
        button.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        button.center.x = self.view.center.x
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        
        return button
    }()
    lazy var enterbutton1 : UIView = {
       let view = UIView(frame: CGRect(x: 10, y: 670+4, width: 300, height: 70))
        view.center.x = self.view.center.x + 7
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var changeColor : UIButton = {
       let button = UIButton(frame: CGRect(x: 340, y: 45, width: 50, height: 50))
        button.setImage(UIImage(named: "w"), for: .normal)
        button.addTarget(self, action: #selector(changecolor), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.view.addSubview(topLabel)
        self.view.addSubview(imageView1)
        self.view.addSubview(imageView)
        self.view.addSubview(label)
        self.view.addSubview(label1)
        self.view.addSubview(enterbutton1)
        self.view.addSubview(enterbutton)
        self.view.addSubview(changeColor)
    }
    
    @objc func nextView(){
        let vc = ViewController()
        //全屏
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func changecolor(){
        isWhiteColor = !isWhiteColor
        if isWhiteColor == true{
            self.changeColor.setImage(UIImage(named: "w"), for: .normal)
        }else{
            self.changeColor.setImage(UIImage(named: "b"), for: .normal)
        }
    }

    
}

