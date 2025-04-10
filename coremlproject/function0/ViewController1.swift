//
//  ViewController1.swift
//  寻色
//
//  Created by Mengduan on 2024/3/11.
//


import UIKit
import Hero
// color介绍

class ViewController1: UIViewController {
    var tags = [UIButton]()
    var buttonNames : [String] = ["黑 色","蓝 色","棕 色","绿 色","红 色","白 色","黄 色"]
    
    let colorsmodel = colorsModel()
    
    lazy var topLabel : UILabel = {
       let label = UILabel(frame: CGRect(x: -2, y: 0, width: 395, height: 100))
        label.text = "色 彩 瑰 宝"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 2
        
        return label
    }()
    
    lazy var sphereView : AASphereView = {
        let sphereView = AASphereView.init(frame: CGRect.init(x: 10, y: (UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.width) / 2.0, width: UIScreen.main.bounds.size.width - 20, height: 400))
        return sphereView
    }()
    
    lazy var button0 : UIButton = {
        let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 70, height: 70)))
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.tag = 0
        button.setTitle(buttonNames[0], for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
//        button.hero.id = "sheet"
        button.addTarget(self, action: #selector(introllerview(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var button1 : UIButton = {
        let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 70, height: 70)))
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.tag = 1
        button.setTitle(buttonNames[1], for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
//        button.hero.id = "sheet"
        button.addTarget(self, action: #selector(introllerview(_:)), for: .touchUpInside)
        return button
    }()
    lazy var button2 : UIButton = {
        let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 70, height: 70)))
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.tag = 2
        button.setTitle(buttonNames[2], for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
//        button.hero.id = "sheet"
        button.addTarget(self, action: #selector(introllerview(_:)), for: .touchUpInside)
        return button
    }()
    lazy var button3 : UIButton = {
        let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 70, height: 70)))
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.tag = 3
        button.setTitle(buttonNames[3], for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
//        button.hero.id = "sheet"
        button.addTarget(self, action: #selector(introllerview(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var button4 : UIButton = {
        let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 70, height: 70)))
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.tag = 4
        button.setTitle(buttonNames[4], for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
//        button.hero.id = "sheet"
        button.addTarget(self, action: #selector(introllerview(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var button5 : UIButton = {
        let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 70, height: 70)))
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.tag = 5
        button.setTitle(buttonNames[5], for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
//        button.hero.id = "sheet"
        button.addTarget(self, action: #selector(introllerview(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var button6 : UIButton = {
        let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 70, height: 70)))
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.tag = 6
        button.setTitle(buttonNames[6], for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
//        button.hero.id = "sheet"
        button.addTarget(self, action: #selector(introllerview(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var button00 : UIButton = {
        let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 70, height: 70)))
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.tag = 0
        button.setTitle(buttonNames[0], for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
//        button.hero.id = "sheet"
        button.addTarget(self, action: #selector(introllerview(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var button11 : UIButton = {
        let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 70, height: 70)))
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.tag = 1
        button.setTitle(buttonNames[1], for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
//        button.hero.id = "sheet"
        button.addTarget(self, action: #selector(introllerview(_:)), for: .touchUpInside)
        return button
    }()
    lazy var button22 : UIButton = {
        let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 70, height: 70)))
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.tag = 2
        button.setTitle(buttonNames[2], for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
//        button.hero.id = "sheet"
        button.addTarget(self, action: #selector(introllerview(_:)), for: .touchUpInside)
        return button
    }()
    lazy var button33 : UIButton = {
        let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 70, height: 70)))
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.tag = 3
        button.setTitle(buttonNames[3], for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
//        button.hero.id = "sheet"
        button.addTarget(self, action: #selector(introllerview(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var button44 : UIButton = {
        let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 70, height: 70)))
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.tag = 4
        button.setTitle(buttonNames[4], for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
//        button.hero.id = "sheet"
        button.addTarget(self, action: #selector(introllerview(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var button55 : UIButton = {
        let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 70, height: 70)))
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.tag = 5
        button.setTitle(buttonNames[5], for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
//        button.hero.id = "sheet"
        button.addTarget(self, action: #selector(introllerview(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var button66 : UIButton = {
        let button = UIButton.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 70, height: 70)))
        button.layer.cornerRadius = 16
        button.backgroundColor = .white
        button.tag = 6
        button.setTitle(buttonNames[6], for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
//        button.hero.id = "sheet"
        button.addTarget(self, action: #selector(introllerview(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var changeColor : UIButton = {
       let button = UIButton(frame: CGRect(x: 340, y: 45, width: 50, height: 50))
        button.setImage(UIImage(named: "w"), for: .normal)
        button.addTarget(self, action: #selector(changecolor), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "colorbutton0"), style: .plain, target: self, action: #selector(shootView))
        self.hero.isEnabled = true
        self.view.hero.modifiers = [.arc]
        self.view.backgroundColor = .black
        self.view.addSubview(topLabel)
        self.view.addSubview(sphereView)
        self.view.addSubview(changeColor)
        tags.append(button0)
        tags.append(button1)
        tags.append(button2)
        tags.append(button3)
        tags.append(button4)
        tags.append(button5)
        tags.append(button6)
        tags.append(button00)
        tags.append(button11)
        tags.append(button22)
        tags.append(button33)
        tags.append(button44)
        tags.append(button55)
        tags.append(button66)
        self.sphereView.setTagViews(array: tags)
        self.sphereView.reloadInputViews()
    }
    
    @objc func introllerview(_ sender : UIButton){
        //重置 Hero id
        self.setup()
        
        
        //"黑 色","蓝 色","棕 色","绿 色","红 色","白 色","黄 色"
        switch sender.tag {
        case 0:
            sender.hero.id = "sheet" //添加Hero标识
            let vc = ShootViewController()
            vc.topshow = colorsmodel.black[0]
            vc.topTextLabel1.text = colorsmodel.black[0]
            vc.topTextLabel2.text = colorsmodel.black[0]
            vc.EnglishLabel.text = colorsmodel.black[1]
            vc.RGBLabel.text = colorsmodel.black[2]
            vc.descrshow = colorsmodel.black[3]
            for index in (4...19){
                vc.cellModel.append(colorsmodel.black[index])
            }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            break
        case 1:
            sender.hero.id = "sheet" //添加Hero标识
            let vc = ShootViewController()
            vc.topshow = colorsmodel.blue[0]
            vc.topTextLabel1.text = colorsmodel.blue[0]
            vc.topTextLabel2.text = colorsmodel.blue[0]
            vc.EnglishLabel.text = colorsmodel.blue[1]
            vc.RGBLabel.text = colorsmodel.blue[2]
            vc.descrshow = colorsmodel.blue[3]
            for index in (4...19){
                vc.cellModel.append(colorsmodel.blue[index])
            }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            break
        case 2:
            sender.hero.id = "sheet"
            let vc = ShootViewController()
            vc.topshow = colorsmodel.brown[0]
            vc.topTextLabel1.text = colorsmodel.brown[0]
            vc.topTextLabel2.text = colorsmodel.brown[0]
            vc.EnglishLabel.text = colorsmodel.brown[1]
            vc.RGBLabel.text = colorsmodel.brown[2]
            vc.descrshow = colorsmodel.brown[3]
            for index in (4...19){
                vc.cellModel.append(colorsmodel.brown[index])
            }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            break
        case 3:
            sender.hero.id = "sheet"
            let vc = ShootViewController()
            vc.topshow = colorsmodel.green[0]
            vc.topTextLabel1.text = colorsmodel.green[0]
            vc.topTextLabel2.text = colorsmodel.green[0]
            vc.EnglishLabel.text = colorsmodel.green[1]
            vc.RGBLabel.text = colorsmodel.green[2]
            vc.descrshow = colorsmodel.green[3]
            for index in (4...19){
                vc.cellModel.append(colorsmodel.green[index])
            }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            break
        case 4:
            sender.hero.id = "sheet"
            let vc = ShootViewController()
            vc.topshow = colorsmodel.red[0]
            vc.topTextLabel1.text = colorsmodel.red[0]
            vc.topTextLabel2.text = colorsmodel.red[0]
            vc.EnglishLabel.text = colorsmodel.red[1]
            vc.RGBLabel.text = colorsmodel.red[2]
            vc.descrshow = colorsmodel.red[3]
            for index in (4...19){
                vc.cellModel.append(colorsmodel.red[index])
            }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            break
        case 5:
            sender.hero.id = "sheet"
            let vc = ShootViewController()
            vc.topshow = colorsmodel.white[0]
            vc.topTextLabel1.text = colorsmodel.white[0]
            vc.topTextLabel2.text = colorsmodel.white[0]
            vc.EnglishLabel.text = colorsmodel.white[1]
            vc.RGBLabel.text = colorsmodel.white[2]
            vc.descrshow = colorsmodel.white[3]
            for index in (4...19){
                vc.cellModel.append(colorsmodel.white[index])
            }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            break
        case 6:
            sender.hero.id = "sheet"
            let vc = ShootViewController()
            vc.topshow = colorsmodel.yellow[0]
            vc.topTextLabel1.text = colorsmodel.yellow[0]
            vc.topTextLabel2.text = colorsmodel.yellow[0]
            vc.EnglishLabel.text = colorsmodel.yellow[1]
            vc.RGBLabel.text = colorsmodel.yellow[2]
            vc.descrshow = colorsmodel.yellow[3]
            for index in (4...19){
                vc.cellModel.append(colorsmodel.yellow[index])
            }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            break
        default:
            break
        }
        
    }
    
    private func setup(){
        self.button0.hero.id = ""
        self.button1.hero.id = ""
        self.button2.hero.id = ""
        self.button3.hero.id = ""
        self.button4.hero.id = ""
        self.button5.hero.id = ""
        self.button6.hero.id = ""
        self.button00.hero.id = ""
        self.button11.hero.id = ""
        self.button22.hero.id = ""
        self.button33.hero.id = ""
        self.button44.hero.id = ""
        self.button55.hero.id = ""
        self.button66.hero.id = ""
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
