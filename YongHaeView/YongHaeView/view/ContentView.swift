//
//  ContentView.swift
//  YongHaeView
//
//  Created by 고요한 on 2/13/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var config: [config]

    var body: some View {
        Button("test") {
            let imageDataList = loadImageData(jsonFileName: "ImageInfomation")
            let lista = encodeImageData(imageDataList: imageDataList)
        }
    }
    
    
}

#Preview {
    ContentView()
        .modelContainer(for: config.self, inMemory: true)
}
