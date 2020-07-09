//
//  HomeView.swift
//  NeteaseMusic Comment
//
//  Created by 李京珂 on 2020/7/2.
//  Copyright © 2020 李京珂. All rights reserved.
//

import UIKit
import SnapKit
import iOSPalette

class HomeView: UIView {
    
    // MARK: Property
    weak var delegate: HomePageEventProtocol?
    
    public var userId: String? {
        didSet {
            inputField.text = userId
        }
    }
    
    // MARK: Lift Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = testView.bounds
        
        let fromColor = UIColor.green.cgColor
        let minColor = UIColor.red.cgColor
        let toColor = UIColor.blue.cgColor
        
        gradientLayer.colors = [fromColor,minColor,toColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [0,0.3,1]
        testView.layer.addSublayer(gradientLayer)
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
        btn.addTarget(self, action: #selector(self.confirmAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var jumpBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("跳转到网易云音乐复制昵称", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemRed
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(self.jumpAction), for: .touchUpInside)
        return btn
    }()

    
    lazy var rotateView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var praiseLayer: PraiseLayer = {
        let layer = PraiseLayer(rectSize: UIScreen.main.bounds)
        return layer
    }()
    
    lazy var testView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
}

// MARK: - Event
extension HomeView {
    
    @objc func confirmAction() {
        layer.addSublayer(praiseLayer)
        delegate?.goToPersonalVC()
    }
    
    @objc func tapAction() {
        inputField.resignFirstResponder()
    }
    
    @objc func jumpAction() {
        let customURL = "orpheus://"
        if UIApplication.shared.canOpenURL(URL(string: customURL)!) {
            UIApplication.shared.open(URL(string: customURL)!, options: [:], completionHandler: nil)
        }
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
        addSubview(jumpBtn)

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
        
        jumpBtn.snp.makeConstraints { (make) in
            make.top.equalTo(rotateView.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
        addGestureRecognizer(tap)
        
        rotate()
        
        addSubview(testView)
        
        testView.snp.makeConstraints { (make) in
            make.top.equalTo(jumpBtn.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 90, height: 90))
        }
    }
    
    public func rotate() {
        rotateView.transform = CGAffineTransform(translationX: 0, y: -60)
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveLinear, .repeat, .autoreverse], animations: {
            self.rotateView.transform = CGAffineTransform(translationX: 0, y: 60)
        }, completion: nil)
    }
    
}
