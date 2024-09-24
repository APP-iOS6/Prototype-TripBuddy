//
//  CityModalView.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI

struct CityModalView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var query: String = ""
    @State private var cities: [String] = ["서울", "대구", "부산", "대전", "이천", "울산", "광주", "용인", "고양", "김포", "의정부", "파주", "세종", "김해", "서산", "군포", "의왕", "안양"]
    
    var queryList: [String] {
        if query.isEmpty {
            return cities
        } else {
            return cities.filter { $0.contains(query) }
        }
    }
    private let action: (String) -> Void
    
    init(action: @escaping (String) -> Void) {
        self.action = action
    }
    
    
    var body: some View {
        VStack {
            //TODO: 검색바 넣어야 됨
            SearchBar(text: $query)
                .padding()
            
            List {
                ForEach(queryList, id: \.self) { city in
                    Button {
                        action(city)
                        dismiss()
                    } label: {
                        Text(city)
                            .padding()
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct SearchBar: View {
    
    @Binding var text: String
    private var isEditing: Bool {
        text.isEmpty
    }
    
    var body: some View {
        HStack {
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
            
        }.overlay {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                
                if !isEditing {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        CityModalView(action: {_ in})
    }
}

#Preview {
    SearchBar(text: .constant("test"))
}
