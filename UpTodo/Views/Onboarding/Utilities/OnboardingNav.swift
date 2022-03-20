//
//  OnboardingNav.swift
//  UpTodo
//
//  Created by Parinthon Puksuriwong on 20/3/2565 BE.
//

import SwiftUI

struct OnboardingNav: View {
    let page: Int
    var body: some View {
        HStack(spacing: 8){

            Capsule()
                .fill(page == 0 ? .white : .gray)
                .frame(width: 27, height: 5)
            Capsule()
                .fill(page == 1 ? .white : .gray)
                .frame(width: 27, height: 5)
            Capsule()
                .fill(page == 2 ? .white : .gray)
                .frame(width: 27, height: 5)

        }
        
    }
}

struct OnboardingNav_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingNav(page: 0)
    }
}
