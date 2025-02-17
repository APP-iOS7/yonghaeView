//
//  YongHaeViewApp.swift
//  YongHaeView
//
//  Created by 고요한 on 2/13/25.
//

import SwiftUI
import SwiftData

struct IsFloatingKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var isFloating: Bool {
        get {self[IsFloatingKey.self]}
        set {self[IsFloatingKey.self] = newValue}
    }
}

@main
struct YongHaeViewApp: App {
    @AppStorage("isFloating") var isFloating: Bool = false
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ConfigData.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    

    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .defaultSize(width: 300, height: 300)
        .modelContainer(sharedModelContainer)
        .windowLevel(isFloating ? .floating : .normal)
        .environment(\.isFloating, isFloating)
    }
}
