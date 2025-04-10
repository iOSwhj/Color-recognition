//
//  SceneDelegate.swift
//  coremlproject
//
//  Created by Mengduan on 2024/3/12.
//

import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController, ARSKViewDelegate {
    
    
    lazy var sceneView : ARSKView = {
        let sc = ARSKView(frame: self.view.frame)
        sc.isUserInteractionEnabled = true
        return sc
    }()
    lazy var backButton : UIButton = {
       let button = UIButton(frame: CGRect(x: 24, y: 44, width: 48, height: 48))
        button.setImage(UIImage(named: "back0"), for: .normal)
        button.addTarget(self, action: #selector(backview), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true

        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
//        let scene = Scene(size: self.view.frame.size)
//        sceneView.presentScene(scene)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.addSubview(sceneView)
        self.view.addSubview(backButton)
        let configuration = ARWorldTrackingConfiguration()
        configuration.automaticImageScaleEstimationEnabled = true
        configuration.environmentTexturing = .automatic
        configuration.isAutoFocusEnabled = true
//        configuration.videoFormat
//        configuration.
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // 释放任何未使用的缓存数据、图像等。
    }
    
    // MARK: - ARSKViewDelegate
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        // 为添加到视图会话的锚点创建并配置一个节点。
//        let labelNode = SKLabelNode(text: "👾")
//        labelNode.horizontalAlignmentMode = .center
//        labelNode.verticalAlignmentMode = .center

        // 获取将Vision的标识符附加到ARAnchor
        guard let identifier = ARBridge.shared.anchorsToIdentities[anchor] else { return nil }
        let labelNode = SKLabelNode(text: identifier)
        labelNode.horizontalAlignmentMode = .center
        labelNode.verticalAlignmentMode = .center
        labelNode.fontName = UIFont.boldSystemFont(ofSize: 8).fontName
//        labelNode.fontColor = UIColor.black
        return labelNode;
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // 向用户显示错误消息
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // 通知用户会话已中断，例如，通过显示覆盖层
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // 如果需要一致的跟踪，请重置跟踪或删除现有锚点
    }
    
    @objc func backview(){
        self.dismiss(animated: true)
    }
    
}
