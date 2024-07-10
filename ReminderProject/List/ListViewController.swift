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
    
    var folder : Folder?
    
    var list : [Woo] = []
    let repository = WooTableRepository()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        list = repository.fetchAll()
        
//        if let folder = folder {
//            let value = folder.detail
//            list = Array(value)
//        }
        
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        tableView.reloadData()
    }

}


extension ListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.id, for: indexPath) as! ListTableViewCell
        let data = list[indexPath.row]
        cell.titleLabel.text = data.title
        cell.contentLabel.text = data.content
        cell.tagLabel.text = data.tag
        
        return cell
    }
    
    
}
