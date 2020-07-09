//
//  PersonalView.swift
//  NeteaseMusic Comment
//
//  Created by 李京珂 on 2020/7/9.
//  Copyright © 2020 李京珂. All rights reserved.
//

import UIKit
import SDWebImage

class PersonalView: UIView {
    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lazy Get
    lazy var avatarView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    lazy var backgroundCover:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.15
        imageView.clipsToBounds=true
        
        let view = UIVisualEffectView.init(effect: UIBlurEffect.init(style: .light))
        view.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        imageView.addSubview(view)
        imageView.sendSubviewToBack(view)
        
        view.snp.makeConstraints{ (make)in
            make.edges.equalToSuperview()
        }
        return imageView
        
    }()
    
}

// MARK: - UI
extension PersonalView {
    private func setupUI() {
        backgroundColor = .white
        addSubview(avatarView)
        avatarView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 120, height: 120))
        }
    }
    
    public func setupData() {
        avatarView.sd_setImage(with: URL(string: "https://i.loli.net/2020/04/22/9OJCGupXZbWtQB4.jpg"), completed: { (image, error, cachaType, url) in
            image?.getPaletteImageColor({ (recommendColor, allModeColorDic, error) in
                if let result = recommendColor?.imageColorString {
                    self.backgroundColor = UIColor(hex: result)
                    self.addSubview(self.backgroundCover)
                    self.backgroundCover.snp.makeConstraints { (make) in
                        make.edges.equalToSuperview()
                    }
                }
            })
        })
    }
}
