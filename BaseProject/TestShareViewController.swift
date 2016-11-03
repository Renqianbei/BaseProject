//
//  TestShareViewController.swift
//  BaseProject
//
//  Created by 任前辈 on 2016/10/28.
//  Copyright © 2016年 任前辈. All rights reserved.
//

import UIKit
typealias Donehandle = ()->()
class TestShareViewController: UIViewController {
   
     var finishDone:Donehandle?
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.red;
        let buttton = UIButton.init(frame: CGRect.init(x: 100, y: (200 + 50), width: 200, height: 50));
        buttton.setTitle("返回", for: .normal)
        buttton.setTitleColor(UIColor.gray, for: .normal);
        buttton.addTarget(self, action:#selector(clickbutton(sender:)), for: .touchUpInside)
        view.addSubview(buttton)
    }
    
    func clickbutton(sender:UIButton)  {
        self.dismiss(animated: true, completion: nil)
        finishDone?()
    }
}
