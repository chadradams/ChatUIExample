//
//  ChatView.swift
//  ChatUIExample
//
//  Created by Chad on 12/14/23.
//

import Foundation
import SwiftUI

struct ChatView: View {
    @StateObject var viewModel = ChatViewModel()  // Use StateObject for initialization

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.messages) { message in
                        MessageRow(message: message)
                    }
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(white: 0.95))
            .onTapGesture {
                hideKeyboard()
            }

            HStack {
                TextField("Type a message", text: $viewModel.newMessageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Send") {
                    viewModel.sendMessage(viewModel.newMessageText)
                    viewModel.newMessageText = ""
                }
                .disabled(viewModel.newMessageText.isEmpty)
            }
            .padding()
        }
        .navigationTitle("Chat")
    }
    // iOS Only
    private func hideKeyboard() {
#if os(iOS)
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
#endif
    }
}
