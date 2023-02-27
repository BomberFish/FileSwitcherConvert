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
        guard let url = urls.first else { return }
        let zipurl = url.deletingPathExtension().appendingPathExtension("zip")
        do{
            try FileManager.default.removeItem(at: zipurl)
            
        }catch{ print("lol") }
        
        try! FileManager.default.moveItem(at: url, to: zipurl)
        try! Zip.unzipFile(zipurl, destination: FileManager.default.temporaryDirectory.appendingPathComponent("out"), overwrite: true, password: "")
        fspDir = FileManager.default.temporaryDirectory.appendingPathComponent("out")
        UIApplication.shared.alert(title: "Imported!", body: "Saved in \(String(describing: fspDir))")
        Haptic.shared.notify(.success)
    }
    
    static func convert() {
        
    }
    
    static func export() {
        // write to disk
    }
}
