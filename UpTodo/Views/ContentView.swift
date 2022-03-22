//
//  ContentView.swift
//  UpTodo
//
//  Created by Parinthon Puksuriwong on 20/3/2565 BE.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("didSetPin") var didSetPin: Bool = false
    @EnvironmentObject var opData: Views

    var body: some View {
        switch (opData.currentView){
        case .onboarding:
            OnboardingView()
                .environmentObject(opData)
        case .setPin:
            SetPinView()
                .environmentObject(opData)
        case .home:
            HomeView()
                .environmentObject(opData)
        default:
            HomeView()
                .environmentObject(opData)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
