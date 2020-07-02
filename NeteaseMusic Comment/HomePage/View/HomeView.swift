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
    
    // MARK: Lift Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lazy Get
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "请输入用户id"
        label.textColor = UIColor.systemBlue
        return label
    }()
    
    lazy var inputField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.keyboardType = .asciiCapable
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.systemBlue.cgColor
        field.layer.cornerRadius = 5
        field.placeholder = "🤪请输入才可以哦~"
        return field
    }()
    
    lazy var confirmBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("确定", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.layer.borderWidth = 1.0
        btn.layer.borderColor = UIColor.systemBlue.cgColor
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    lazy var rotateView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        view.layer.cornerRadius = 25
        return view
    }()
    
}

// MARK: - Event
extension HomeView {
    @objc func tapAction() {
        inputField.resignFirstResponder()
    }
}

// MARK: - UI
extension HomeView {
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(inputField)
        addSubview(confirmBtn)
        addSubview(rotateView)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
        }
        inputField.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
        confirmBtn.snp.makeConstraints { (make) in
            make.top.equalTo(inputField.snp.bottom).offset(10)
            make.right.equalTo(inputField)
            make.width.equalTo(60)
        }
        rotateView.snp.makeConstraints { (make) in
            make.top.equalTo(inputField.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
        addGestureRecognizer(tap)
        
        rotate()
    }
    
    public func rotate() {
        rotateView.transform = CGAffineTransform(translationX: 0, y: -60)
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveLinear, .repeat, .autoreverse], animations: {
            
            self.rotateView.transform = CGAffineTransform(translationX: 0, y: 60)
        }, completion: nil)
    }
    
}
