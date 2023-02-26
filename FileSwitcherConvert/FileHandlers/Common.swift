//
//  Common.swift
//  FileSwitcherConvert
//
//  Created by Hariz Shirazi on 2023-02-26.
//

import Foundation
import FilePicker

struct Common {
    static func fileFromPicker(fileType: String) -> URL {
        var url = URL.init(string: "")
        FilePicker(types: [.init(filenameExtension: fileType)!], allowMultiple: false, title: "Pick an operation", onPicked: {urls in
            url = urls.first
        })
        return url!
    }
}
