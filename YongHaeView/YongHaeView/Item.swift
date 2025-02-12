//
//  Item.swift
//  YongHaeView
//
//  Created by 고요한 on 2/13/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
