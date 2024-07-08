//
//  TagViewController.swift
//  ReminderProject
//
//  Created by 여누 on 7/7/24.
//

import UIKit
import SnapKit

class TagViewController : UIViewController {
    let tagTextField = UITextField()
    var sendtag : ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        navigationItem.title = "태그"
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left") , style: .plain, target: self, action: #selector(leftClicked))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        view.addSubview(tagTextField)
        
        tagTextField.backgroundColor = .lightGray
        tagTextField.placeholder = "태그를 입력해주세요"
        tagTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sendtag?(tagTextField.text ?? "")
    }
    
    @objc func leftClicked() {
        dismiss(animated: true)
    }
    
}
