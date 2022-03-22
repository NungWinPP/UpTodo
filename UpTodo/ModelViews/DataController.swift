//
//  DataController.swift
//  UpTodo
//
//  Created by Parinthon Puksuriwong on 22/3/2565 BE.
//

import CoreData
import Foundation

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "UpTodo")

    init(){
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
