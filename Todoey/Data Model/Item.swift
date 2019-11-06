//
//  Item.swift
//  Todoey
//
//  Created by Philip Stephens on 2019-11-04.
//  Copyright © 2019 Philip Stephens. All rights reserved.
//

import Foundation

class Item {
    
    var title : String = ""
    var completed : Bool = false
    
    func setItem(pItem : String) {
        self.title = pItem
    }
    
    func toggle() {
        self.completed = !self.completed
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func isCompleted() -> Bool {
        return self.completed
    }
}
