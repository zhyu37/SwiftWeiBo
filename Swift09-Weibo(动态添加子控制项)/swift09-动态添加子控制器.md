====
##Swift09-动态添加子控制器
>当在重大活动的时候需要改动一下一些按钮的图片，这时候会从JSON中获取到要改变的信息
<p>获取JSON
<pre>

</pre>

<p>动态添加子控制器
<pre>
addChildViewController("ZHYHomeTableViewController", unselectedImage: "tabbar_home", selectedImage: "tabbar_home_highlighted", titleName: "首页")
//"ZHYHomeTableViewController" 为类的字符串


    func addChildViewController(tableVC:String, unselectedImage unImg:String, selectedImage Img:String, titleName title:String )
    {
        //swift 和 oc 不同  swift class 前加了 命名空间
        // 0.动态获取命名空间
        let namespace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        print(namespace)
        
        //字符串 转 换成类
        // 告诉编译器暂时就是AnyClass
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
</pre>