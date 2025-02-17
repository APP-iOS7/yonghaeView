//
//  IntroView.swift
//  YongHaeView
//
//  Created by 고요한 on 2/15/25.
//

import Foundation
import SwiftUI
import SwiftData

struct IntroView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var ConfigData: [ConfigData]

    var body: some View {
        VStack{
            Text("로딩뷰")
            Text("업데이트 확인 중 ")
        }
    }
    
    
}
