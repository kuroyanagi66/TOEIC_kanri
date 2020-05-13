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
        VStack{
            /*
            List{
                        ForEach(setumon.setumons, id: \.self){aa in
                            Text(aa)
                        }
                    }*/
        Text("start")
            
        NavigationLink(destination:
                StopWatch()){

                   Text("MAP")
                    
             
            }
            
   
            
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


