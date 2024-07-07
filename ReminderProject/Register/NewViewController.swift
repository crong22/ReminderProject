//
//  NewViewController.swift
//  ReminderProject
//
//  Created by 여누 on 7/7/24.
//

import UIKit

class NewViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
//        navigationController?.navigationBar.tintColor = .lightGray
        let rightBarButtonItem = UIBarButtonItem(title:"추가" , style: .plain, target: self, action: #selector(rightClicked))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
//        navigationController?.navigationBar.tintColor = .systemGray
        let leftBarButtonItem = UIBarButtonItem(title:"취소" , style: .plain, target: self, action: #selector(leftClicked))
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc func rightClicked() {
        print(#function)
    
    }
    
    @objc func leftClicked() {
        print(#function)
        dismiss(animated: true)
    }
}
