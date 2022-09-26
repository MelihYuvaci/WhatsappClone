//
//  ChatModel.swift
//  WhatsappCloneSwiftUI
//
//  Created by Melih Yuvacı on 26.09.2022.
//

import Foundation

struct ChatModel : Identifiable {
    
    var id : Int
    var message : String
    var uidFromFirebase : String
    var messageFrom : String
    var messageTo : String
    var messageDate : Date
    var messageFromMe : Bool
    
}
