//
//  Anuncio.swift
//  detalleAnuncio
//
//  Created by Jesus Corona on 24/11/26.
//

import SwiftUI
import Foundation

struct Anuncio: Identifiable {
    let id: Int
    let titulo: String
    let categoria: String
    let fecha: String
    let descripcion: String
    let imagen: String
}
