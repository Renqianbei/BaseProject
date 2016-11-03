//
//  ViewController.swift
//  BaseProject
//
//  Created by 任前辈 on 2016/10/24.
//  Copyright © 2016年 任前辈. All rights reserved.
//

import UIKit
import Social
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titles = ["单个分享","社交分享选单","自定制"];
        
        for i in 0  ... 2 {
            let buttton = UIButton.init(frame: CGRect.init(x: 100, y: (200 + 50*i), width: 200, height: 50));
                buttton.setTitle(titles[i], for: .normal)
            buttton.setTitleColor(UIColor.gray, for: .normal);
            buttton.addTarget(self, action:#selector(clickbutton(sender:)), for: .touchUpInside)
                view.addSubview(buttton)
            buttton.tag = i
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func clickbutton( sender:UIButton)  {
        switch sender.tag {
        case 0:
          shareWeibo()
        case 1 :
            gotoShare()
        case 2 :
            customActivity()
        default :
            print("呵呵")
        }
    }
    
    func shareWeibo()  {
        //分享 判断平台是否可用
        guard SLComposeViewController.isAvailable(forServiceType: SLServiceTypeSinaWeibo) else {
            print("新浪不可用，或者没有配置相关账户");
            return;
        }
        
        //创建分享控制器
        let composeVC = SLComposeViewController.init(forServiceType: SLServiceTypeSinaWeibo)!;
        composeVC.setInitialText("helloworld");
        //        composeVC.add(#imageLiteral(resourceName: "hello.png"));
        composeVC.add(#imageLiteral(resourceName: "hello1.png"))
        composeVC.add(URL.init(string: "https://baidu.com"))
        self.present(composeVC, animated: true, completion: nil);
        
        composeVC.completionHandler = { result  in
            switch result {
            case .cancelled:
                print("取消了")
            default:
                print("成功")
            }
        }

    }
    
    func gotoShare()  {
//        享列表：UIActivityViewController
//        在iOS6之后系统为我们提供了一个分享列表视图，它通过UIActivityViewController管理。苹果设计它的主要目的是替换分享动作，分享动作选单是出于分享目的的动作选单。内置活动列表项主要有一下几个：
//        
//        UIActivityTypePostToFacebook,Facebook活动列表项；
//        UIActivityTypePostToTwitter，Twitter活动列表项；
//        UIActivityTypePostToWeibo,新浪微博活动列表项；
//        UIActivityTypeMessage，iOS中的iMessage应用活动那个列表项；
//        UIActivityTypeMail，发送Mail活动列表项；
//        UIActivityTypePrint，共享打印活动列表项；
//        UIActivityTypeCopyToPasteboard，复制到剪切板活动列表项；
//        UIActivityTypeAssignToContact，访问联系人活动列表项；
//        UIActivityTypeSaveToCameraRoll，访问设备上的相册活动列表项；
         let text = "分享的内容"
         let img = #imageLiteral(resourceName: "hello3.png")
         let url = NSURL.init(string: "https://www.baidu.com")
//        let act = UIActivity.init()
//        act.activityTitle = "hello我"
//        act.activityImage = #imageLiteral(resourceName: "hello.png")
          let shareSheet = UIActivityViewController.init(activityItems: [text,img,url], applicationActivities: nil)
        // 设置不出现的分享按钮
        /*
         Activity 类型又分为 “操作” 和 “分享” 两大类：
         
         UIActivityCategoryAction 操作：
         UIActivityTypeAirDrop            AirDrop                AirDrop
         UIActivityTypePrint              打印                    Print
         
         UIActivityTypeSaveToCameraRoll   保存到相册               Save Image
         UIActivityTypeAssignToContact    添加到联系人              AssignToContact
         UIActivityTypeAddToReadingList   添加到 Safari 阅读列表    AddToReadingList
         UIActivityTypeCopyToPasteboard   复制到剪贴板              Copy
         
         UIActivityCategoryShare 分享：
         UIActivityTypeMail               邮箱                     Mail
         UIActivityTypeMessage            短信                     Message
         
         UIActivityTypePostToTwitter      分享到 Twitter
         UIActivityTypePostToFacebook     分享到 Facebook
         UIActivityTypePostToVimeo        分享到 Vimeo（视频媒体）
         UIActivityTypePostToFlickr       分享到 Flickr（网络相簿）
         UIActivityTypePostToWeibo        分享到 新浪微博
         UIActivityTypePostToTencentWeibo 分享到 腾讯微博
         
         添加到此数组中的系统分享按钮项将不会出现在分享视图控制器中
         */
        shareSheet.excludedActivityTypes = [.assignToContact, .print]
        
        
        present(shareSheet, animated: true, completion: nil)
        
        shareSheet.completionWithItemsHandler = {
            (type : UIActivityType?, success :Bool, body: [Any]?, error :Error?) in
            print(type?.rawValue,"========",success,"=========",body,"======",error)
        }
        

    }
    
    func customActivity() -> ()  {
        let text = "分享的内容"
        let img = #imageLiteral(resourceName: "hello3.png")
        let url = NSURL.init(string: "https://www.baidu.com")
        let customActivity = Myactivity()
        let activityVC = UIActivityViewController.init(activityItems: [text,img,url], applicationActivities: [customActivity])
        
        self.present(activityVC, animated: true, completion: nil)//展示
        
        
        activityVC.completionWithItemsHandler = {
            (type : UIActivityType?, success :Bool, body: [Any]?, error :Error?) in
            print(type?.rawValue,"========",success,"=========",body,"======",error)
        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

