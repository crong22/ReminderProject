//
//  PriorityViewController.swift
//  ReminderProject
//
//  Created by 여누 on 7/7/24.
//

import UIKit
import SnapKit

class PriorityViewController : UIViewController {
    
    
    let list = ["높음", "보통", "낮음"]
    lazy var segmente = UISegmentedControl(items: list)
    
    var sendpriority : ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .darkGray
        
        navigationItem.title = "우선순위"
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left") , style: .plain, target: self, action: #selector(leftClicked))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        //constraint를 설정해주기 위해 false를 해야한다.
        segmente.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmente)
        
        segmente.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        segmente.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)

        // control를 했을 때 해당 index를 출력해줍니다.
    }
    
    @objc func leftClicked() {
        print(#function)
        dismiss(animated: true)
    }
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        print("\(sender.selectedSegmentIndex)")
        if sender.selectedSegmentIndex == 0 {
            sendpriority?("\(list[0])")
        }else if sender.selectedSegmentIndex == 1 {
            sendpriority?("\(list[1])")
        }else {
            sendpriority?("\(list[2])")
        }
        
    }
}
