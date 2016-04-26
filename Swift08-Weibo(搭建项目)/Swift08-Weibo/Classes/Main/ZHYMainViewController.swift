//
//  ZHYMainViewController.swift
//  Swift08-Weibo
//
//  Created by zhyu on 16/4/25.
//  Copyright © 2016年 zhyu. All rights reserved.
//
/// commond + j (定位到目录结构) -> commond + n ()创建文件
import UIKit

class ZHYMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
 /// 运行之后发现 tintcolor 为蓝色 应改为橙色
        //设置tabbar颜色
        //注意 在iOS7之前  设置tintColor只会改变字体颜色  不会改变图片颜色 
        //需要修改  render as Original Image
        tabBar.tintColor = UIColor.orangeColor()

        //1. create homeViewController
        let home = ZHYHomeTableViewController()
        home.tabBarItem.image = UIImage(named: "tabbar_home")
        home.tabBarItem.selectedImage = UIImage(named: "tabbar_home_highlighted")
//        home.tabBarItem.title = "首页"
//        home.navigationItem.title = "首页"
        //上面 两句 等价于下面 一句
        // 从内像外设置, nav和tabbar都有
        home.title = "首页"
        
        //2. create UINavigationController
        let nav = UINavigationController()
        nav.addChildViewController(home)
        
        //3. add to the ZHYMainViewController
        addChildViewController(nav)
        
        
        addChildViewControllers()
        
    }
    
    func addChildViewControllers()
    {
        addChildViewController(ZHYHomeTableViewController(), unselectedImage: "tabbar_home", selectedImage: "tabbar_home_highlighted", titleName: "首页")
        addChildViewController(ZHYMessageTableViewController(), unselectedImage: "tabbar_message_center", selectedImage: "tabbar_message_center_highlighted", titleName: "消息")
        addChildViewController(ZHYDiscoverTableViewController(), unselectedImage: "tabbar_discover", selectedImage: "tabbar_discover_highlighted", titleName: "发现")
        addChildViewController(ZHYProfileTableViewController(), unselectedImage: "tabbar_profile", selectedImage: "tabbar_profile_highlighted", titleName: "我")
    }
    
    func addChildViewController(tableVC:UITableViewController, unselectedImage unImg:String, selectedImage Img:String, titleName title:String )
    {
        
        let tableVC = tableVC
        tableVC.tabBarItem.image = UIImage(named: unImg)
        tableVC.tabBarItem.selectedImage = UIImage(named: Img)
        tableVC.title = title
        
        tabBar.tintColor = UIColor.orangeColor()
        
        let nav = UINavigationController()
        nav.addChildViewController(tableVC)
        
        addChildViewController(nav)
        
    }

}
