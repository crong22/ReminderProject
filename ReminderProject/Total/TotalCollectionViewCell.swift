//
//  TotalCollectionViewCell.swift
//  ReminderProject
//
//  Created by 여누 on 7/8/24.
//

import UIKit
import SnapKit

class TotalCollectionViewCell : UICollectionViewCell {
    static let id = "TotalCollectionViewCell"
    
    let mainView = UIView()
    let imageView = UIImageView()
    let countLabel = UILabel()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .black
        mainView.backgroundColor = .darkGray
        
        contentView.addSubview(mainView)
        
        mainView.addSubview(imageView)
        mainView.addSubview(countLabel)
        mainView.addSubview(titleLabel)
        
//        mainView.backgroundColor = .systemBackground
        mainView.layer.cornerRadius = 10
        mainView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
        
        imageView.backgroundColor = .blue
        imageView.tintColor = .white
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 17.5
        imageView.snp.makeConstraints { make in
            make.top.leading.equalTo(mainView.safeAreaLayoutGuide).offset(10)
            make.height.width.equalTo(35)
        }
        
        countLabel.text = "0"
        countLabel.textColor = .white
        countLabel.textAlignment = .right
        countLabel.font = .systemFont(ofSize: 28, weight: .bold)
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(mainView.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(mainView.safeAreaLayoutGuide).offset(-10)
            make.height.width.equalTo(35)
            
        }
        
        titleLabel.text = "오늘"
        titleLabel.textColor = .lightGray
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.leading.equalTo(mainView.safeAreaLayoutGuide).offset(10)
            make.height.equalTo(30)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
