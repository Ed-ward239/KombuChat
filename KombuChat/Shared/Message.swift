//
//  Message.swift
//  ChatApp
//
//  Created by Edward Lee on 18/3/22.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
