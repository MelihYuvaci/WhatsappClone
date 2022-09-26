//
//  UserStore.swift
//  WhatsappCloneSwiftUI
//
//  Created by Melih Yuvacı on 25.09.2022.
//

import Foundation
import Firebase
import Combine

class UserStore : ObservableObject {
    
    let db = Firestore.firestore()
    var userArray : [UserModel] = []
    
    var didChange = PassthroughSubject<Array<Any>, Never>()
    
    init() {
        db.collection("Users").addSnapshotListener { snapshot, error in
            if error != nil {
                
            }else {
                
                self.userArray.removeAll(keepingCapacity: false)
                
                for document in snapshot!.documents {
                    if let userUidFromFirebase = document.get("useruidfromfirabase") as? String {
                        if let userName = document.get("username") as? String {
                            
                            let curretIndex = self.userArray.last?.id
                            let createdUser = UserModel(id: (curretIndex ?? -1) + 1, name: userName, uidFromFirebase: userUidFromFirebase)
                            self.userArray.append(createdUser)
                        }
                    }
                }
                self.didChange.send(self.userArray)
            }
        }
    }
}
