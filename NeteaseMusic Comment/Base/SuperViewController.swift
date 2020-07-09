//
//  SuperViewController.swift
//  NeteaseMusic Comment
//
//  Created by 李京珂 on 2020/7/9.
//  Copyright © 2020 李京珂. All rights reserved.
//

import UIKit

class SuperViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.navigationController?.navigationBar.isTranslucent = false
        let backItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(self.goBack(sender:)))
        backItem.tintColor = .black
        navigationItem.leftBarButtonItem = backItem
    }
    
}

extension SuperViewController {
    @objc private func goBack(sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}
