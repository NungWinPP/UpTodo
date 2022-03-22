//
//  HomeView.swift
//  UpTodo
//
//  Created by Parinthon Puksuriwong on 21/3/2565 BE.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        TabView{
            IndexView()
                .tabItem{
                    Label("Index", systemImage: "house.fill")
                }
            CalendarView()
                .tabItem{
                    Label("Calendar", systemImage: "calendar")
                }
            FocusesView()
                .tabItem{
                    Label("Focuses", systemImage: "clock")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .onAppear(){
            UITabBar.appearance().backgroundColor = UIColor(Color("SecondaryColor"))
            UITabBar.appearance().unselectedItemTintColor = UIColor(.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
