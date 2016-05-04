//
//  ZHYVisitorView.swift
//  Swift08-Weibo
//
//  Created by zhyu on 16/4/27.
//  Copyright © 2016年 zhyu. All rights reserved.
//

import UIKit

class ZHYVisitorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 1.添加子控件
        addSubview(iconView)
        addSubview(maskBGView)
        addSubview(homeIcon)
        addSubview(messageLabel)
        addSubview(loginButton)
        addSubview(registerButton)
        
        // 2.布局子控件
        // 2.1设置背景
        iconView.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        homeIcon.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        messageLabel.xmg_AlignVertical(type: XMG_AlignType.BottomCenter, referView: iconView, size: nil)
        
        // "哪个控件" 的 "什么属性" "等于" "另外一个控件" 的 "什么属性" 乘以 "多少" 加上 "多少"
        let widthCons = NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 224)
        addConstraint(widthCons)
        
        // 2.4设置按钮
        //拉伸图片 show slicing
        registerButton.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: messageLabel, size: CGSize(width: 100, height: 30), offset: CGPoint(x: 0, y: 20))
        
        loginButton.xmg_AlignVertical(type: XMG_AlignType.BottomRight, referView: messageLabel, size: CGSize(width: 100, height: 30), offset: CGPoint(x: 0, y: 20))
        
        // 2.5设置蒙版
        maskBGView.xmg_Fill(self)
    }

    // Swift推荐我们自定义一个控件,要么用纯代码, 要么就用xib/stroyboard
    required init?(coder aDecoder: NSCoder) {
        // 如果通过xib/stroyboard创建该类, 那么就会崩溃
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 懒加载控件
    /// 转盘
    private lazy var iconView:UIImageView = {
       let imgV = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return imgV
    }()
    
    /// 图标
    private lazy var homeIcon:UIImageView = {
       let homeI = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return homeI
    }()
    
    /// 文本
    private lazy var messageLabel:UILabel = {
       let label = UILabel()
        //换行
        label.numberOfLines = 0
        label.textColor = UIColor.grayColor()
        label.text = "打附加赛可垃圾分类考试的减肥了快速的减肥两款手机的两款手机立刻"
        return label
    }()
    
    /// 登录按钮
    private lazy var loginButton:UIButton = {
       let btn = UIButton(type: UIButtonType.Custom)
        btn.setTitle("登录", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        return btn
    }()
    
    /// 注册按钮
    private lazy var registerButton:UIButton = {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setTitle("注册", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        return btn
    }()
    
    private lazy var maskBGView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return iv
    }()

}
