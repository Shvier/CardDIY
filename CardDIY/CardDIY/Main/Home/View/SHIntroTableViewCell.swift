//
//  SHIntroTableViewCell.swift
//  CardDIY
//
//  Created by Shvier on 30/08/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import UIKit

let SHIntroTableViewCellReuseIdentifier = "SHIntroTableViewCellReuseIdentifier"

class SHIntroTableViewCell: UITableViewCell {
    
    let contentLabelFontSize: CGFloat = 15
    let contentLabelOffsetLeftOrRight: CGFloat = 12
    let contentLabelOffsetTopOrBottom: CGFloat = 5
    
    var contentLabel: UILabel!
    
    // MARK: - Life Cycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
        self.makeConstraints()
    }
    
    func initUI() {
        contentLabel = ({
            let label = UILabel()
            label.font = UIFont(name: WordFontFamily, size: contentLabelFontSize)
            label.textAlignment = .left
            label.preferredMaxLayoutWidth = ScreenWidth
            label.text = LocalizedString(key: "Hello and welcome. Hope you can make your own YGO Card and have fun with it. Please contact with me as soon as possible if you have any suggestions. Some features haven't been added yet, and will be added in the future. Thanks for purchasing!")
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            return label
            }())
        contentView.addSubview(contentLabel)
    }
    
    func makeConstraints() {
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(contentLabelOffsetLeftOrRight)
            make.right.equalTo(contentView).offset(-contentLabelOffsetLeftOrRight)
            make.top.equalTo(contentView).offset(contentLabelOffsetTopOrBottom)
            make.bottom.equalTo(contentView).offset(-contentLabelOffsetTopOrBottom)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
