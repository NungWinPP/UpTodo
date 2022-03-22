//
//  UpTodoApp.swift
//  UpTodo
//
//  Created by Parinthon Puksuriwong on 20/3/2565 BE.
//

import SwiftUI

enum CurrentView:Int {
    case onboarding
    case setPin
    case enterPin
    case home
}

class Views : ObservableObject {
    @Published var currentView = CurrentView.onboarding
}

@main
struct UpTodoApp: App {
    @StateObject var opData = Views()
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environmentObject(opData)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
