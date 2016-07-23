//
//  ViewController.swift
//  AFN-Swift
//
//  Created by Mac on 16/7/23.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkTools.sharedTools.request(RequestMethod.GET, URLString: "http://httpbin.org/get", parametes: ["name": "wanglaowu"]) { (result, error) in
            print(result)
        }
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(NetworkTools.sharedTools)
    }
}

