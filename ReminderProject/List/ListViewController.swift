//
//  ListViewController.swift
//  ReminderProject
//
//  Created by 여누 on 7/9/24.
//

import UIKit
import SnapKit

class ListViewController : UIViewController {
    
    let titleLabel = UILabel()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.id)
                
        let titlename = UserDefaults.standard.string(forKey: "titlename")
        titleLabel.text = "\(titlename!)"
        titleLabel.textColor = .tintColor
        titleLabel.textAlignment = .left
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }
        
        tableView.backgroundColor = .black
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

}


extension ListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.id, for: indexPath) as! ListTableViewCell
        
        
        
        return cell
    }
    
    
}
