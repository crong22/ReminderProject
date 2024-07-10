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
    
    var viewmodel = DateViewModel()
    
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
        
        datepicker.addTarget(self, action: #selector(datepickerTapped), for: .valueChanged)
        
        bindData()
    }
    
    @objc func datepickerTapped() {
        let dateformat = DateFormatter()
        dateformat.locale = Locale(identifier: "ko-KR")
        dateformat.dateFormat = "yyyy.MM.dd (EEE)"
        var data = dateformat.string(from : datepicker.date)
        senddate?(data)
        viewmodel.inputdate.value = data
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("11111111")
    }

    func bindData() {
        viewmodel.outputdate.bind { value in
            print("vavavavava \(value)")
            let vc = NewViewController()
            vc.datadate = value
            self.senddate?(value ?? "")
            print("데이타데이터valuevaluevalue \(vc.datadate)")
        }
    }
    
    @objc func leftClicked() {
        dismiss(animated: true)
    }
}
