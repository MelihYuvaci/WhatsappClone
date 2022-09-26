//
//  WhatsappCloneSwiftUIApp.swift
//  WhatsappCloneSwiftUI
//
//  Created by Melih Yuvacı on 23.09.2022.
//

import SwiftUI
import Firebase

@main
struct WhatsappCloneSwiftUIApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
