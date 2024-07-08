//
//  NewViewController.swift
//  ReminderProject
//
//  Created by 여누 on 7/7/24.
//

import UIKit
import SnapKit

let titlelist = ["마감일", "태그", "우선 순위", "이미지 추가"]

class NewViewController : UIViewController {
    
    let mainView = UIView()
    let titleTextField = UITextField()
    let memoTextField = UITextField()
    let tableView = UITableView()
    
    var datadate : String?
    var tagdate : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        navigationItem.title = "새로운 할 일"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        //        navigationController?.navigationBar.tintColor = .lightGray
        let rightBarButtonItem = UIBarButtonItem(title:"추가" , style: .plain, target: self, action: #selector(rightClicked))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        //        navigationController?.navigationBar.tintColor = .systemGray
        let leftBarButtonItem = UIBarButtonItem(title:"취소" , style: .plain, target: self, action: #selector(leftClicked))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        
        configure()
        configureLayout()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.separatorStyle = .none
        tableView.register(NewTableViewCell.self, forCellReuseIdentifier: NewTableViewCell.id)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @objc func rightClicked() {
        print(#function)
        
    }
    
    @objc func leftClicked() {
        print(#function)
        dismiss(animated: true)
    }
    
    func configure() {
        view.addSubview(tableView)
        view.addSubview(mainView)
        
        mainView.addSubview(memoTextField)
        mainView.addSubview(titleTextField)
    }
    
    func configureLayout(){
        mainView.backgroundColor = .lightGray
        mainView.layer.cornerRadius = 10
        mainView.clipsToBounds = true
        mainView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(150)
        }
        
        titleTextField.backgroundColor = .lightGray
        titleTextField.placeholder = " 제목"
        titleTextField.font = .systemFont(ofSize: 14, weight: .bold)
//        titleTextField.layer.cornerRadius = 10
//        titleTextField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(mainView.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(mainView.safeAreaLayoutGuide)
            make.height.equalTo(40)
        }
        
        memoTextField.backgroundColor = .lightGray
        memoTextField.placeholder = " 메모"
        memoTextField.font = .systemFont(ofSize: 14, weight: .bold)
//        memoTextField.layer.cornerRadius = 10
//        memoTextField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        memoTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom)
        }
        
        tableView.backgroundColor = .darkGray
        tableView.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(500)
        }
    }
    
}

extension NewViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
        let cell = tableView.dequeueReusableCell(withIdentifier: NewTableViewCell.id, for: indexPath) as! NewTableViewCell
        
        
        if indexPath.row == 0 , let date = datadate {
            cell.titleLabel.text = "\(date)"
        }else if indexPath.row == 1, let tag = tagdate {
            cell.titleLabel.text = "\(tag)"
        }else {
            cell.titleLabel.text = "\(titlelist[indexPath.row])"
        }

//        cell.titleLabel.text = "\(titlelist[indexPath.row])"
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: NewTableViewCell.id, for: indexPath) as! NewTableViewCell
        
        if indexPath.row == 0 {
            let vc = DateViewController()
                print("1")
            vc.senddate = { [self] value in
                    print("2")
                    print("날짜", value)
                if value.isEmpty {
                        print("3")
                        print("마감일")
                    }else{
                        print("4")
                        datadate = value
//                        print("adadadaadadadad",datadate)
//                        cell.titleLabel.text = "\(datadate!)"
                        tableView.reloadData()
                    }
                }
            let nav = UINavigationController(rootViewController: vc)
            self.present(nav, animated: true)
        }else if indexPath.row == 1 {
            let vc = TagViewController()
            print("1")
            vc.sendtag = { value in
                if value.isEmpty, value.contains(" ") {
                    print("2")
                }else{
                    print("3")
                    self.tagdate = value
                    tableView.reloadData()
                }
                
            }
            let nav = UINavigationController(rootViewController: vc)
            self.present(nav, animated: true)
        }

        }
    }

    

