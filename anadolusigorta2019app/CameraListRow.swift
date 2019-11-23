//
//  CameraListRow.swift
//  anadolusigorta2019app
//
//  Created by Ayda Selen Bozkurt on 23.11.2019.
//  Copyright © 2019 Cihan Bosnalı. All rights reserved.
//

import SwiftUI

struct CameraListRow: View {
    @State var videoAvailable: Bool
    @State var cameraAvailable: Bool
    
    var name: String
    
    var body: some View {
        HStack{
            if cameraAvailable {
                Image("Ellipse3")
            
            }else {
                Image("KirmiziEllipse")
            }
            Text(name)
        
            
            Spacer()
            
            if videoAvailable {
                Button(action: {}){
            
                    Image("kilitley").renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                }
            } else {
                Button(action: {}){
                Image("kilitli").renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                }
            }
            
            
            Button(action: {}){
                Image(systemName: "info.circle" )
            }
        }.padding()
    }
}

struct CameraListRow_Previews: PreviewProvider {
    static var previews: some View {
        CameraListRow(videoAvailable: true, cameraAvailable: false, name: "Mutfak")
    }
}

