//
//  ContentView.swift
//  FileSwitcherConvert
//
//  Created by Hariz Shirazi on 2023-02-26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    Label("Import .cowperation", systemImage: "square.and.arrow.down")
                    Label("Export .cowperation", systemImage: "square.and.arrow.up")
                } header: {
                    Label("Cowabunga", systemImage: "doc.zipper")
                }
                
                Section {
                    Label("Import .fsp", systemImage: "square.and.arrow.down")
                    Label("Export .fsp", systemImage: "square.and.arrow.up")
                } header: {
                    Label("FileSwitcherPro", systemImage: "doc.zipper")
                }
            }
            .navigationTitle("FileSwitcherConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
