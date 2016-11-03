//
//  MyActivity.swift
//  BaseProject
//
//  Created by 任前辈 on 2016/10/28.
//  Copyright © 2016年 任前辈. All rights reserved.
//

import Social

class  Myactivity: UIActivity {
    override class var activityCategory: UIActivityCategory {
       return .share
    } // default is UIActivityCategoryAction.

    override var activityTitle: String?{
        return  "火火火火"
    }
    
    override var activityType: UIActivityType?{
        // 在 completionWithItemsHandler 回调里可以用于判断，一般取当前类名
        return UIActivityType(rawValue: NSStringFromClass(self.classForCoder))
        
    }
    // 设置分享按钮的图片
    override var activityImage: UIImage?{
        //片自定变为黑白色，默认尺寸为 56 * 56 像素
        return #imageLiteral(resourceName: "icon3.png")
    }
        // 设置是否显示分享按钮
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
         // 这里一般根据用户是否授权等来决定是否要隐藏分享按钮
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
                // 预处理分享数据
    }
    
    // 执行分享 跳转的视图控制器
    override var activityViewController: UIViewController?{
        // 点击自定义分享按钮时调用，跳转到自定义的视图控制器
        let vc = TestShareViewController()
        vc.title = activityTitle
       
        vc.finishDone = {
//          self.activityDidFinish(true)
        }
        return vc;
    }
    override func perform() {
        //上面视图控制器返回空时 会调用
        //执行分享 这里可以完全自定义 分享的行为 可以跳转其它app😯
        print("执行了 perform")
    }
    
    override func activityDidFinish(_ completed: Bool) {
        // 分享视图控制器退出时调用
        print("分享视图控制器退出时调用")
    }
    
    
    
}
