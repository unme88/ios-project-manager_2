//
//  Memo.swift
//  ProjectManager
//
//  Created by Sunny on 2021/07/16.
//

import UIKit

final class Memo: NSObject {
    var title: String
    let content: String
    let date: String
    
    init(title: String, content: String, date: String) {
        self.title = title
        self.content = content
        self.date = date
    }
}
