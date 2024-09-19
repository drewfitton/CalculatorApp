//
//  CalculatorAppApp.swift
//  CalculatorApp
//
//  Created by drewf on 9/16/24.
//

import SwiftUI

@main
struct CalculatorApp: App {
    @StateObject private var calcValues = CalculatorValues()
    var body: some Scene {
        WindowGroup {
            ContentView(calcValues: calcValues)
        }
    }
}
