//
//  BezierText.swift
//  渐隐字体 BezierText
//
//  Created by Mengduan on 2023/11/2.
//

import UIKit
class BezierText0: UIView {
     
    //字迹动画时间
    private let duration:TimeInterval = 2
     
    //字迹书写图层
    private let pathLayer = CAShapeLayer()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
         
        //初始化字迹图层
        pathLayer.frame = self.bounds
        //一个布尔值，指示图层及其子层的几何形状是否垂直翻转。
        pathLayer.isGeometryFlipped = true
        pathLayer.fillColor = UIColor.clear.cgColor
        pathLayer.lineWidth = 0.8
        pathLayer.strokeColor = UIColor.white.cgColor
//        //阴影
//        pathLayer.shadowColor = UIColor.clear.cgColor
//        pathLayer.shadowOpacity = 1
//        pathLayer.shadowOffset = .init(width: 1, height: 1)
        self.layer.addSublayer(pathLayer)
    }
     
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    //动态书写指定文字
    func show(text: String) {
        //获取文字对应的贝塞尔曲线
        let textPath = bezierPathFrom(string: text)
         
        //让文字居中显示
        pathLayer.bounds = textPath.cgPath.boundingBox
        //设置笔记书写路径
        pathLayer.path = textPath.cgPath
         
        //添加笔迹书写动画
        let textAnimation = CABasicAnimation.init(keyPath: "strokeEnd")
        textAnimation.duration = duration
        textAnimation.fromValue = 0
        textAnimation.toValue = 1
        pathLayer.add(textAnimation, forKey: "strokeEnd")
    }
     
    //将字符串转为贝塞尔曲线
    private func bezierPathFrom(string:String) -> UIBezierPath{
        let paths = CGMutablePath()
        let fontName = __CFStringMakeConstantString("AmericanTypewriter-Bold")!
        let fontRef:AnyObject = CTFontCreateWithName(fontName, 88, nil)
         
        let attrString = NSAttributedString(string: string, attributes:
                                                [kCTFontAttributeName as NSAttributedString.Key : fontRef])
        let line = CTLineCreateWithAttributedString(attrString as CFAttributedString)
        let runA = CTLineGetGlyphRuns(line)
         
        for runIndex in 0..<CFArrayGetCount(runA) {
            let run = CFArrayGetValueAtIndex(runA, runIndex);
            let runb = unsafeBitCast(run, to: CTRun.self)
             
            let CTFontName = unsafeBitCast(kCTFontAttributeName,
                                           to: UnsafeRawPointer.self)
             
            let runFontC = CFDictionaryGetValue(CTRunGetAttributes(runb),CTFontName)
            let runFontS = unsafeBitCast(runFontC, to: CTFont.self)
             
            let width = UIScreen.main.bounds.width
             
            var temp = 0
            var offset:CGFloat = 0.0
             
            for i in 0..<CTRunGetGlyphCount(runb) {
                let range = CFRangeMake(i, 1)
                let glyph = UnsafeMutablePointer<CGGlyph>.allocate(capacity: 1)
                glyph.initialize(to: 0)
                let position = UnsafeMutablePointer<CGPoint>.allocate(capacity: 1)
                position.initialize(to: .zero)
                CTRunGetGlyphs(runb, range, glyph)
                CTRunGetPositions(runb, range, position);
                 
                let temp3 = CGFloat(position.pointee.x)
                let temp2 = (Int) (temp3 / width)
                let temp1 = 0
                if(temp2 > temp1){
                    temp = temp2
                    offset = position.pointee.x - (CGFloat(temp) * width)
                }
                if let path = CTFontCreatePathForGlyph(runFontS,glyph.pointee,nil) {
                    let x = position.pointee.x - (CGFloat(temp) * width) - offset
                    let y = position.pointee.y - (CGFloat(temp) * 80)
                    let transform = CGAffineTransform(translationX: x, y: y)
                    paths.addPath(path, transform: transform)
                }
            }
        }
         
        let bezierPath = UIBezierPath()
        bezierPath.move(to: .zero)
        bezierPath.append(UIBezierPath(cgPath: paths))
         
        return bezierPath
    }
}

