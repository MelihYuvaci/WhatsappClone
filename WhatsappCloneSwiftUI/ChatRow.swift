//
//  ChatRow.swift
//  WhatsappCloneSwiftUI
//
//  Created by Melih Yuvacı on 26.09.2022.
//

import SwiftUI
import Firebase

struct ChatRow: View {
    var chatMessage : ChatModel
    var userToChatFromChatView : UserModel
    
    var body: some View {
        
        Group{
            
            if chatMessage.messageFrom == Auth.auth().currentUser?.uid && chatMessage.messageTo == userToChatFromChatView.uidFromFirebase{
                
                HStack {
                    Text(chatMessage.message)
                        .bold()
                        .foregroundColor(Color.black)
                        .padding(10)
                    Spacer()
                }
               
            }else if chatMessage.messageFrom == userToChatFromChatView.uidFromFirebase && chatMessage.messageTo == Auth.auth().currentUser?.uid{
                HStack {
                    
                        Spacer()
                        Text(chatMessage.message)
                            .bold()
                            .foregroundColor(Color.black)
                            .padding(10)
                    
                  
                    
                }
            }else {
                // NO
            }
            
            
        }.frame(width: UIScreen.main.bounds.width * 0.75)
       
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
      ChatRow(chatMessage: ChatModel(id: 0, message: "Message", uidFromFirebase: "aa", messageFrom: "aa", messageTo: "bb", messageDate: Date(), messageFromMe: true), userToChatFromChatView: UserModel(id: 1, name: "James", uidFromFirebase: "laksds"))
    }
}
