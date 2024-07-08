//
//  NewTableViewCell.swift
//  ReminderProject
//
//  Created by 여누 on 7/7/24.
//

import UIKit
import SnapKit

class NewTableViewCell : UITableViewCell {
    
    static let id = "NewTableViewCell"
    let listView = UIView()
    var titleLabel = UILabel()
    let nextButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
    }

    func configureHierarchy() {
        contentView.addSubview(listView)
        
        listView.addSubview(titleLabel)
        listView.addSubview(nextButton)
    }
    
    func configureLayout() {
        contentView.backgroundColor = .darkGray
        
        listView.backgroundColor = .lightGray
        listView.layer.cornerRadius = 10
        listView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        titleLabel.textAlignment = .left
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(5)
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(5)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).offset(-5)
        }
        
        nextButton.titleLabel?.textAlignment = .right
        nextButton.tintColor = .gray
        nextButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        nextButton.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-5)
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(5)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).offset(-5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewTableViewCell {
    
    func abc(title : String) {
        print("2424242424")
        
        titleLabel.text = "\(title)"
    }
}
