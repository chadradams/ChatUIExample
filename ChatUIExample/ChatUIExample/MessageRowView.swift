//
//  MessageRowView.swift
//  ChatUIExample
//
//  Created by Chad on 12/14/23.
//

import Foundation
import SwiftUI

struct MessageRow: View {
    var message: Message

    var body: some View {
        HStack(alignment: .bottom, spacing: 12) {
            if message.isCurrentUser {
                Spacer()
            }
            Text(message.text)
                .padding()
                .background(message.isCurrentUser ? Color.blue : Color.gray)
                .foregroundColor(message.isCurrentUser ? Color.white : Color.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 2, x: 3, y: 3)
            if !message.isCurrentUser {
                Spacer()
            }
        }
    }
}
