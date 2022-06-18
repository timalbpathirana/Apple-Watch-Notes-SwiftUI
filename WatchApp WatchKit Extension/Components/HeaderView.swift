//
//  HeaderView.swift
//  WatchApp WatchKit Extension
//
//  Created by Timal Pathirana on 19/6/2022.
//

import SwiftUI

struct HeaderView: View {
    var title: String = ""
    
    var body: some View {
        VStack {
            //Title
            if title != "" {
                Text(title.uppercased())
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
                    .font(.title3)
            }
            //Seperator
            HStack{
                Capsule()
                    .frame(height: 1)
                    
                
                Image(systemName: "note.text")
                    
                Capsule()
                    .frame(height: 1)

            }//HSTACK
            .foregroundColor(.accentColor)
        }//VSTACK
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            HeaderView(title: "Credits")
            HeaderView()
        }
    }
}
