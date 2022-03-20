//
//  SetPinView.swift
//  UpTodo
//
//  Created by Parinthon Puksuriwong on 20/3/2565 BE.
//

import SwiftUI

struct SetPinView: View {

    var body: some View {
            ZStack {
                Color("BgColor")
                    .ignoresSafeArea()
                VStack{
                    Text("Setup the pin")
                        .font(.largeTitle)
                        .foregroundColor(.white)

                    HStack(spacing: 20){
                        Circle()
                            .fill(.white)
                            .frame(width: 30)
                            .padding(0)
                        Circle()
                            .fill(.white)
                            .frame(width: 30)
                            .padding(0)
                        Circle()
                            .fill(.white)
                            .frame(width: 30)
                            .padding(0)
                        Circle()
                            .fill(.white)
                            .frame(width: 30)
                            .padding(0)
                    }
                    .frame(width: 200, height: 100, alignment: .center)

                    LazyVGrid(columns: Array(repeating: GridItem(.fixed(30)), count: 3), spacing:30){
                        ForEach(1...9, id:\.self){value in
                            Text("\(value)")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                            .background(Color("AccentColor"))
                            .foregroundColor(.white)

                        }
                    }

                    Spacer()

                }//: VStack
            }//: ZStack
        }

    }


struct SetPinView_Previews: PreviewProvider {
    static var previews: some View {
        SetPinView()
    }
}
