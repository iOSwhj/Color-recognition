//
//  SceneDelegate.swift
//  coremlproject
//
//  Created by Mengduan on 2024/3/12.
//

import SpriteKit
import ARKit
import Vision
import CoreVideo
import CoreImage

class Scene: SKScene {
    
    override func didMove(to view: SKView) {
        //在这里设置你的场景
    }
    
    override func update(_ currentTime: TimeInterval) {
        // 在每帧渲染之前调用
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        //使用相机的当前位置创建锚点
        if let currentFrame = sceneView.session.currentFrame {
            DispatchQueue.main.async {
                do {
                    let defaultConfig = MLModelConfiguration()
                    // 创建图像分类器的包装器类的实例
                    let imageClassifierWrapper = try? EndColorClassifier(configuration: defaultConfig)
                    guard let imageClassifier = imageClassifierWrapper else {
                        fatalError("App failed to create an image classifier model instance.")
                    }
                    // 获取基础模型实例
                    let imageClassifierModel = imageClassifier.model
                    //2.加载MLModel（训练好的模型），并做了一个让MLModel识别图像的请求
                    guard let model = try? VNCoreMLModel(for: imageClassifierModel) else{
                        fatalError("加载MLmodel失败")
                    }
                    let request = VNCoreMLRequest(model: model, completionHandler: { (request, error) in
                        DispatchQueue.main.async {
                            guard let results = request.results as? [VNClassificationObservation] else {
                                print("No results?")
                                return
                            }
                            // 在相机前创建0.4米平移的变换
                            var translation = matrix_identity_float4x4
                            translation.columns.3.z = -0.4
                            let transform = simd_mul(currentFrame.camera.transform, translation)
                            var string = String()
                            // 为会话添加一个新的锚点
                            let anchor = ARAnchor(transform: transform)
                            switch results.first?.identifier {
                            case "red":
                                string = "红色"
                                break
                            case "white":
                                string = "白色"
                                break
                            case "black":
                                string = "黑色"
                                break
                            case "blue":
                                string = "蓝色"
                                break
                            case "brown":
                                string = "棕色"
                                break
                            case "green":
                                string = "绿色"
                                break
                            case "yellow":
                                string = "黄色"
                                break
                            default:
                                break
                            }
                            ARBridge.shared.anchorsToIdentities[anchor] = string
                            sceneView.session.add(anchor: anchor)
                        }
                    })
                    // 截取指定区域的图像
                    let originalImage = CIImage(cvPixelBuffer: currentFrame.capturedImage)
                    let context = CIContext()
                    if let cgImage = context.createCGImage(originalImage, from: originalImage.extent) {
                        // 这样就得到了最高质量的图片uiImage
                        // 现在 cgImage 就是截取后的图像，可以在这里使用它
                        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
                        try handler.perform([request])
                    }
                } catch {
                    print("error")
                }
            }
        }
    }
    
    
}


