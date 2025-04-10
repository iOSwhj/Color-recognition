//
//  SceneDelegate.swift
//  coremlproject
//
//  Created by Mengduan on 2024/3/12.
//

import UIKit
import ESTabBarController_swift
let tabBarController = ESTabBarController()
let camera = JudgeViewController()
let learn = ViewController1()
let chat = ViewController2()
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var timer : Timer?
    var lastTime = isWhiteColor
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {


        
        learn.tabBarItem = ESTabBarItem.init(BarContentView(frame: .init(x: 0, y: 0, width: 50, height: 50), postion: ""), title: "学习", image: UIImage(named: "colorbutton1"), selectedImage: UIImage(named: "colorbutton1"))
        
        camera.tabBarItem = ESTabBarItem.init(BarContentView(frame: .init(x: 0, y: 0, width: 50, height: 50), postion: ""), title: "识别", image: UIImage(named: "camera0"), selectedImage: UIImage(named: "camera0"))
        chat.tabBarItem = ESTabBarItem.init(BarContentView(frame: .init(x: 0, y: 0, width: 50, height: 50), postion: ""), title: "咨询", image: UIImage(named: "ai1"), selectedImage: UIImage(named: "ai1"))
        tabBarController.viewControllers = [camera,learn,chat]
        tabBarController.selectedIndex = 1
        //MARK: 导航栏卡栏是否为半透明
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().tintColor = .white
        tabBarController.tabBar.barStyle = .default
        tabBarController.tabBar.layer.shadowColor = UIColor.white.cgColor
        tabBarController.tabBar.layer.shadowOffset = CGSize(width: 1, height: 1)
        tabBarController.tabBar.layer.shadowOpacity = 2
        tabBarController.tabBar.backgroundColor = .white/*UIColor(red: 244/255, green: 248/255, blue: 212/255, alpha: 1)*/
        tabBarController.tabBar.layer.borderColor = UIColor.black.cgColor
        tabBarController.tabBar.layer.borderWidth = 2
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changecolors), userInfo: nil, repeats: true)
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    @objc func changecolors(){
        //现在的颜色
        if isWhiteColor == true{
            camera.topLabel.backgroundColor = .white
            camera.topLabel.textColor = .black
            camera.view.backgroundColor = .black
            camera.imageView1.backgroundColor = .white
            camera.imageView.backgroundColor = .black
            camera.imageView.layer.borderColor = UIColor.white.cgColor
            camera.imageView.image = UIImage(named: "ar0")
            camera.label.textColor = .white
            camera.label1.textColor = .white
            camera.enterbutton.backgroundColor = .black
            camera.enterbutton.layer.borderColor = UIColor.white.cgColor
            camera.enterbutton.titleLabel?.textColor = .white
            camera.enterbutton1.backgroundColor = .white
            
            learn.topLabel.backgroundColor = .white
            learn.topLabel.textColor = .black
            learn.view.backgroundColor = .black
            
            learn.button0.titleLabel?.textColor = .black
            learn.button0.backgroundColor = .white
            learn.button1.titleLabel?.textColor = .black
            learn.button1.backgroundColor = .white
            learn.button2.titleLabel?.textColor = .black
            learn.button2.backgroundColor = .white
            learn.button3.titleLabel?.textColor = .black
            learn.button3.backgroundColor = .white
            learn.button4.titleLabel?.textColor = .black
            learn.button4.backgroundColor = .white
            learn.button5.titleLabel?.textColor = .black
            learn.button5.backgroundColor = .white
            learn.button6.titleLabel?.textColor = .black
            learn.button6.backgroundColor = .white
            learn.button00.titleLabel?.textColor = .black
            learn.button00.backgroundColor = .white
            learn.button11.titleLabel?.textColor = .black
            learn.button11.backgroundColor = .white
            learn.button22.titleLabel?.textColor = .black
            learn.button22.backgroundColor = .white
            learn.button33.titleLabel?.textColor = .black
            learn.button33.backgroundColor = .white
            learn.button44.titleLabel?.textColor = .black
            learn.button44.backgroundColor = .white
            learn.button55.titleLabel?.textColor = .black
            learn.button55.backgroundColor = .white
            learn.button66.titleLabel?.textColor = .black
            learn.button66.backgroundColor = .white
            chat.topLabel.backgroundColor = .white
            chat.topLabel.textColor = .black
            chat.tableView.backgroundColor = .black
            chat.iswhite = false
            if lastTime != isWhiteColor{
                lastTime = isWhiteColor
                chat.tableView.reloadData()
            }
            camera.changeColor.setImage(UIImage(named: "w"), for: .normal)
            learn.changeColor.setImage(UIImage(named: "w"), for: .normal)
            chat.changeColor.setImage(UIImage(named: "w"), for: .normal)
            
        }else{
            camera.topLabel.backgroundColor = .black
            camera.topLabel.textColor = .white
            camera.view.backgroundColor = .white
            camera.imageView1.backgroundColor = .black
            camera.imageView.backgroundColor = .white
            camera.imageView.layer.borderColor = UIColor.black.cgColor
            camera.imageView.image = UIImage(named: "ar1")
            camera.label.textColor = .black
            camera.label1.textColor = .black
            camera.enterbutton.backgroundColor = .white
            camera.enterbutton.layer.borderColor = UIColor.black.cgColor
            camera.enterbutton.titleLabel?.textColor = .black
            camera.enterbutton1.backgroundColor = .black
            
            
            learn.topLabel.backgroundColor = .black
            learn.topLabel.textColor = .white
            learn.view.backgroundColor = .white
            learn.button0.titleLabel?.textColor = .white
            learn.button0.backgroundColor = .black
            learn.button1.titleLabel?.textColor = .white
            learn.button1.backgroundColor = .black
            learn.button2.titleLabel?.textColor = .white
            learn.button2.backgroundColor = .black
            learn.button3.titleLabel?.textColor = .white
            learn.button3.backgroundColor = .black
            learn.button4.titleLabel?.textColor = .white
            learn.button4.backgroundColor = .black
            learn.button5.titleLabel?.textColor = .white
            learn.button5.backgroundColor = .black
            learn.button6.titleLabel?.textColor = .white
            learn.button6.backgroundColor = .black
            learn.button00.titleLabel?.textColor = .white
            learn.button00.backgroundColor = .black
            learn.button11.titleLabel?.textColor = .white
            learn.button11.backgroundColor = .black
            learn.button22.titleLabel?.textColor = .white
            learn.button22.backgroundColor = .black
            learn.button33.titleLabel?.textColor = .white
            learn.button33.backgroundColor = .black
            learn.button44.titleLabel?.textColor = .white
            learn.button44.backgroundColor = .black
            learn.button55.titleLabel?.textColor = .white
            learn.button55.backgroundColor = .black
            learn.button66.titleLabel?.textColor = .white
            learn.button66.backgroundColor = .black
            
            chat.topLabel.backgroundColor = .black
            chat.topLabel.textColor = .white
            chat.tableView.backgroundColor = .white
            chat.iswhite = true
            if lastTime != isWhiteColor{
                lastTime = isWhiteColor
                chat.tableView.reloadData()
            }
//            chat.tableView.reloadData()
            
            camera.changeColor.setImage(UIImage(named: "b"), for: .normal)
            learn.changeColor.setImage(UIImage(named: "b"), for: .normal)
            chat.changeColor.setImage(UIImage(named: "b"), for: .normal)
            
        }
    }
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    func sceneWillResignActive(_ scene: UIScene) {
    }
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

