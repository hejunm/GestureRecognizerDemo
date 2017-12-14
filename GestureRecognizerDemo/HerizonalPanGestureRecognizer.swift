//
//  HerizonalPanGestureRecognizer.swift
//  GestureRecognizerDemo
//
//  Created by 贺俊孟 on 16/5/13.
//  Copyright © 2016年 贺俊孟. All rights reserved.
//  只能够水平拖动

import UIKit
import UIKit.UIGestureRecognizerSubclass  //这个extension可以使手势可以继承。否则你没法重写必要的方法。

class HerizonalPanGestureRecognizer: UIPanGestureRecognizer {
    
    var origLoc:CGPoint! //记录开始时的坐标
    
    override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
        origLoc = touches.first?.locationInView(view?.superview)
        super.touchesBegan(touches, withEvent: event)
    }
    
    //所有的识别逻辑都是在这里进行。第一次调用时状态是 Possible
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent) {
        if self.state == .Possible{
            let loc:CGPoint! = touches.first?.locationInView(view?.superview)
            let deltaX = fabs(loc.x-origLoc.x)
            let deltaY = fabs(loc.y - origLoc.y)
            
            //开始识别时， 如果竖直移动距离>水平移动距离，直接Failed
            if deltaX <= deltaY{
                state = .Failed
            }
        }
        
        super.touchesMoved(touches, withEvent: event)
        
       
    }
    
    //通过重写。现在只有x 产生偏移。
    override func translationInView(view: UIView?) -> CGPoint {
        var proposedTranslation = super.translationInView(view)
        proposedTranslation.y = 0
        return proposedTranslation
    }
    
    
}
