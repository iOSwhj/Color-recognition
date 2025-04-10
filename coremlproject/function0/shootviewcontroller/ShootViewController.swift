//
//  ViewController.swift
//  sheet计设
//
//  Created by Mengduan on 2024/3/14.
//

import UIKit
import Hero
class ShootViewController: UIViewController {
    
    let sheetID = "sheetID"
    var cellModel : [String] = []
    var topshow = String()
    var descrshow = String()
    lazy var topLabel : UILabel = {
       let label = UILabel(frame: CGRect(x: -2, y: 0, width: 395, height: 100))
        label.text = "色 彩 瑰 宝"
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var backButton : UIButton = {
       let button = UIButton(frame: CGRect(x: 24, y: 44, width: 48, height: 48))
        button.setImage(UIImage(named: "back0"), for: .normal)
        button.addTarget(self, action: #selector(backview), for: .touchUpInside)
        return button
    }()
    lazy var topTextLabel : BezierText0 = {
       let label = BezierText0(frame: CGRect(x: -50, y: 38, width: 270, height: 270))
//        label.show(text: "红色")
        label.show(text: topshow)

        return label
    }()
    lazy var topTextLabel1 : UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 38, width: 270, height: 270))
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 88)
//        label.text = "红色"
        label.hero.id = "sheet"
        label.alpha = 0
        label.textColor = .white
        return label
    }()
    lazy var topTextLabel2 : UILabel = {
       let label = UILabel(frame: CGRect(x: 7, y: 38 + 7, width: 270, height: 270))
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 88)
//        label.text = "红色"
        label.alpha = 0
        label.textColor = .white
        return label
    }()
    lazy var RGBLabel : UILabel = {
       let label = UILabel(frame: CGRect(x: 190 + 300, y: 200, width: 250, height: 50))
//        label.text = " ———— RGB：(255,0,0)"
        label.textColor = .white
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        label.textAlignment = .left
        return label
    }()
    lazy var EnglishLabel : UILabel = {
       let label = UILabel(frame: CGRect(x: 220 + 300, y: 110, width: 250, height: 150))
//        label.text = ".red"
        label.textColor = .white
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 64)
        label.textAlignment = .left
        return label
    }()
    
    lazy var describeLabel : BezierText = {
        let label =  BezierText(frame: CGRect(x: 0, y: 220, width: 200, height: 70))
//        label.show(text: "象征着爱情、激情、勇气和力量。也常与危险联系。")
        label.show(text: descrshow)
        label.center.x = self.view.center.x
        return label
    }()
    
    lazy var collectionView : UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: 360, height: 400)
        flowlayout.scrollDirection = .horizontal
        flowlayout.minimumLineSpacing = 8
//        flowlayout.headerReferenceSize = CGSize(width: 10, height: 24)
        let collectionview = UICollectionView(frame: CGRect(x: 0, y: 270, width: 360, height: 500), collectionViewLayout: flowlayout)
        collectionview.center.x = self.view.center.x
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.register(ColletionViewCell.classForCoder(), forCellWithReuseIdentifier: sheetID)
        collectionview.layer.cornerRadius = 24
        collectionview.backgroundColor = .black
        collectionview.layer.borderColor = UIColor.white.cgColor
        collectionview.layer.borderWidth = 2
      return collectionview
        
    }()
    
    lazy var bottomView : UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 270+4, width: 360, height: 500))
        view.center.x = self.view.center.x + 10
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        self.view.hero.modifiers = [.arc]
        self.view.addSubview(bottomView)
        self.view.backgroundColor = .black
        self.view.addSubview(topLabel)
        self.view.addSubview(topTextLabel1)
        self.view.addSubview(topTextLabel2)
        self.view.addSubview(RGBLabel)
        self.view.addSubview(EnglishLabel)
        self.view.addSubview(collectionView)
        self.view.addSubview(backButton)

        appearText()
        
    }

    private func appearText(){
        
        UIView.animate(withDuration: 0.7, delay: 3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, animations: {
            self.transAnimation()
        }){ _ in
            self.view.addSubview(self.topTextLabel)
            self.view.addSubview(self.describeLabel)
            
        }
        self.perform(#selector(add), with: nil, afterDelay: 2.7)
        
    }
    
    @objc func add(){
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, animations: {
            self.topTextLabel1.alpha = 1
            self.topTextLabel2.alpha = 0.4
            self.topTextLabel.alpha = 0
        })
    }
    
    private func transAnimation(){
        self.EnglishLabel.center.x = 300
        self.RGBLabel.center.x = 295
    }
    
    @objc func backview(){
        self.dismiss(animated: true)
    }
    
}


extension ShootViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sheetID, for: indexPath) as! ColletionViewCell
        if indexPath.row == 0{
            cell.textLabel00.text = cellModel[0]
            cell.textLabel0.text = cellModel[1]
            cell.textLabel11.text = cellModel[2]
            cell.textLabel1.text = cellModel[3]
            cell.textLabel22.text = cellModel[4]
            cell.textLabel2.text = cellModel[5]
            cell.textLabel33.text = cellModel[6]
            cell.textLabel3.text = cellModel[7]
        }else{
            cell.textLabel00.text = cellModel[8]
            cell.textLabel0.text = cellModel[9]
            cell.textLabel11.text = cellModel[10]
            cell.textLabel1.text = cellModel[11]
            cell.textLabel22.text = cellModel[12]
            cell.textLabel2.text = cellModel[13]
            cell.textLabel33.text = cellModel[14]
            cell.textLabel3.text = cellModel[15]
        }
        return cell
    }
}
