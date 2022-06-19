//
//  SettingView.swift
//  WatchApp WatchKit Extension
//
//  Created by Timal Pathirana on 19/6/2022.
//

import SwiftUI

struct SettingView: View {
    
    @AppStorage("lineCount") var lineCount: Int = 1
    @AppStorage("contentlineCount") var contentLineCount: Int = 3
    @State private var subjectValue: Float = 1.0
    @State private var contenttValue: Float = 1.0

    
    func saveSubjectLines() {
        lineCount = Int(subjectValue)
    }
    
    func saveBodyLines() {
        contentLineCount = Int(contenttValue)
    }
    
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Settings")
            ScrollView{
                VStack{
                    //Actual line count
                    Text("Subjet Lines: \(lineCount)".uppercased())
                        .fontWeight(.semibold)
                        .font(.system(size: 12))
                        .frame(alignment: .leading)
                    // Slider
                    Slider(value: Binding(get: {
                        self.subjectValue
                    }, set: {
                        (newValue) in
                        self.subjectValue = newValue
                        self.saveSubjectLines()
                    }), in: 1...4, step: 1)
                        .foregroundColor(.accentColor)

                    DividerView()
                    Text("Content Lines: \(contentLineCount)".uppercased())
                        .fontWeight(.semibold)
                        .font(.system(size: 12))
                        .frame(alignment: .leading)
                    // Slider
                    Slider(value: Binding(get: {
                        self.contenttValue
                    }, set: {
                        (newContantValue) in
                        self.contenttValue = newContantValue
                        self.saveBodyLines()
                    }), in: 1...5, step: 1)
                        .foregroundColor(.accentColor)
                    

                }//VStack end
            }//ScrollView End
        }//VSTACK END
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
