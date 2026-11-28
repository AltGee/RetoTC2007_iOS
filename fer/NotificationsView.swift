//
//  NotificationsView.swift
//  fer
//
//  Created by MAC on 27/11/26.
//

import Foundation
import SwiftUI

struct NotificationsView: View {
    @Binding var items: [NotificationItem]
    @State private var selectedItem: NotificationItem?
    
    private var groupedSections: [(title: String, items: [NotificationItem])] {
        var order: [String] = []
        var dictionary: [String: [NotificationItem]] = [:]
        
        for item in items {
            if dictionary[item.sectionTitle] == nil {
                order.append(item.sectionTitle)
                dictionary[item.sectionTitle] = []
            }
            dictionary[item.sectionTitle]?.append(item)
        }
        
        return order.map { section in
            (title: section, items : dictionary[section] ?? [])
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 22) {
                ForEach(groupedSections, id: \.title) { section in
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading, spacing: 6) {
                            Rectangle()
                                .fill(Color.ferPrimary)
                                .frame(width: 24,height: 2)
                            Text(section.title.uppercased())
                                .font(.openSansSemiBold(12))
                                .foregroundColor(Color.ferPrimary)
                        }
                        ForEach(section.items) { item in
                            NotificationCardView(item: item) {
                                handleTap(on: item)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(Color.ferBackground)
        .sheet(item: $selectedItem) { item in
            NotificationDetailSheet(item: item)
        }
    }
    
    private func handleTap(on tappedItem: NotificationItem){
        if let index = items.firstIndex(where: { $0.id == tappedItem.id}) {
            items[index].isRead == true
            selectedItem = items[index]
        } else {
            selectedItem = tappedItem
        }
    }
}

//mockdata
#Preview {
    struct PreviewWrapper: View {
        @State private var sampleItems: [NotificationItem] = [
            NotificationItem(
                sectionTitle: "Hoy",
                title: "Nuevo aviso del sistema",
                message: "Se actualizó la configuración general de tu cuenta.",
                detailMessage: "Se actualizó la configuración general de tu cuenta. Revisa tus preferencias antes de continuar con tus actividades.",
                creationDate: .now.addingTimeInterval(-300),
                icon: "bell.badge.fill",
                isRead: false
            ),
            NotificationItem(
                sectionTitle: "Hoy",
                title: "Recordatorio de entrega",
                message: "Tienes una actividad programada para hoy por la tarde.",
                detailMessage: nil,
                creationDate: .now.addingTimeInterval(-3600),
                icon: "calendar",
                isRead: false
            ),
            NotificationItem(
                sectionTitle: "Esta semana",
                title: "Bienvenida a la plataforma",
                message: "Tu perfil ya quedó listo para comenzar.",
                detailMessage: "Tu perfil ya quedó listo para comenzar. Explora las secciones disponibles desde la pantalla principal.",
                creationDate: .now.addingTimeInterval(-86400 * 2),
                icon: "checkmark.circle.fill",
                isRead: true
            )
        ]

        var body: some View {
            NotificationsView(items: $sampleItems)
        }
    }

    return PreviewWrapper()
}



