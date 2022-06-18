//
//  CreditView.swift
//  WatchApp WatchKit Extension
//
//  Created by Timal Pathirana on 19/6/2022.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack (spacing: 3){
            //Profile image
            Image("logo")
                .resizable()
                .scaledToFit()
            
            //header
            HeaderView(title: "Credits")
            Spacer()
            //content
            Text("Timal Pathirana")
                .fontWeight(.bold)
            Text("Developer")
                .font(.body)
                .foregroundColor(.secondary)
            Spacer()
            HStack (spacing: 5){
                Image("github")
                    .resizable()
                    .scaledToFit()
                    .imageScale(.small)
                
                Text("timalbpathirana")
                    .fontWeight(.light)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            
            
        }//VSTACK
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
