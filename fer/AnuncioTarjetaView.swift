
import SwiftUI

struct AnuncioTarjetaView: View {
    let anuncio: Anuncio

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(anuncio.titulo)
                    .font(.headline)
                    .foregroundColor(.gray)

                Spacer()

                Text(anuncio.fecha)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Text(anuncio.descripcion)
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(2)

            Image(anuncio.imagen)
                .resizable()
                .scaledToFill()
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 15))

            Divider()
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    AnuncioTarjetaView(
        anuncio: Anuncio(
            id: 1,
            titulo: "Renovación",
            categoria: "Becarios",
            fecha: "Hace un día",
            descripcion: "Ya puedes renovar",
            imagen: "convocatoria"
        )
    )
    .padding()
}
