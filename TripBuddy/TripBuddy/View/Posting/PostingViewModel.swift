//
//  PostingViewModel.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import Foundation


class PostingViewModel: ObservableObject {
    
    @Published var step: PostingStep = .date
    @Published var title: String = ""
    @Published var text: String = ""
    @Published var count: Double = 1.0
    @Published var selectedTag: [String] = []
    @Published var selectedAge: [String] = []
    @Published var selectedPerson: Person = .man
    @Published var selectedCity: String = ""
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    @Published var moneyText: String = ""
    @Published var isVisibleAlert: Bool = false

    
    var progress: Double {
        Double(step.rawValue) * 0.33
    }
    
    func step(_ step: PostingStep) {
        self.step = step
    }
    func tagTapped(_ tag: String) {
        if selectedTag.contains(where: { $0 == tag }) {
            selectedTag.removeAll(where: { $0 == tag })
        } else {
            selectedTag.append(tag)
        }
        
    }
    func ageTapped(_ age: String) {
        if selectedAge.contains(where: { $0 == age }) {
            selectedAge.removeAll(where: { $0 == age })
        } else {
            selectedAge.append(age)
        }
    }
    
    
    func reset() {
        self.step = .date
        self.title = ""
        self.text = ""
        self.count = 1.0
        self.selectedTag = []
        self.selectedAge = []
        self.selectedPerson = .man
        self.selectedCity = ""
        self.startDate = .init()
        self.endDate = .init()
        self.moneyText = ""
        self.isVisibleAlert = false
    }
}
