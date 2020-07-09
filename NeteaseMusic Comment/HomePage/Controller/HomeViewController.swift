//
//  HomeViewController.swift
//  NeteaseMusic Comment
//
//  Created by 李京珂 on 2020/7/2.
//  Copyright © 2020 李京珂. All rights reserved.
//

import UIKit

class HomeViewController: SuperViewController {
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addListener()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        mainView.rotate()
        recognition()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Lazy Get
    
    lazy var mainView: HomeView = {
        let view = HomeView()
        view.delegate = self
        return view
    }()
    
}

// MAKR: - HomePageEventProtocol
extension HomeViewController: HomePageEventProtocol {
    func goToPersonalVC() {
        let vc = PersonalViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UI
extension HomeViewController {
    private func setupUI() {
        view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - Event
extension HomeViewController {
    
    private func addListener() {
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc private func applicationWillEnterForeground() {
        mainView.rotate()
        recognition()
    }
    
    private func recognition() {
        let regex = try? NSRegularExpression(pattern: "id=(\\d*)")
        
        //识别剪贴板中的内容
        if let paste = UIPasteboard.general.string, let match = regex?.firstMatch(in: paste, options: [], range: NSRange(location: 0, length: paste.count)) {
                        
            let matchString = (paste as NSString).substring(with: match.range)
            let userId = matchString.replacingOccurrences(of: "id=", with: "")

            if mainView.userId == userId {
                return
            }

            let alert = UIAlertController(title: "要打开剪贴板中的链接吗？", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "打开", style: .default, handler: { [weak self] (action) in
                self?.mainView.userId = userId
            }))
            alert.addAction(UIAlertAction(title: "忽略", style: .cancel, handler: nil))
            self.navigationController?.present(alert, animated: true, completion: nil)
        }
    }
    
}
