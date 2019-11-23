//
//  CircleImage.swift
//  landmarks
//
//  Created by cihan on 20.11.2019.
//  Copyright © 2019 Cihan Bosnalı. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("ev")
            .frame(width: 200.0, height: 200.0)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
