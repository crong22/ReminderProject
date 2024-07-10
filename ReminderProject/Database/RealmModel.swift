//
//  RealmModel.swift
//  ReminderProject
//
//  Created by 여누 on 7/8/24.
//

import UIKit
import RealmSwift


class Folder : Object {
    @Persisted(primaryKey: true) var id: ObjectId // 순번(PK)
    @Persisted var name: String
    @Persisted var option: String
    @Persisted var regDate: Date
    @Persisted var detail: List<Woo>

}

class Woo: Object {
    @Persisted(primaryKey: true) var id: ObjectId // 순번(PK)
    @Persisted(indexed: true) var title: String // 메모제목(필수)
    @Persisted var content: String? // 메모내용
    @Persisted var tag: String // tag(필수)
    @Persisted var finishdate: String? // 마감일
    @Persisted var priority: String? // 우선순위
    
    convenience init(title: String, content: String?, tag: String, finishdate: String?, priority: String?) {
        self.init()
        self.title = title
        self.content = content
        self.tag = tag
        self.finishdate = finishdate
        self.priority = priority
    }
}
