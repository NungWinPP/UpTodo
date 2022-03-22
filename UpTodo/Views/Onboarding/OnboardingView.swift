//
//  OnboardingView.swift
//  UpTodo
//
//  Created by Parinthon Puksuriwong on 20/3/2565 BE.
//

import SwiftUI

struct OnboardingView: View {
    @State private var onPage = 0
    @EnvironmentObject var currentView: Views

    let pageData = [
        ["Manage your tasks", "You can easily manage all of your daily\ntasks in DoMe for free"],
        ["Create daily routine", "In Uptodo  you can create your\npersonalized routine to stay productive"],
        ["Orgonaize your tasks", "You can organize your daily tasks by\nadding your tasks into separate categories"]]



    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                ZStack{
                    Color("BgColor")
                        .ignoresSafeArea()
                    VStack{
                        //MARK: TOP
                        NavigationLink(destination: SetPinView()){
                            Text("SKIP")
                                .padding()
                                .frame(width: geometry.size.width, alignment: .leading)
                                .font(.body)
                                .foregroundColor(.gray)
                        }

                        //: Change image by page number
                        Image("Onboarding\(onPage+1)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: geometry.size.height * 0.34, alignment: .center)

                        OnboardingNav(page: onPage)

                        //MARK: BODY
                            .padding(.top, geometry.size.height * 0.05)
                            .padding(.bottom, geometry.size.height * 0.05)

                        //: Change page's content by page number
                        Text(pageData[onPage][0])
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, geometry.size.height * 0.04)
                            .transition(.opacity)

                        Text(pageData[onPage][1])
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(.body)


                        Spacer()

                        //MARK: BOTTOM

                        HStack{
                            if onPage > 0 {
                                Button("BACK"){
                                    onPage-=1
                                }
                                .padding()
                                .foregroundColor(.gray)
                            }
                            Spacer()

                            // Button to go to next page
                            // if it's the last page go to set pin view
                            if onPage < 2 {
                                Button("NEXT"){
                                    onPage+=1
                                }
                                .padding(.horizontal, 23)
                                .padding(.vertical)
                                .background(Color("AccentColor"))
                                .cornerRadius(5)
                                .foregroundColor(.white)
                                .padding(.trailing)
                            } else {
//                                NavigationLink(destination: SetPinView()){
                                    Text("GET STARTED")
                                        .padding(.horizontal, 23)
                                        .padding(.vertical)
                                        .background(Color("AccentColor"))
                                        .cornerRadius(5)
                                        .foregroundColor(.white)
                                        .padding(.trailing)
                                        .onTapGesture {
                                            currentView.currentView = .home
                                        }
                                //}
                            }

                        }
                    } //: VStack
                } //: ZStack
            } //: GeometryReader
            .navigationBarTitle("")
            .navigationBarHidden(true)
        } //: NavigationView
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
