//
//  TotalViewController.swift
//  ReminderProject
//
//  Created by 여누 on 7/7/24.
//

import UIKit
import SnapKit

class TotalViewController : UIViewController {
    
    let bottomView = UIView()
    let totalTitleLabel = UILabel()
    let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    let newButton = UIButton()
    let listButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureView()
        configureLayout()
    }
    
    static func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width - 100
        
        layout.itemSize = CGSize(width: width/4, height: width/4)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return layout
    }
    
    func configureHierarchy() {
        view.addSubview(bottomView)
        view.addSubview(totalTitleLabel)
        view.addSubview(collectionVIew)
        
        bottomView.addSubview(newButton)
        bottomView.addSubview(listButton)
    }
    
    func configureView() {
//        collectionVIew.delegate = self
//        collectionVIew.dataSource = self
        
        view.backgroundColor = .lightGray
        
        navigationController?.navigationBar.tintColor = .white
        let RightBarButtonItem = UIBarButtonItem(title:"쩜쩜쩜" , style: .plain, target: self, action: #selector(RightClicked))
        navigationItem.rightBarButtonItem = RightBarButtonItem
        
        newButton.addTarget(self, action: #selector(newButtonClicked), for: .touchUpInside)
        listButton.addTarget(self, action: #selector(listButtonClicked), for: .touchUpInside)
    }
    
    @objc func RightClicked() {
        print(#function)
        
        let action = UIAlertController(title: "보 기", message: "정렬을 선택해주세요.", preferredStyle: .actionSheet)
        
        let dateList = UIAlertAction(title: "마감일순", style: .default, handler: { action in
            self.titleListClicked()
        })
        let titleList = UIAlertAction(title: "제목순", style: .default, handler: { action in
            self.titleListClicked()
        })
        let rankList = UIAlertAction(title: "우선순위낮음순", style: .default, handler: { action in
            print("destructive action called")
        })
        
        action.addAction(dateList)
        action.addAction(titleList)
        action.addAction(rankList)
        
        present(action, animated: true, completion: nil)
    }
    
    func titleListClicked() {
        print("titleListClickedtitleListClickedtitleListClicked")
    }
    
    @objc func newButtonClicked() {
        print(#function)
        let vc = NewViewController()
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true)
    }
    
    @objc func listButtonClicked() {
        print(#function)
    }
    
    func configureLayout() {
        totalTitleLabel.text = "전체"
        totalTitleLabel.textColor = .darkGray
        totalTitleLabel.textAlignment = .left
        totalTitleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        totalTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }
        
        collectionVIew.backgroundColor = .green
        collectionVIew.snp.makeConstraints { make in
            make.top.equalTo(totalTitleLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(bottomView.snp.top).inset(-10)
        }
        
        bottomView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(40)
        }
        
        newButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        newButton.setTitle(" 새로운 할 일", for: .normal)
        newButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        newButton.setTitleColor(.tintColor, for: .normal)
        newButton.contentHorizontalAlignment = .left
        newButton.snp.makeConstraints { make in
            make.top.leading.equalTo(bottomView.safeAreaLayoutGuide).inset(2.5)
            make.width.equalTo(150)
            make.height.equalTo(35)
        }
        
        listButton.setTitle("목록 추가", for: .normal)
        listButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        listButton.setTitleColor(.tintColor, for: .normal)
        listButton.contentHorizontalAlignment = .right
        listButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(bottomView.safeAreaLayoutGuide).inset(2.5)
            make.width.equalTo(150)
            make.height.equalTo(35)
        }
        
    }
    

}

//extension TotalViewController : UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 100
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//    
//}
