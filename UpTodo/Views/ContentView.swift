//
//  ContentView.swift
//  UpTodo
//
//  Created by Parinthon Puksuriwong on 20/3/2565 BE.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("didSetPin") var didSetPin: Bool = false
    var body: some View {
        OnboardingView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
