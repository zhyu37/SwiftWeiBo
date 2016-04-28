//
//  ZHYBaseTableViewController.swift
//  Swift08-Weibo
//
//  Created by zhyu on 16/4/27.
//  Copyright © 2016年 zhyu. All rights reserved.
//

import UIKit

class ZHYBaseTableViewController: UITableViewController {
    
    /// 定义用户登录bool
    var userLogin = false

    override func loadView() {
        
        userLogin ? super.loadView() : setupVisitorView()
        
        
    }
    
    /**
     创建 未登录界面
     */
    private func setupVisitorView()
    {
        let customView = ZHYVisitorView()
//        customView.backgroundColor = UIColor.blueColor()
        view = customView
    }

}
