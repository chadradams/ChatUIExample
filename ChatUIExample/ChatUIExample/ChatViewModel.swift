//
//  ChatViewModel.swift
//  ChatUIExample
//
//  Created by Chad on 12/14/23.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var newMessageText: String = ""

    func sendMessage(_ text: String) {
        // User's message
        let userMessage = Message(text: text, isCurrentUser: true)
        messages.append(userMessage)

        // Echo message
        let echoMessage = Message(text: "Echo: \(text)", isCurrentUser: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // Simulate a delay
            self.messages.append(echoMessage)
        }
    }
}

