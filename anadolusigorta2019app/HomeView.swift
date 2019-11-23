//
//  HomeView.swift
//  anadolusigorta2019app
//
//  Created by cihan on 23.11.2019.
//  Copyright © 2019 Cihan Bosnalı. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(red: 48.0/255.0, green: 31.0/255.0, blue: 92.0/255.0, alpha:1.0)
    
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white]
    }

    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    MapView()
                    .frame(height: 250.0)
                    
                    CircleImage()
                    .offset(y: -150)
                    .padding(.bottom, -80)
                    
                    HStack{
                        VStack{
                            Text("Yangın")
                                .fontWeight(.bold)
                            Image("tik")
                            Text("Güvenli")

                        }
                        Spacer().frame(width: 30.0)
                        VStack{
                            Text("Hırsızlık")
                                .fontWeight(.bold)
                            Image("tik")
                            Text("Güvenli")
                        }
                        Spacer().frame(width: 30.0)
                        VStack{
                            Text("Sızıntı")
                                .fontWeight(.bold)
                            Image("tik")
                            Text("Güvenli")
                        }
                    }.padding()
                    
                    HStack{
                        Text("İstatistikler")
                            .fontWeight(.bold)
                        Spacer()
                    }.padding()
                    

                    HStack{
                        Text("Kişi Sayısı (Canlı):")
                        Spacer()
                    }.padding()
                    
                    HStack{
                        Text("Kişi Sayısı (Son 24 saat):")
                        Spacer()
                    }.padding()
                    
                    HStack{
                        Text("Olaylar (Son 24 Saat):")
                        Spacer()
                    }.padding()

                }
                   
            }.navigationBarTitle(Text("Evim"))
            
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
