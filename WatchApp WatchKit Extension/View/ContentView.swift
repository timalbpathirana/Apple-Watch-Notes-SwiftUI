//
//  ContentView.swift
//  WatchApp WatchKit Extension
//
//  Created by Timal Pathirana on 18/6/2022.
//

import SwiftUI


struct ContentView: View {
    
    
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
            
        } catch {
            print("Saving failed")
        }
        
    }
    
    func load(){
        DispatchQueue.main.async {
            do{
                // Load from the url
                let url = getDocumentDirectory().appendingPathComponent("notes")
                // Create new property for the data
                let data = try Data(contentsOf: url)
                // Decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
                
            } catch {
                //Nothing
            }
            
        }
        
    }
    
    func delete(offsets: IndexSet){
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                
                TextField("Add New Note", text: $text)
                    .font(.system(size: 20, weight: .light, design: .rounded))
                Button {
                    //Action
                    guard text.isEmpty == false else {return}
                    let note = Note(text: text, subject: GetSubject(text: text), date: Date.now)
                    notes.append(note)
                    text = "" // Clearing the text field aftee submit
                    save()
                    
                    
                    
                } label: {
                    Image(systemName: "plus.app.fill")
                        .font(.system(size: 30, weight: .semibold))
                    
                }
                .buttonStyle(PlainButtonStyle())
                .fixedSize()
                .foregroundColor(.accentColor)
                
            }//HStack
            
            Spacer()
    
            if notes.count >= 1 {
                List {
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                                HStack{
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text(notes[i].text)
                                        .lineLimit(1)
                                        .padding(.leading, 5)
                                    
                                }
                            }//Hstack
                        } //LOOP
                        .onDelete(perform: delete)
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(10)
                Spacer()
            }
               
        }// Vstack
        .navigationTitle("Notes")
        .onAppear(perform:{
            load()
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}

func GetSubject(text : String) -> String {
    let firstLine = text.components(separatedBy: CharacterSet.newlines)
    return firstLine.first!
    
    
}

struct NoteDetailReturnView: View {
    var note : Note
    var body: some View {
        VStack{
            Text(note.subject)
                .fontWeight(.regular)
                .font(.system(size: 15))
                .frame(width: 180, height: 20, alignment: .leading)
                .foregroundColor(.accentColor)
        }
    }
}
