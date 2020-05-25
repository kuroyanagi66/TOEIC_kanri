//
//  ContentView.swift
//  TOEIC_kanri
//
//  Created by Soichiro Kuroyanagi on 2020/03/30.
//  Copyright © 2020 kute. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @EnvironmentObject var setumon: Setumon
 @State var showingDetail = false
        
    var body: some View {
        NavigationView{
        VStack(spacing: 50){
            /*
            List{
                        ForEach(setumon.setumons, id: \.self){aa in
                            Text(aa)
                        }
                    }*/
        Text("TOEIC　設問管理ストップウォッチ").fontWeight(.black)
            .onTapGesture {
                print("ss")
            }
            
        NavigationLink(destination:
                StopWatch()){

                   Text("START").fontWeight(.black)
               
                    
             
            }.foregroundColor(.white)
          
        .padding(.all)
        .background(Color.blue)
            .cornerRadius(20)
            
            Spacer()
   
            
            }
               }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static let setumon = Setumon()
    static var previews: some View {
        ContentView().environmentObject(setumon)
     
    }
}


