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
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.indicatorStyle = .black
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isPagingEnabled = true
        view.bounces = false
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var tableViewOne: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        return table
    }()
    
    lazy var tableViewTwo: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        return table
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

// MARK: - UI && Data
extension PersonalView {
    private func setupUI() {
        backgroundColor = .white
        addSubview(avatarView)
        addSubview(scrollView)
        avatarView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 120, height: 120))
        }
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(avatarView.snp.bottom).offset(50)
            make.left.bottom.right.equalToSuperview()
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.width.equalTo(UIScreen.main.bounds.width * 2)
            make.height.equalToSuperview()
        }
        
        contentView.addSubview(tableViewOne)
        contentView.addSubview(tableViewTwo)
        
        tableViewOne.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        tableViewTwo.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.width.equalTo(tableViewOne)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
        
        scrollView.contentSize = contentView.frame.size
    }
    
    public func setupData() {
        avatarView.sd_setImage(with: URL(string: "https://i.loli.net/2020/04/22/9OJCGupXZbWtQB4.jpg"), completed: { (image, error, cachaType, url) in
            image?.getPaletteImageColor({ (recommendColor, allModeColorDic, error) in
                if let result = recommendColor?.imageColorString {
                    self.backgroundColor = UIColor(hex: result)
//                    self.addSubview(self.backgroundCover)
//                    self.backgroundCover.snp.makeConstraints { (make) in
//                        make.edges.equalToSuperview()
//                    }
                }
            })
        })
    }
}

// MARK: - UITableViewDelegate
extension PersonalView: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension PersonalView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
