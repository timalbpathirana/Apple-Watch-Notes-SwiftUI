//
//  DetailView.swift
//  WatchApp WatchKit Extension
//
//  Created by Timal Pathirana on 19/6/2022.
//

import SwiftUI

struct DetailView: View {
    
    let note: Note
    let count: Int
    let index: Int
    @State private var isCreditVisible: Bool = false

    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
          //Header
            HeaderView(title: "")
            
            //Content
            Spacer()
            ScrollView(.vertical){
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            //Footer
            HStack{
               Image(systemName: "gear")
                    .imageScale(.large)
                Spacer()
                Text("\(index + 1)/ \(count)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditVisible.toggle()
                        
                    }
                    .sheet(isPresented: $isCreditVisible, content: {
                        CreditView()
                    })
            }//HSTACK
            
        }//VSTACK
        .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var sampleData: Note = Note(text: "Hello World", subject: "Hello", date: .now)
    static var previews: some View {
        DetailView(note: sampleData, count: 6, index: 1)
    }
}
