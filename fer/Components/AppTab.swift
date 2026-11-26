import Foundation

enum AppTab: CaseIterable, Identifiable {
    case anuncios, inicio, preferencias

    var id: Self { self }

    var titulo: String {
        switch self {
        case .anuncios:     "Anuncios"
        case .inicio:       "Inicio"
        case .preferencias: "Preferencias"
        }
    }

    /// SF Symbol sin rellenar
    var icono: String {
        switch self {
        case .anuncios:     "megaphone"
        case .inicio:       "house"
        case .preferencias: "gearshape"
        }
    }

    var iconoActivo: String { icono + ".fill" }
}
