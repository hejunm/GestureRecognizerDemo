//
//  BlueView.swift
//  GestureRecognizerDemo
//
//  Created by 贺俊孟 on 16/5/12.
//  Copyright © 2016年 贺俊孟. All rights reserved.
//

import UIKit

class BlueView: UIView {
    var origOffset:CGPoint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blueColor()
        
        //长按
        let longP = UILongPressGestureRecognizer(target: self, action: "longPress:")
        addGestureRecognizer(longP)
    }
    
    func longPress(lp:UILongPressGestureRecognizer){
        
        //开始动画
        if lp.state == .Began{
            let anim = CABasicAnimation(keyPath: "transform")
            anim.toValue = NSValue(CATransform3D: CATransform3DMakeScale(1.1, 1.1, 1.1))
            anim.fromValue = NSValue(CATransform3D:CATransform3DIdentity)
            anim.repeatCount = HUGE
            anim.autoreverses = true
            lp.view?.layer.addAnimation(anim, forKey: nil)
            
            //获取触摸点相对于center的偏移
            origOffset = CGPointMake(CGRectGetMidX(bounds)-lp.locationInView(self).x, CGRectGetMidY(bounds)-lp.locationInView(self).y)
        }
        
        //进行移动
        if lp.state == .Changed{
            var c = lp.locationInView(superview)
            c.x += origOffset.x
            c.y += origOffset.y
            center = c
        }
        
        //结束动画
        if lp.state == .Ended || lp.state == .Cancelled{
            lp.view?.layer.removeAllAnimations()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
