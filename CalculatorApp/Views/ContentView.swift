//
//  ContentView.swift
//  CalculatorApp
//
//  Created by drewf on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var calcValues: CalculatorValues
    var smallWidth = UIScreen.main.bounds.width * 0.25
    var bigWidth = UIScreen.main.bounds.width * 0.5
    @State private var displayedValue: String = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack (spacing: 0) {
                TextView(calcValues: calcValues, displayedValue: $displayedValue)
                HStack (spacing: 0) {
                    CalcButton(calcValues: calcValues, textValue: calcValues.acValue, buttonWidth: smallWidth, buttonColor: Color.gray)
                    CalcButton(calcValues: calcValues, textValue: "+/-", buttonWidth: smallWidth, buttonColor: Color.gray)
                    CalcButton(calcValues: calcValues, textValue: "%", buttonWidth: smallWidth,  buttonColor: Color.gray)
                    CalcButton(calcValues: calcValues, textValue: "÷", buttonWidth: smallWidth,  buttonColor: Color.orange)
                }
                HStack (spacing: 0) {
                    NumButton(calcValues: calcValues, textValue: "7", buttonWidth: smallWidth)
                    NumButton(calcValues: calcValues, textValue: "8", buttonWidth: smallWidth)
                    NumButton(calcValues: calcValues, textValue: "9", buttonWidth: smallWidth)
                    CalcButton(calcValues: calcValues, textValue: "×", buttonWidth: smallWidth, buttonColor: Color.orange)
                }
                HStack (spacing: 0) {
                    NumButton(calcValues: calcValues, textValue: "4", buttonWidth: smallWidth)
                    NumButton(calcValues: calcValues, textValue: "5", buttonWidth: smallWidth)
                    NumButton(calcValues: calcValues, textValue: "6", buttonWidth: smallWidth)
                    CalcButton(calcValues: calcValues, textValue: "-", buttonWidth: smallWidth,  buttonColor: Color.orange)
                }
                HStack (spacing: 0) {
                    NumButton(calcValues: calcValues, textValue: "1", buttonWidth: smallWidth)
                    NumButton(calcValues: calcValues, textValue: "2", buttonWidth: smallWidth)
                    NumButton(calcValues: calcValues, textValue: "3", buttonWidth: smallWidth)
                    CalcButton(calcValues: calcValues, textValue: "+", buttonWidth: smallWidth,  buttonColor: Color.orange)
                }
                HStack (spacing: 0){
                    NumButton(calcValues: calcValues, textValue: "0", buttonWidth: bigWidth)
                    NumButton(calcValues: calcValues, textValue: ".", buttonWidth: smallWidth)
                    CalcButton(calcValues: calcValues, textValue: "=", buttonWidth: smallWidth,  buttonColor: Color.orange)
                }
            }
            .padding(.bottom, 35.0)
            .frame(maxHeight: .infinity)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    ContentView(calcValues: CalculatorValues())
}
