//
//  detalleAnuncioView.swift
//  detalleAnuncio
//
//  Created by Jesus Corona on 24/11/26.
//

import SwiftUI

struct DetalleAnuncioView: View {

    let anuncio: Anuncio

    @Environment(\.dismiss) private var dismiss

    let fondo = Color.ferBackground
    let azulClaro = Color.ferPrimary

    var body: some View {

        ScrollView(showsIndicators: false) {

            VStack(alignment: .leading, spacing: 0) {

                GeometryReader { geometry in
                    Image(anuncio.imagen)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: 300)
                        .clipped()
                }
                .frame(height: 300)
                
                VStack(alignment: .leading, spacing: 16) {

                    VStack(alignment: .leading, spacing: 8) {

                        Rectangle()
                            .fill(azulClaro)
                            .frame(width: 26, height: 2)

                        Text(anuncio.categoria.uppercased())
                            .font(.system(size: 14, weight: .bold))
                            .tracking(2)
                            .foregroundStyle(azulClaro)
                    }

                    Text(anuncio.titulo)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color.ferOnSurface)

                    Text(anuncio.fecha)
                        .font(.system(size: 14))
                        .foregroundStyle(Color.ferOnSurfaceVariant)

                    Text(anuncio.descripcion)
                        .font(.system(size: 19))
                        .foregroundStyle(Color.ferOnSurface)
                        .lineSpacing(7)
                        .padding(.top, 8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)
                .padding(.top, 6)
            }
        }
        .background(fondo)
        .ignoresSafeArea(edges: .top)
        .overlay(alignment: .top) {

            HStack {

                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .frame(width: 44, height: 44)
                        .background(.black.opacity(0.4))
                        .clipShape(Circle())
                }

                Spacer()

                ShareLink(
                    item: "\(anuncio.titulo)\n\n\(anuncio.descripcion)"
                ) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .frame(width: 44, height: 44)
                        .background(.black.opacity(0.4))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    DetalleAnuncioView(
        anuncio: Anuncio(
            id: 1,
            titulo: "Resultados de convocatoria",
            categoria: "Becarios",
            fecha: "Hace 4 días",
            descripcion: "Consulta los resultados y las fechas importantes del proceso de selección. Los becarios seleccionados deberán confirmar su lugar en cinco días hábiles. Para ello, se les enviará un correo electrónico con un enlace de confirmación. Consulta los resultados y las fechas importantes del proceso de selección. Los becarios seleccionados deberán confirmar su lugar en cinco días hábiles.Consulta los resultados y las fechas importantes del proceso de selección. Los becarios seleccionados deberán confirmar su lugar en cinco días hábiles.Consulta los resultados y las fechas importantes del proceso de selección. Los becarios seleccionados deberán confirmar su lugar en cinco días hábiles.",
            imagen: "convocatoria"
        )
    )
}
