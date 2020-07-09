//
//  PraiseLayer.swift
//  NeteaseMusic Comment
//
//  Created by 李京珂 on 2020/7/3.
//  Copyright © 2020 李京珂. All rights reserved.
//

import Foundation
import UIKit

class PraiseLayer: CALayer {

    init(rectSize:CGRect)
    {
        super.init()
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = CGPoint(x:rectSize.width,y:rectSize.height/2)
        self.addSublayer(emitterLayer)
        
        let emitterCell = CAEmitterCell()
        //粒子的存活时间
        emitterCell.lifetime = 2
        //粒子的发射速度
        emitterCell.velocity = 80
        //粒子的发送速度范围
        emitterCell.velocityRange = 40
        //散发范围
        emitterCell.emissionLongitude = CGFloat.pi+CGFloat.pi/2
        //周围发射角度
        emitterCell.emissionRange = CGFloat.pi/2
        //缩放比例速度
        emitterCell.scaleSpeed = 0.08
        //粒子的透明度扰动范围
        emitterCell.alphaRange = 0.75
        //粒子的透明度变化速度
        emitterCell.alphaSpeed = -0.15
        //粒子的内容
        emitterCell.contents = UIImage(systemName: "heart.fill")!.cgImage
        //粒子的缩放比例
        emitterCell.scale = 0.5
        //粒子的名字
        emitterCell.name = "heart"
        //粒子的颜色设置
        emitterCell.redRange = 0.2
        emitterCell.greenRange = 0.5
        emitterCell.blueRange = 0.7
        //把粒子赋予容器
        emitterLayer.emitterCells = Array.init(arrayLiteral: emitterCell)
        //birthRate每秒发送粒子的数量
        emitterLayer.setValue(3.0, forKeyPath: "emitterCells.heart.birthRate")
        
        let time: TimeInterval = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            emitterLayer.setValue(0.0, forKeyPath: "emitterCells.heart.birthRate")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
