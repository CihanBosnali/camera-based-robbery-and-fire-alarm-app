//
//  PersonRow.swift
//  anadolusigorta2019app
//
//  Created by Ayda Selen Bozkurt on 23.11.2019.
//  Copyright © 2019 Cihan Bosnalı. All rights reserved.
//

import SwiftUI

struct PersonRow: View {
    
    var name: String
    var email: String
    var number: String
    
    var body: some View {
        HStack(alignment: .center) {
        Image("Ayda")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading){
            Text(name)
                .fontWeight(.bold)
            Text(email)
            Text(number)

        }
    }
}

struct PersonRow_Previews: PreviewProvider {
    static var previews: some View {
        PersonRow(name: "Ayda Selen Bozkurt", email: "aselen@gmail.com", number: "0599 999 9999")
    }
}
}
