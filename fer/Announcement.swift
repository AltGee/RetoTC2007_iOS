//
//  Anuncio.swift
//  detalleAnuncio
//
//  Created by Jesus Corona on 24/11/26.
//

import SwiftUI
import Foundation

struct Announcement: Identifiable {
    let id: Int
    let title: String
    let category: String
    let date: String
    let description: String
    let image: String
}
