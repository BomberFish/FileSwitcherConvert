//
//  ContentView.swift
//  FileSwitcherConvert
//
//  Created by Hariz Shirazi on 2023-02-26.
//

import SwiftUI
import Zip
import FilePicker

struct ContentView: View {
    let appVersion = ((Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown") + " (" + (Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown") + ")")
    var body: some View {
        NavigationView {
            List {
                Section {
                    FilePicker(types: [.init(filenameExtension: "fsp")!], allowMultiple: false, onPicked: { urls in
                        Fsp.open(urls: urls)
                    }, label: {
                        Label("Import .fsp", systemImage: "square.and.arrow.down")
                    })
                    Button(action: {
                        Fsp.convert()
                    }, label: {
                        Label("Convert to .cowperation", systemImage: "arrow.triangle.2.circlepath")
                    })
                    Button(action: {
                        Fsp.export()
                    }, label: {
                        Label("Export .fsp", systemImage: "square.and.arrow.up")
                    })
                    
                } header: {
                    Label("FileSwitcherPro", systemImage: "doc.zipper")
                }
                Section {
                    FilePicker(types: [.init(filenameExtension: "cowperation")!], allowMultiple: false, onPicked: { urls in
                        Cowperation.open(urls: urls)}, label: {
                        Label("Import .cowperation", systemImage: "square.and.arrow.down")
                    })
                    Button(action: {
                        Cowperation.convert()
                    }, label: {
                        Label("Convert to .fsp (why)", systemImage: "arrow.triangle.2.circlepath")
                    })
                    Button(action: {
                        Cowperation.export()
                    }, label: {
                        Label("Export .cowperation", systemImage: "square.and.arrow.up")
                    })
                    
                } header: {
                    Label("Cowabunga", systemImage: "doc.zipper")
                }
                
                Section {
                    LinkCell(imageName: "bomberfish", url: "https://github.com/Bomberfish", title: "BomberFish", contribution: "Main Developer", circle: true)
                    LinkCell(imageName: "suslocation", url: "https://github.com/sourcelocation", title: "sourcelocation", contribution: "Reverse-engineering the .fsp format, various code snippets", circle: true)
                    LinkCell(imageName: "markrenaud", url: "https://github.com/markrenaud", title: "Mark Renaud", contribution: "FilePicker", circle: true)
                } header: {
                    Label("Credits", systemImage: "heart.fill")
                }
                Section{}header: {
                    Label("FileSwitcherConvert \(appVersion)", systemImage: "info.circle")
                }
                
            }
            .navigationTitle("FileSwitcherConvert")
        }
    }
    
    struct LinkCell: View {
        var imageName: String
        var url: String
        var title: String
        var contribution: String
        var systemImage: Bool = false
        var circle: Bool = false
        
        var body: some View {
            HStack(alignment: .center) {
                Group {
                    if systemImage {
                        Image(systemName: imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        if imageName != "" {
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
                .cornerRadius(circle ? .infinity : 0)
                .frame(width: 24, height: 24)
                
                VStack {
                    HStack {
                        Button(action: {
                            if url != "" {
                                UIApplication.shared.open(URL(string: url)!)
                            }
                        }) {
                            Text(title)
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal, 6)
                        Spacer()
                    }
                    HStack {
                        Text(contribution)
                            .padding(.horizontal, 6)
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .foregroundColor(.accentColor)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
