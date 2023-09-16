//
//  ContentView.swift
//  Dice
//
//  Created by apple on 12.09.2023.
//

import SwiftUI

struct ContentView: View {
   
    @State private var resultMessage = ""
   
    var body: some View {
            VStack {
                titleView
                
                Spacer()
                
                resultMessegeView
                
                Spacer()
                
                ButtonLayout(resultMessage: $resultMessage)
                
               
            }
            .padding()
    }
}

extension ContentView {
   private var titleView: some View {
       return Text("Dungeon Dice")
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(.red)
    }
   private var resultMessegeView: some View {
        return Text(resultMessage)
            .font(.largeTitle)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .frame(height: 150)
    }
}




    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

