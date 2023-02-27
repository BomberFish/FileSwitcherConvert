//
//  FileSwitcherConvertApp.swift
//  FileSwitcherConvert
//
//  Created by Hariz Shirazi on 2023-02-26.
//

import SwiftUI

var fspDir = URL.init(string: "")
var cowDir = URL.init(string: "")
var convertedCowDir = URL.init(string: "")
var convertedFspDir = URL.init(string: "")

@main
struct FileSwitcherConvertApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
