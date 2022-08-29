//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Kirill Sytkov on 29.08.2022.
//

import Foundation

struct Note: Identifiable, Codable {
   let id: UUID
   let text: String
}
