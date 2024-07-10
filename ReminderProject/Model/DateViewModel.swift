//
//  DateViewModel.swift
//  ReminderProject
//
//  Created by 여누 on 7/9/24.
//

import Foundation

class DateViewModel {
    
    var inputdate: Observable<String?> = Observable(nil)
    
    var outputdate: Observable<String?> = Observable(nil)
    
    init() {
        inputdate.bind { _ in
            self.confirm()
        }
    }
    
    private func confirm() {
        print("inputdate : \(inputdate.value)")
        outputdate.value = inputdate.value
        print("outputdage :::: \(outputdate.value)")
        
        return
    }
}
