//
//  SHLeftMenuViewController.swift
//  CardDIY
//
//  Created by Shvier on 12/08/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

class SHLeftMenuViewController: UIViewController {

    var tableView: UITableView!
    
    func initUI() {
        tableView = {
            let tableView = UITableView(frame: CGRect.zero, style: .plain)
            return tableView
        }()
        view.addSubview(tableView)
    }
    
    func makeContraints() {
        tableView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalTo(view)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        makeContraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
