//
//  TextView.swift
//  CalculatorApp
//
//  Created by drewf on 9/18/24.
//

import SwiftUI

struct TextView: View {
    @ObservedObject var calcValues: CalculatorValues
    @Binding var displayedValue: String
    var body: some View {
        HStack {
            Spacer()
            GeometryReader { geometry in
                Text(displayedValue)
                    .fontWeight(.thin)
                    .font(.system(size: 70))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .onAppear {
                        adjustDisplayedValueToFitWidth(maxWidth: geometry.size.width)
                    }
                    .onChange(of: calcValues.value) {
                        adjustDisplayedValueToFitWidth(maxWidth: geometry.size.width)
                    }
            }
        }
    }
    
    private func adjustDisplayedValueToFitWidth(maxWidth: CGFloat) {
            var decimalPlaces = 8
            var formattedValue = calcValues.value
            
            // Measure the text size to check if it exceeds the available width
        while textWidth(for: formattedValue) > maxWidth && decimalPlaces > 0 && Double(formattedValue)!.truncatingRemainder(dividingBy: 1) != 0 {
                decimalPlaces -= 1
                if let doubleValue = Double(calcValues.value) {
                    formattedValue = String(format: "%.\(decimalPlaces)f", doubleValue)
                }
            }
            
            displayedValue = formattedValue
        }
    
    private func textWidth(for text: String) -> CGFloat {
            let font = UIFont.systemFont(ofSize: 70)
            let attributes = [NSAttributedString.Key.font: font]
            let size = (text as NSString).size(withAttributes: attributes)
            return size.width
        }
}

//#Preview {
//    TextView()
//}
