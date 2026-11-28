
import SwiftUI

struct AnnouncementsView: View {
    @State private var selection = 0

    let AnnouncementScholarship = [
        Announcement(
            id: 1,
            title: "Renovación de becas 2026",
            category: "Becarios",
            date: "Hace una semana",
            description: "Ya se encuentran disponibles las renovaciones",
            image: "convocatoria"
        ),
        Announcement(
            id: 2,
            title: "Sesión informativa",
            category: "Becarios",
            date: "Hace una hora",
            description: "Información sobre la sesión",
            image: "convocatoria"
        )
    ]

    let AnnouncementCandidates = [
        Announcement(
            id: 3,
            title: "Convocatoria 2026",
            category:"Aspirantes",
            date: "Hace una semana",
            description: "Ya se encuentra abierta la convocatoria",
            image: "convocatoria"
        ),
        Announcement(
            id: 4,
            title: "Resultados de convocatoria",
            category: "Aspirantes",
            date: "Hace una hora",
            description: "Resultados de la convocatoria 2026",
            image: "convocatoria"
        )
    ]

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    Image("logo_fer")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)

                    Text("Anuncios")
                        .font(.title2)
                        .fontWeight(.bold)

                    Spacer()

                    Image(systemName: "bell")
                        .font(.title2)
                        .bold()
                }
                .padding()

                Picker("Opciones", selection: $selection) {
                    Text("Becarios").tag(0)
                    Text("Aspirantes").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(
                            selection == 0
                            ? AnnouncementScholarship
                            : AnnouncementCandidates
                        ) { Announcement in
                            NavigationLink {
                                AnnouncementDetailView(announcement: Announcement)
                            } label: {
                                AnnouncementCardView(announcement: Announcement)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding()
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    AnnouncementsView()
}
