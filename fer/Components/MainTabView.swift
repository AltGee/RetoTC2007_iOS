//
//  MainTabView.swift
//  fer
//
//  Created by Jesus Corona on 26/11/26.
//


import SwiftUI

struct MainTabView: View {
    @State private var seleccion: AppTab = .anuncios

    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch seleccion {
                case .anuncios:
                    AnnouncementsView()

                case .inicio:
                    Text("Inicio")

                case .preferencias:
                    PreferenceView(
                        showDummtTopBar: true,
                        showDummyBottomBar: false
                    )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            FerTabBar(seleccion: $seleccion)
        }
    }
}

#Preview {
    MainTabView()
}
