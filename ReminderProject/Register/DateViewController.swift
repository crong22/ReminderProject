//
//  DateViewController.swift
//  ReminderProject
//
//  Created by 여누 on 7/7/24.
//

import UIKit
import SnapKit


class DateViewController : UIViewController {
    let titleLabel = UILabel()
    var datepicker = UIDatePicker()
    
    var senddate : ((String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        navigationItem.title = "마감일"
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left") , style: .plain, target: self, action: #selector(leftClicked))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        
        datepicker.datePickerMode = .date
        datepicker.locale = Locale(identifier: "ko-KR")
        
        view.addSubview(titleLabel)
        view.addSubview(datepicker)
        
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.text = "마감일 선택"
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(150)
            make.height.equalTo(50)
        }
        
        datepicker.backgroundColor = .white
        datepicker.layer.cornerRadius = 10
        datepicker.clipsToBounds = true
        datepicker.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(143)
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let dateformat = DateFormatter()
        dateformat.locale = Locale(identifier: "ko-KR")
        dateformat.dateFormat = "yyyy.MM.dd (EEE)"
        var data = dateformat.string(from : datepicker.date)
        print(String(data))
        
        senddate?(data)
        print(senddate?(data))
    }

    @objc func leftClicked() {
        dismiss(animated: true)
    }
}
