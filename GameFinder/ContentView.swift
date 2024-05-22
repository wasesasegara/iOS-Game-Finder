//
//  ContentView.swift
//  GameFinder
//
//  Created by Bis  on 22/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            guard !ProcessInfo.processInfo.isPreviewing else {
                return
            }
            do {
                let result = try await ApiManagerGames().call()
                debugPrint(result)
            } catch {
                debugPrint(error)
            }
        }
    }
}

#Preview {
    ContentView()
}
