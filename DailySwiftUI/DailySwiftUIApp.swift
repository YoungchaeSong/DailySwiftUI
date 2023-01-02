//
//  DailySwiftUIApp.swift
//  DailySwiftUI
//
//  Created by 송영채 on 2022/12/29.
//

import SwiftUI

@main
struct DailySwiftUIApp: App {
    
    @StateObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
        }
    }
}
