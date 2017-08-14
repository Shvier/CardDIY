//
//  SHLeftMenuViewController.swift
//  CardDIY
//
//  Created by Shvier on 12/08/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

let LeftMenuTableViewCellReuseIdentifier = "LeftMenuTableViewCellReuseIdentifier"

class SHLeftMenuViewController: UIViewController {

    var tableView: UITableView!
    
    func initUI() {
        tableView = {
            let tableView = UITableView(frame: CGRect.zero, style: .plain)
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: LeftMenuTableViewCellReuseIdentifier)
            tableView.delegate = self
            tableView.dataSource = self
            return tableView
        }()
        view.addSubview(tableView)
    }
    
    func makeContraints() {
        tableView.snp.makeConstraints { (make) in
            make.left.equalTo(view)
            make.centerY.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(120)
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

extension SHLeftMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeftMenuTableViewCellReuseIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
}
