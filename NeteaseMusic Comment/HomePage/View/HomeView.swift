//
//  HomeView.swift
//  NeteaseMusic Comment
//
//  Created by 李京珂 on 2020/7/2.
//  Copyright © 2020 李京珂. All rights reserved.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "请输入用户Id"
        label.textColor = UIColor.systemBlue
        return label
    }()
    
}

extension HomeView {
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
}
