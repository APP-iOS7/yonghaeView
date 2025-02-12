//Ver : 0_0_1
//Date : 2025-02-13
//Contents : For configration

import Foundation
import SwiftData

@Model
final class config {
    var isUpdated: Bool = false
    
    init(isUpdated: Bool) {
        self.isUpdated = isUpdated
    }
}
