//
//  PersonalViewController.swift
//  NeteaseMusic Comment
//
//  Created by 李京珂 on 2020/7/9.
//  Copyright © 2020 李京珂. All rights reserved.
//

import UIKit

class PersonalViewController: SuperViewController {
    
    // MARK: Lift Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Lazy Get
    
    lazy var mainView: PersonalView = {
        let view = PersonalView()
        return view
    }()
    
}

extension PersonalViewController {
    private func setupUI() {
        navigationItem.title = "Wheel"
        view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
