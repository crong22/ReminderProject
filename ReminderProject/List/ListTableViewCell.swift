//
//  ListTableViewCell.swift
//  ReminderProject
//
//  Created by 여누 on 7/9/24.
//


import UIKit
import SnapKit

class ListTableViewCell : UITableViewCell {
    
    static let id = "ListTableViewCell"
    let listView = UIView()
    
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    let tagLabel = UILabel()
    let dateLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
    }

    func configureHierarchy() {
        contentView.addSubview(listView)
        
        listView.addSubview(titleLabel)
        listView.addSubview(contentLabel)
        listView.addSubview(tagLabel)
        listView.addSubview(dateLabel)
    }
    
    func configureLayout() {
        contentView.backgroundColor = .black
        
        listView.backgroundColor = .black
        listView.layer.cornerRadius = 10
        listView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
        
//        titleLabel.backgroundColor = .green
        titleLabel.text = "키보드 구매"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        titleLabel.textAlignment = .left
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(5)
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(5)
        }
        
//        contentLabel.backgroundColor = .brown
        contentLabel.text = "예쁜 키캡 알아보기"
        contentLabel.textColor = .lightGray
        contentLabel.font = .systemFont(ofSize: 12, weight: .regular)
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(5)
        }
        
//        tagLabel.backgroundColor = .cyan
        tagLabel.text = "#쇼핑"
        tagLabel.font = .systemFont(ofSize: 10, weight: .bold)
        tagLabel.textColor = .systemBlue
        tagLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(5)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(5)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//
//extension NewTableViewCell {
//    
//    func abc(title : String) {
//        print("2424242424")
//        
//        titleLabel.text = "\(title)"
//    }
//}

