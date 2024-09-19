//
//  numButton.swift
//  CalculatorApp
//
//  Created by drewf on 9/17/24.
//

import SwiftUI

struct NumButton: View {
    @ObservedObject var calcValues: CalculatorValues
    var textValue: String
    var buttonWidth: CGFloat
    
    var body: some View {
        Button(action: {
            calcValues.toggleNumber(textValue)
        }) {
            Text(textValue)
                .font(.system(size: 28))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue)
                .overlay(
                    Rectangle()
                        .stroke(Color.black, lineWidth: 1.0)
                )
        }
        .frame(width: buttonWidth, height: 120)
    }
}
//
//#Preview {
//    NumButton()
//}
