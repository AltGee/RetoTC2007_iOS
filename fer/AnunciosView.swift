
import SwiftUI

struct AnunciosView: View {
    @State private var seleccion = 0

    let anunciosBecarios = [
        Anuncio(
            id: 1,
            titulo: "Renovación de becas 2026",
            categoria: "Becarios",
            fecha: "Hace una semana",
            descripcion: "Ya se encuentran disponibles las renovaciones",
            imagen: "convocatoria"
        ),
        Anuncio(
            id: 2,
            titulo: "Sesión informativa",
            categoria: "Becarios",
            fecha: "Hace una hora",
            descripcion: "Información sobre la sesión",
            imagen: "convocatoria"
        )
    ]

    let anunciosAspirantes = [
        Anuncio(
            id: 3,
            titulo: "Convocatoria 2026",
            categoria: "Aspirantes",
            fecha: "Hace una semana",
            descripcion: "Ya se encuentra abierta la convocatoria",
            imagen: "convocatoria"
        ),
        Anuncio(
            id: 4,
            titulo: "Resultados de convocatoria",
            categoria: "Aspirantes",
            fecha: "Hace una hora",
            descripcion: "Resultados de la convocatoria 2026",
            imagen: "convocatoria"
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

                Picker("Opciones", selection: $seleccion) {
                    Text("Becarios").tag(0)
                    Text("Aspirantes").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(
                            seleccion == 0
                            ? anunciosBecarios
                            : anunciosAspirantes
                        ) { anuncio in
                            NavigationLink {
                                DetalleAnuncioView(anuncio: anuncio)
                            } label: {
                                AnuncioTarjetaView(anuncio: anuncio)
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
    AnunciosView()
}
