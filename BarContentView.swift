import ESTabBarController_swift
import UIKit

class BarContentView: ESTabBarItemContentView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = UIColor.black
        highlightTextColor = .black
        iconColor = UIColor.black
        highlightIconColor = .black
    }

    convenience init(frame: CGRect, postion: String) {
        self.init(frame: frame)
        if postion == "left" {
            insets = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 30)
        } else if postion == "right" {
            insets = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: -30)
        }else if postion == "botton"{
            insets = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func selectAnimation(animated: Bool, completion: (() -> Void)?) {
        bounceAnimation()
        completion?()
    }

    override func reselectAnimation(animated: Bool, completion: (() -> Void)?) {
        bounceAnimation()
        completion?()
    }

    func bounceAnimation() {
        //MARK: 点击放大效果
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0, 1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        impliesAnimation.duration = 0.3 * 2
        imageView.layer.add(impliesAnimation, forKey: nil)
    }
}

extension ESTabBar {
    override open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
        let resultView = super.hitTest(point, with: event)
        if resultView != nil {
            return resultView
        } else {
            for subView in subviews.reversed() {
                let convertPoint: CGPoint = subView.convert(point, from: self)
                let hitView = subView.hitTest(convertPoint, with: event)
                if hitView != nil {
                    return hitView
                }
            }
        }
        return nil
    }
}
