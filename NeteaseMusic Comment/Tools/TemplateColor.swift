//
//  TemplateColor.swift
//  NeteaseMusic Comment
//
//  Created by 李京珂 on 2020/7/9.
//  Copyright © 2020 李京珂. All rights reserved.
//

import UIKit

struct ColorElement {
    var r: UInt
    var g: UInt
    var b: UInt
}
struct TemplateColor {
    let startColor: UIColor   //渐变色 起始色
    let endColor: UIColor    //渐变色 结束色
    var averageColor: ColorElement    //ColorElement类包含颜色的RGB
    var distance: Int            //与target的距离
    
    init(start: UInt, end: UInt, target: ColorElement?) {
        self.startColor = UIColor(hex: start)
        self.endColor = UIColor(hex: end)
        //渐变色的平均色
        self.averageColor = ColorElement(r: ((start >> 16) + (end >> 16)) / 2,
                                         g: ((start >> 8 & 0xFF) + (end >> 8 & 0xFF)) / 2,
                                         b: ((start & 0xFF) + (end & 0xFF)) / 2)
        let rDistance = Int(self.averageColor.r) - Int(target?.r ?? 0)
        let gDistance = Int(self.averageColor.g) - Int(target?.g ?? 0)
        let bDistance = Int(self.averageColor.b) - Int(target?.b ?? 0)
        self.distance = rDistance * rDistance + gDistance * gDistance + bDistance * bDistance
    }
}
