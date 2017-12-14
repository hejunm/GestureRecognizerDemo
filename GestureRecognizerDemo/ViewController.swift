//
//  ViewController.swift
//  GestureRecognizerDemo
//
//  Created by 贺俊孟 on 16/5/12.
//  Copyright © 2016年 贺俊孟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blueView = BlueView(frame:CGRectMake(20, 20, 100, 100))
        self.view .addSubview(blueView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

