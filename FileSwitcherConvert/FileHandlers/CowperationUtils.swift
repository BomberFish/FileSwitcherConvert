//
//  CowperationUtils.swift
//  FileSwitcherConvert
//
//  Created by Hariz Shirazi on 2023-02-26.
//

import Foundation
import Zip
import UIKit

class Cowperation {
    static func open(urls: [URL]) {
        Haptic.shared.notify(.warning)
        UIApplication.shared.alert(title: "Warning:", body: "Cowperation importing is WIP.")
        guard let url = urls.first else { return }
        let zipurl = url.deletingPathExtension().appendingPathExtension("zip")
        do{
            try FileManager.default.removeItem(at: zipurl)
            
        }catch{ print("lol") }
        
        try! FileManager.default.moveItem(at: url, to: zipurl)
        cowDir = FileManager.default.temporaryDirectory.appendingPathComponent("cow_\(UUID().uuidString)")
        try! Zip.unzipFile(zipurl, destination: cowDir!, overwrite: true, password: "")
        UIApplication.shared.alert(title: "Imported!", body: "Saved in \(String(describing: cowDir))")
        Haptic.shared.notify(.success)
    }
    
    static func convert() {
        UIApplication.shared.alert(title: "eta son", body: "")
    }
    
    static func export() {
        UIApplication.shared.alert(title: "eta son", body: "")
    }
}
