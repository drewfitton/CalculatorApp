//
//  CalcButton.swift
//  CalculatorApp
//
//  Created by drewf on 9/16/24.
//

import SwiftUI

struct CalcButton: View {
    @ObservedObject var calcValues: CalculatorValues
    var textValue: String
    var buttonWidth: CGFloat
    var buttonColor: Color
    
    var body: some View {
        Button(action: {
            calcValues.toggleSign(textValue)
        }) {
            Text(textValue)
                .font(.system(size: 28))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(buttonColor)
                .overlay(
                    Rectangle()
                        .stroke(Color.black, lineWidth: 1.0)
                )
        }
        .frame(width: buttonWidth, height: 120)
    }
}

//#Preview {
//    CalcButton(calcValue: $calcValue, textValue: "0", buttonWidth: 100, buttonColor: Color.blue)
//}
