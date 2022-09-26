//
//  ContentView.swift
//  WhatsappCloneSwiftUI
//
//  Created by Melih Yuvacı on 23.09.2022.
//

import SwiftUI
import Firebase

struct AuthView: View {
    
    let db = Firestore.firestore()
    @ObservedObject var userStore = UserStore()
    
    
    @State var useremail = ""
    @State var password = ""
    @State var username = ""
    @State var showAuthView = true
    
    var body: some View {
        NavigationView {
            
            if showAuthView {
        
        List {
            Text("WhatsApp Clone")
                .font(.largeTitle)
                .bold()
            
            Section{
                VStack(alignment: .leading){
                    SectionSubTitle(subtitle: "User E-mail")
                    TextField("Emailinizi giriniz", text: $useremail)
                }
            }
            
            Section{
                VStack(alignment: .leading){
                    SectionSubTitle(subtitle: "Password")
                    TextField("Şifrenizi giriniz", text: $password)
                }
            }
            Section{
                VStack(alignment: .leading){
                    SectionSubTitle(subtitle: "Username")
                    TextField("Kullanıcı adını giriniz", text: $username)
                }
            }
            
            Section{
                HStack {
                    Spacer()
                    
                    Button {
                        //sign in
                        
                        Auth.auth().signIn(withEmail: self.useremail, password: self.password) { result, error in
                            if error != nil {
                                print(error?.localizedDescription)
                            } else {
                                // User signed in
                                
                                self.showAuthView = false
                                
                            }
                        }
                        
                        
                    } label: {
                        Text("Sign In")
                }
                    Spacer()
                }

            }
            
            Section{
                HStack {
                    Spacer()
                    
                    Button {
                        //sign up
                        
                        Auth.auth().createUser(withEmail: self.useremail, password: self.password) { result, error in
                            if error != nil {
                                print(error?.localizedDescription)
                            }else {
                                //User created
                                //Database
                                
                                var ref : DocumentReference? = nil
                                
                                let myUserDictionary :[String:Any] = ["useruidfromfirabase":result!.user.uid, "username":self.username, "useremail": self.useremail]
                                
                                ref = db.collection("Users").addDocument(data: myUserDictionary, completion: { error in
                                    if error != nil {
                                        
                                    }
                                })
                                
                                //User View
                                
                                self.showAuthView = false
                                
                                
                            }
                        }
                        
                    } label: {
                        Text("Sign Up")
                }
                    Spacer()
                }

            }
            
        }
                // Auth View End
            } else {
                
                // User View
                
                
                NavigationView {
                    
                    List(userStore.userArray){ user in
                        NavigationLink {
                            ChatView(userToChat: user)
                        } label: {
                            Text(user.name)
                        }


                    }
                }.navigationTitle(Text("Chat with Users!"))
                    .navigationBarItems(leading: Button(action: {
                        // log out
                        do {
                           try Auth.auth().signOut()
                        }catch{
                            
                        }
                        
                        self.showAuthView = true
                    }, label: {
                        Text("Log Out")
                    }))
               
            }
    }
 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            AuthView(showAuthView: false)
            AuthView(showAuthView: true)
        }
    }
}


struct SectionSubTitle : View {
    var subtitle : String
    var body: some View{
   return Text(subtitle)
            .font(.subheadline)
            .foregroundColor(.black)
    }
}
