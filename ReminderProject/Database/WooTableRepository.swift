//
//  WooTableRepository.swift
//  ReminderProject
//
//  Created by 여누 on 7/9/24.
//

import UIKit
import RealmSwift
final class WooTableRepository {
    
    private let realm = try! Realm()
    
    func createItem(_ data : Woo) {
        do {
            try! realm.write {
                realm.add(data)
                print("Realm Create Succeed")
            }
        }catch {
            print("Realm Error")
        }
    }
    
    func fetchAll() -> [Woo] {
        let value = realm.objects(Woo.self).sorted(byKeyPath: "money", ascending: false)
        return Array(value)
    }
}
