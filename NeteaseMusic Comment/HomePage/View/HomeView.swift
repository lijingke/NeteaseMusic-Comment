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
    
    lazy var inputFiled: UITextField = {
        let filed = UITextField()
        filed.borderStyle = .roundedRect
        filed.keyboardType = .asciiCapable
        return filed
    }()
    
    lazy var confirmBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("确定", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = UIColor.systemBlue.cgColor
        btn.layer.cornerRadius = 5
        return btn
    }()
    
}

extension HomeView {
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(inputFiled)
        addSubview(confirmBtn)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
        }
        inputFiled.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
        confirmBtn.snp.makeConstraints { (make) in
            make.top.equalTo(inputFiled.snp.bottom).offset(10)
            make.right.equalTo(inputFiled)
            make.width.equalTo(50)
        }
    }
    
}
