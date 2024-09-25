//
//  PartnerCheckManager.swift
//  TripBuddy
//
//  Created by 김동경 on 9/25/24.
//

import Foundation


enum PartnerState {
    case none
    case partner
}

class PartnerCheckManager: ObservableObject {
    @Published var partnerState: PartnerState = .none
}
