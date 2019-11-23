//
//  PersonRow.swift
//  anadolusigorta2019app
//
//  Created by Ayda Selen Bozkurt on 23.11.2019.
//  Copyright © 2019 Cihan Bosnalı. All rights reserved.
//

import SwiftUI

struct PersonRow: View {
    var body: some View {
        HStack(alignment: .center) {
        Image("Ayda")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading){
            Text ("Ayda Selen Bozkurt")
                .fontWeight(.bold)
            Text ("aselen22@my.sevkoleji.k12.tr")
            }
    }
}

struct PersonRow_Previews: PreviewProvider {
    static var previews: some View {
        PersonRow()
    }
}
}
