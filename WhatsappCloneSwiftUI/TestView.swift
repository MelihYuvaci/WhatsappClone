//
//  TestView.swift
//  WhatsappCloneSwiftUI
//
//  Created by Melih Yuvacı on 24.09.2022.
//

import SwiftUI

struct TestView: View {
    
    @State var x = true
    
    var body: some View {
        
        NavigationView {
            
            if x {
                VStack{
                    Text("Hello, SwiftUI!")
                    Button {
                        self.x = false
                    } label: {
                        Text("Change Screen")
                    }

                }
                
            }else{
                Text("Hello, World")
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
