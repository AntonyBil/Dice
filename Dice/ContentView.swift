//
//  ContentView.swift
//  Dice
//
//  Created by apple on 12.09.2023.
//

import SwiftUI

struct ContentView: View {
    enum Dice: Int, CaseIterable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    
    @State private var resultMessage = ""
    @State private var buttonsLeftOver = 0
    
    let horizontalPadding:CGFloat = 16
    let spacing: CGFloat = 0 // between buttons
    let buttonWidth: CGFloat = 130
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                titleView
                
                Spacer()
                
                resultMessegeView
                
                Spacer()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: buttonWidth), spacing: spacing)]) {
                    ForEach(Dice.allCases.dropLast(buttonsLeftOver), id: \.self) { dice in
                        Button("\(dice.rawValue)-sides") {
                            resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice"
                        }
                        .frame(width: buttonWidth)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    
                }
                HStack {
                    ForEach(Dice.allCases.suffix(buttonsLeftOver), id: \.self) { dice in
                        Button("\(dice.rawValue)-sides") {
                            resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice"
                        }
                        .frame(width: buttonWidth)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
            }
            .padding()
            .onChange(of: geo.size.width, perform: { newValue in
                arrangeGridItems(diviceWidth: geo.size.width)
            })
            .onAppear {
                arrangeGridItems(diviceWidth: geo.size.width)
            }
        }
       
    }
    
    func arrangeGridItems(diviceWidth: CGFloat) {
        var screenWidth = diviceWidth - horizontalPadding * 2 //padding on both sides
        if Dice.allCases.count > 1 {
            screenWidth += spacing
        }
        
        //calculate numOfButtonsPerRow as an Int
        let numberOfButtonPerRow = Int(screenWidth) / Int(buttonWidth + spacing)
        buttonsLeftOver = Dice.allCases.count % numberOfButtonPerRow
        print("numberOfButtonsPerRow = \(numberOfButtonPerRow)")
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

