//
//  giftBookApp.swift
//  giftBook
//
//  Created by Fenu, Leonardo on 16/04/2021.
//

import SwiftUI

@main
struct giftBookApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AmicoStore())
        }
    }
}
