//
//  DividerView.swift
//  WatchApp WatchKit Extension
//
//  Created by Timal Pathirana on 19/6/2022.
//

import SwiftUI

struct DividerView: View {
    
    var body: some View {
        VStack {
            
            //Seperator
            HStack{
                Capsule()
                    .frame(height: 1)

            }//HSTACK
            .foregroundColor(.secondary)
            .opacity(0.2)
        }//VSTACK
    }
}

struct DividerView_Previews: PreviewProvider {
    static var previews: some View {
        DividerView()
    }
}
