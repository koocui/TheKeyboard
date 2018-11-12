//
//  ViewController.swift
//  自定义金额输入键盘
//
//  Created by 小崔 on 2018/11/5.
//  Copyright © 2018年 小崔fasdfff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let keyBoradView  = XCMoneyOfkeyboard(frame:self.view.bounds)
        self.view.addSubview(keyBoradView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

