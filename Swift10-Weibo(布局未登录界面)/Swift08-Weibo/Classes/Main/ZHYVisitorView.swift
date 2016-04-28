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
    }

    // Swift推荐我们自定义一个控件,要么用纯代码, 要么就用xib/stroyboard
    required init?(coder aDecoder: NSCoder) {
        // 如果通过xib/stroyboard创建该类, 那么就会崩溃
        fatalError("init(coder:) has not been implemented")
    }

}
