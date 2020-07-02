//
//  HomeViewController.swift
//  NeteaseMusic Comment
//
//  Created by 李京珂 on 2020/7/2.
//  Copyright © 2020 李京珂. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    lazy var mainView: HomeView = {
        let view = HomeView()
        return view
    }()
    
}

extension HomeViewController {
    private func setupUI() {
        view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
