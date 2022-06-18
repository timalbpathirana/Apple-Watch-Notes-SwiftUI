//
//  Note.swift
//  WatchApp WatchKit Extension
//
//  Created by Timal Pathirana on 18/6/2022.
//

import Foundation

struct Note: Identifiable, Codable {
    let id = UUID()
    let text: String
    let subject: String
    let date: Date
}
