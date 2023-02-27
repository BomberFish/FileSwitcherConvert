//
//  FspUtils.swift
//  FileSwitcherConvert
//
//  Created by Hariz Shirazi on 2023-02-26.
//

import Foundation
import UIKit
import Zip
import ZipFoundation

class Fsp {
    static func open(urls: [URL]) {
        // thx suslocation for fsp code
        guard let url = urls.first else { return }
        let zipurl = url.deletingPathExtension().appendingPathExtension("zip")
        do {
            try FileManager.default.removeItem(at: zipurl)
            
        } catch { print("lol") }
        
        try! FileManager.default.moveItem(at: url, to: zipurl)
        
        /*
         hello dev over there who is curious how this code works!
         yes LMFAO it's just a zip wrapper
         but don't tell anyone ;)
         
         ⠀⠀⠘⡀⠀⠀⠀⠀⠀⠀⠀gotcha, will⠀⠀⠀⠀⡜⠀⠀⠀
         ⠀⠀⠀⠑⡀⠀⠀keep it a secret⠀⠀⠀⡔⠁⠀⠀⠀
         ⠀⠀⠀⠀⠈⠢⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠴⠊⠀⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⢀⣀⣀⣀⣀⣀⡀⠤⠄⠒⠈⠀⠀⠀⠀⠀⠀⠀⠀
         ⠀⠀⠀⠀⠀⠀⠀⠘⣀⠄⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
         ⠀
         ⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠛⠛⠋⠉⠈⠉⠉⠉⠉⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿
         ⣿⣿⣿⣿⣿⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣿⣿
         ⣿⣿⣿⣿⡏⣀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿
         ⣿⣿⣿⢏⣴⣿⣷⠀⠀⠀⠀⠀⢾⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿
         ⣿⣿⣟⣾⣿⡟⠁⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣷⢢⠀⠀⠀⠀⠀⠀⠀⢸⣿
         ⣿⣿⣿⣿⣟⠀⡴⠄⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⣿
         ⣿⣿⣿⠟⠻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠶⢴⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⣿
         ⣿⣁⡀⠀⠀⢰⢠⣦⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⡄⠀⣴⣶⣿⡄⣿
         ⣿⡋⠀⠀⠀⠎⢸⣿⡆⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⠗⢘⣿⣟⠛⠿⣼
         ⣿⣿⠋⢀⡌⢰⣿⡿⢿⡀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⡇⠀⢸⣿⣿⣧⢀⣼
         ⣿⣿⣷⢻⠄⠘⠛⠋⠛⠃⠀⠀⠀⠀⠀⢿⣧⠈⠉⠙⠛⠋⠀⠀⠀⣿⣿⣿⣿⣿
         ⣿⣿⣧⠀⠈⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠟⠀⠀⠀⠀⢀⢃⠀⠀⢸⣿⣿⣿⣿
         ⣿⣿⡿⠀⠴⢗⣠⣤⣴⡶⠶⠖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡸⠀⣿⣿⣿⣿
         ⣿⣿⣿⡀⢠⣾⣿⠏⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠉⠀⣿⣿⣿⣿
         ⣿⣿⣿⣧⠈⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿
         ⣿⣿⣿⣿⡄⠈⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⣿⣿
         ⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿
         ⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
         ⣿⣿⣿⣿⣿⣦⣄⣀⣀⣀⣀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
         ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
         ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠙⣿⣿⡟⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿
         ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠁⠀⠀⠹⣿⠃⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿
         ⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢐⣿⣿⣿⣿⣿⣿⣿⣿⣿
         ⣿⣿⣿⣿⠿⠛⠉⠉⠁⠀⢻⣿⡇⠀⠀⠀⠀⠀⠀⢀⠈⣿⣿⡿⠉⠛⠛⠛⠉⠉
         ⣿⡿⠋⠁⠀⠀⢀⣀⣠⡴⣸⣿⣇⡄⠀⠀⠀⠀⢀⡿⠄⠙⠛⠀⣀⣠⣤⣤⠄⠀
         
         */
        
        fspDir = FileManager.default.temporaryDirectory.appendingPathComponent("fsp_\(UUID().uuidString)")
        try! Zip.unzipFile(zipurl, destination: fspDir!, overwrite: true, password: "aVBob25l5oyB44Gj44Gm6LuK5Lit5rOK44Gu5peF44Gr6KGM44GN44Gf44GE44Gq44CC44GC44Gj44Gf44GL44GE44Gf44G+44GU44KC6aOf44G544Gf44GE44GX44CC")
        UIApplication.shared.alert(title: "Imported!", body: "Saved in \(String(describing: fspDir))")
        Haptic.shared.notify(.success)
    }
    
    static func convert() {
        // FIXME: Crashes without file
        UIApplication.shared.alert(title: "eta son", body: "")
        let infoPath = fspDir!.appendingPathComponent("Share/info.json")
        print(infoPath)
        UIApplication.shared.alert(title: "", body: "Converting", animated: true)
        let infoJson = try? JSONSerialization.jsonObject(with: Data(contentsOf: infoPath)) as? [String: Any]
        print(infoJson as Any)
        let name = infoJson!["Name"] as? String
        print(name as Any)
        let targetFile = infoJson!["TargetFilePath"] as? String
        print(targetFile as Any)
        let id = infoJson!["ID"] as? String
        print(id as Any)
        let author = infoJson!["Share_Author"] as? String
        print(author as Any)
        let location = infoJson!["LocationRequire"] as? Bool
        print(location as Any)
        let convertedPath = FileManager.default.temporaryDirectory.appendingPathComponent("cow_from_fsp\(UUID().uuidString)")
        try! FileManager.default.createDirectory(at: convertedPath, withIntermediateDirectories: true)
        try! FileManager.default.copyItem(at: fspDir!.appendingPathComponent("Files/\(id ?? "")/Default"), to: convertedPath.appendingPathComponent(".backup"))
        try! FileManager.default.copyItem(at: fspDir!.appendingPathComponent("Files/\(id ?? "")/Replace"), to: convertedPath.appendingPathComponent("Replace.file"))
        // TODO: Support more operation types
        let plistdata: [String:Any] = [
            "FilePath":targetFile,
            "ReplacingPath":"Replace.file",
            "ApplyInBackground": location,
            "Author": author,
            "OperationType": "Replacing",
            "ReplacingType": "Imported"
        ]
        let plistFile = try! PropertyListSerialization.data(fromPropertyList: plistdata, format: .xml, options: 0)
        try! plistData.write(to: convertedPath.appendingPathComponent("Info.plist"))
    }
    
    static func export() {
        UIApplication.shared.alert(title: "eta son", body: "")
    }
}
