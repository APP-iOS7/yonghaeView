//Ver : 0_0_1
//Date : 2025-02-13
//Contents : For configration

import Foundation
import SwiftData

@Model
final class ConfigData {
    var isUpdated: Bool?
    
    init(isUpdated: Bool?, isFloating: Bool?) {
        self.isUpdated = isUpdated
    }
}
