//
//  PeopleView.swift
//  anadolusigorta2019app
//
//  Created by cihan on 23.11.2019.
//  Copyright © 2019 Cihan Bosnalı. All rights reserved.
//

import SwiftUI

struct PeopleView: View {
    var body: some View {
        
        NavigationView {

            List {
                NavigationLink(destination: /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                    PersonRow(name: "Ayda Selen Bozkurt", email: "aselen@gmail.com", number: "0599 999 9999")
                }
                }.navigationBarTitle(Text("Evim > Kişiler"))
        }
        
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
