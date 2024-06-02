//
//  TodoListApp.swift
//  TodoList
//
//  Created by Nguyen Quang Minh on 2/6/24.
//

import SwiftUI

@main
struct TodoListApp: App {

   @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
