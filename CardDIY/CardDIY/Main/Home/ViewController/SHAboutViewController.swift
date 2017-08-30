//
//  SHAboutViewController.swift
//  CardDIY
//
//  Created by Shvier on 29/08/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

let IntroductionSectionType: Int = 0
let IntroductionSectionRowCount: Int = 1
let OpenSourceSectionType: Int = 1
let SectionHeaderViewHeight: CGFloat = 40
let SectionHeaderTitleFontSize: CGFloat = 16
let SectionHeaderTitleOffsetLeft: CGFloat = 10

class SHAboutViewController: UIViewController {
    
    let closeButtonLength: CGFloat = 50
    let closeButtonOffsetBottom: CGFloat = 50
    let sectionTitles: [String] = [LocalizedString(key: "Introduction"), LocalizedString(key: "Open Source Projects")]
    let openSourceDict: [[String: String]] = [
        ["name": "Bugtags", "author": "北京八哥科技有限责任公司", "url": "https://www.bugtags.com/"],
        ["name": "Fabric", "author": "Twitter, Inc.", "url": "https://get.fabric.io/"],
        ["name": "SnapKit", "author": "@SnapKit", "url": "http://snapkit.io/"],
        ["name": "TOCropViewController", "author": "@TimOliver", "url": "https://github.com/TimOliver/TOCropViewController"]
    ]
    
    var closeButton: UIButton!
    var tableView: UITableView!
    
    func buttonAction(sender: UIButton) {
        if sender.isEqual(closeButton) {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func createSectionHeaderView(title: String) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: SectionHeaderViewHeight))
        view.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.1)
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont(name: WordFontFamily, size: SectionHeaderTitleFontSize)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = title
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(SectionHeaderTitleOffsetLeft)
            make.right.equalTo(view)
            make.centerY.equalTo(view)
        }
        return view
    }

    func configNavi() {
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: WordFontFamily, size: 20)!, NSForegroundColorAttributeName: UIColor.black]
        navigationItem.title = LocalizedString(key: "About")
    }
    
    func initUI() {
        view.backgroundColor = UIColor.white
        
        tableView = {
            let tableView = UITableView(frame: CGRect.zero, style: .plain)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.bounces = false
            tableView.showsVerticalScrollIndicator = false
            tableView.showsHorizontalScrollIndicator = false
            tableView.register(DHSDKTableViewCell.self, forCellReuseIdentifier: DHSDKTableViewCellReuseIdentifier)
            tableView.register(SHIntroTableViewCell.self, forCellReuseIdentifier: SHIntroTableViewCellReuseIdentifier)
            tableView.estimatedRowHeight = SectionHeaderViewHeight
            tableView.tableFooterView = UIView()
            return tableView
        }()
        view.addSubview(tableView)
        
        closeButton = {
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "btn_cancel"), for: .normal)
            button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
            return button
        }()
        view.addSubview(closeButton)
    }
    
    func makeConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(view)
            make.bottom.equalTo(closeButton.snp.top)
        }
        
        closeButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view).offset(-closeButtonOffsetBottom)
            make.centerX.equalTo(view)
            make.width.height.equalTo(closeButtonLength)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.setStatusBarStyle(.default, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavi()
        initUI()
        makeConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension SHAboutViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let dict = openSourceDict[indexPath.row]
        UIApplication.shared.openURL(URL(string: dict["url"]!)!)
    }
    
}

extension SHAboutViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case IntroductionSectionType:
            return IntroductionSectionRowCount
        case OpenSourceSectionType:
            return openSourceDict.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case IntroductionSectionType:
            let cell = tableView.dequeueReusableCell(withIdentifier: SHIntroTableViewCellReuseIdentifier, for: indexPath) as! SHIntroTableViewCell
            return cell
        case OpenSourceSectionType:
            let cell = tableView.dequeueReusableCell(withIdentifier: DHSDKTableViewCellReuseIdentifier, for: indexPath) as! DHSDKTableViewCell
            let dict = openSourceDict[indexPath.row]
            cell.sdkNameLabel.text = dict["name"]
            cell.authorNameLabel.text = dict["author"]
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case IntroductionSectionType:
            let view = createSectionHeaderView(title: LocalizedString(key: "Introduction"))
            return view
        case OpenSourceSectionType:
            let view = createSectionHeaderView(title: LocalizedString(key: "Open Source Projects"))
            return view
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SectionHeaderViewHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
