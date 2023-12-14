//
//  Message.swift
//  ChatUIExample
//
//  Created by Chad on 12/14/23.
//

import Foundation

struct Message: Identifiable {
    var id: String = UUID().uuidString
    var text: String
    var isCurrentUser: Bool
}
