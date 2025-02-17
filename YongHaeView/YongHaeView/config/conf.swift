//Ver : 0_0_1
//Date : 2025-02-13
//Contents : Impormation Server

import Foundation
import SwiftData
import SwiftUI


public class InformationConfig {
    @Environment(\.modelContext) private var modelContext
    @Query private var configs: [ConfigData]
    
    func getConfigInfo() -> ConfigData {
        print("hi\(configs)")
        return configs[0]
    }
}
