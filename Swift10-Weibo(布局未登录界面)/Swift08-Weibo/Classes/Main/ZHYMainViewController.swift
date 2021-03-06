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
        
        // 添加子控制器
        addChildViewControllers()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("--------------")
        // 此时 tabBarButton 都已经创建
        print(tabBar.subviews)
        // 初始化加号按钮
        setupComposeBtn()
    }
    
    func addChildViewControllers()
    {
        
        // 1.获取json文件路径
        let jsonPath = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)
        // 2.加载json数据
        let jsonData = NSData(contentsOfFile: jsonPath!)
        // 3.序列化json
        do{
            // throw是Xcode7最明显的一个变化, Xcode7之前都是通过传入error指针捕获异常, Xocode7开始通过try/catch捕获异常
            let dictArray = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers)
            
            // 遍历字典时候需要明确指明数组中的数据类型
            for dict in dictArray  as! [[String:String]]
            {
                // 由于addChildVC方法参数不能为nil, 但是字典中取出来的值可能是nil, 所以需要加上!
                addChildViewController(dict["vcName"]!, unselectedImage: dict["imageName"]!, selectedImage: dict["imageName"]!+"_highlighted", titleName: dict["title"]!)
            }
        }catch{
            addChildViewController("ZHYHomeTableViewController", unselectedImage: "tabbar_home", selectedImage: "tabbar_home_highlighted", titleName: "首页")
            addChildViewController("ZHYMessageTableViewController", unselectedImage: "tabbar_message_center", selectedImage: "tabbar_message_center_highlighted", titleName: "消息")
            // 添加占位控制器
            addChildViewController("NullViewController", unselectedImage: "", selectedImage: "", titleName: "")
            addChildViewController("ZHYDiscoverTableViewController", unselectedImage: "tabbar_discover", selectedImage: "tabbar_discover_highlighted", titleName: "发现")
            addChildViewController("ZHYProfileTableViewController", unselectedImage: "tabbar_profile", selectedImage: "tabbar_profile_highlighted", titleName: "我")
        }
        
        
    }
    
    func addChildViewController(tableVC:String, unselectedImage unImg:String, selectedImage Img:String, titleName title:String )
    {
        //swift 和 oc 不同  swift class 前加了 命名空间
        // 0.动态获取命名空间
        let namespace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        print(namespace)
        
        //字符串 转 换成类
        // 告诉编译器暂时就是AnyClass
        print(namespace + "." + tableVC)
        let cls:AnyClass = NSClassFromString(namespace + "." + tableVC)!
        print(cls)
        //通过类创建对象
        // 告诉编译器真实类型是UIViewController
        let vcCls = cls as! UITableViewController.Type
        // 实例化控制器
        let vc = vcCls.init()
        
        vc.tabBarItem.image = UIImage(named: unImg)
        vc.tabBarItem.selectedImage = UIImage(named: Img)
        vc.title = title
        
        // 注意: Xocde7之前只有文字有效果, 还需要设置图片渲染模式
        tabBar.tintColor = UIColor.orangeColor()
        
        let nav = UINavigationController()
        nav.addChildViewController(vc)
        
        addChildViewController(nav)
        
    }
    
    func setupComposeBtn(){
        // 0.添加到tabBar上
        tabBar.addSubview(composeBtn)
        
        // 1.计算按钮宽度
        let width = tabBar.bounds.width / CGFloat(viewControllers!.count)
        // 2.创建按钮frame
        let rect = CGRect(x: 0, y: 0, width: width, height: tabBar.bounds.height)
        // 3.设置按钮frame和偏移位
        composeBtn.frame = CGRectOffset(rect, width * 2, 0)
    }
    
    
    private lazy var composeBtn:UIButton = {
       let button = UIButton()
        
        // 2.设置图片
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        // 3.设置背景图片
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        
        // 4.监听加号按钮点击
        button.addTarget(self, action: "composeBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        // 4.返回按钮
        return button
        
    }()
    
    func composeBtnClick(){
        print(__FUNCTION__)
    }

}
