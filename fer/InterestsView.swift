//
//  ContentView.swift
//  PantallaIntereses
//
//  Created by MAC on 24/11/26.
//

import SwiftUI

struct InterestsView: View {
    let anuncios = Interes(titulo: "Anuncios generales", descripcion: "Eventos, noticias y avisos de la Fundación")
    let becarios = Interes(titulo:  "Becarios", descripcion: "Renovaciones, requisitos y recordatorios")
    let aspirantes = Interes(titulo: "Aspirantes", descripcion: "Convocatorias y procesos de solicitud")
    
    @State private var seleccionados : Set<String> = []
    var body: some View {
        
        VStack (alignment:.leading, spacing:16 ){
            //icono
            IndicadorPaso(total : 3,actual : 1).padding(.bottom, 40)
            //¿que te interesa?
            Text("¿Que te interesa?")
                .font(.largeTitle.bold())
                .foregroundStyle(Color(red: 0.059, green: 0.102, blue: 0.200))
            //texto largo
            Text("Elige al menos una opción. Recibirás avisos solo de lo que elijas y puedes cambiarlo después en Preferencias.")
                .font(.body)
                .padding(.bottom, 16)
                .foregroundStyle(Color(red: 0.353, green: 0.380, blue: 0.439))
            //boton HS
            TarjetaInteres(interes: anuncios,
                           icono: "megaphone.fill",
                           seleccionado: seleccionados.contains(anuncios.titulo))
            .onTapGesture { cambiar(anuncios) }
            
            TarjetaInteres(interes: becarios,
                           icono: "graduationcap.fill",
                           seleccionado: seleccionados.contains(becarios.titulo))
            .onTapGesture { cambiar(becarios) }
            
            TarjetaInteres(interes: aspirantes,
                           icono: "doc.text.fill",
                           seleccionado: seleccionados.contains(aspirantes.titulo))
            .onTapGesture { cambiar(aspirantes) }
            
            Spacer()
            HStack(){
                Spacer()
                Button("Continuar"){}
                    .font(.headline)
                    .padding(.horizontal, 28)
                    .padding(.vertical, 14)
                    .tint(.white)
                    .background(Color(red: 0.129, green: 0.243, blue: 0.549))
                    .clipShape(Capsule())
                Spacer()
            }
            Spacer()
            
        }
        .padding()
        .backgroundStyle(Color(red:0.961, green: 0.969, blue: 0.988))
        
        
    }
    
    func cambiar(_ interes: Interes) {
            if seleccionados.contains(interes.titulo) {
                seleccionados.remove(interes.titulo)
            } else {
                seleccionados.insert(interes.titulo)
            }
        }
}

struct IndicadorPaso: View {
    let total : Int
    let actual : Int
    
    var body: some View {
        HStack(spacing:6){
            ForEach(0..<total, id: \.self){ i in
                Capsule()
                    .fill(i <= actual ? Color.blue : Color.gray.opacity(0.3))
                    .frame(width: i == actual ? 28:8, height: 8)
            }
        }
    }
}

struct Interes {
    let titulo: String
    let descripcion: String
}

struct TarjetaInteres: View {
    let interes: Interes
    let icono: String
    let seleccionado : Bool
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icono)
                .font(.title2)
                .foregroundColor(seleccionado ? .white : Color(red: 0.129, green: 0.243, blue: 0.549))
                .frame(width: 56, height: 56)
                .background(Circle().fill(seleccionado ? Color(red: 0.129, green: 0.243, blue: 0.549) : Color(red: 0.933, green: 0.945, blue: 0.980)))
            VStack(alignment: .leading, spacing: 4) {
                Text(interes.titulo)
                    .font(.headline)
                    .foregroundStyle(Color(red: 0.059, green: 0.102, blue: 0.200))
                Text(interes.descripcion)
                    .font(.subheadline)
                    .foregroundStyle(Color(red: 0.353, green: 0.380, blue: 0.439))
            }
            Spacer()
            Image(systemName: seleccionado ? "checkmark.circle.fill" : "circle")
                            .font(.title)
                            .foregroundStyle(seleccionado ? Color(red: 0.129, green: 0.243, blue: 0.549) : Color(red: 0.545, green: 0.580, blue: 0.647))
        }
        .padding()
        .background(seleccionado ? Color(red: 0.875, green: 0.898, blue: 0.961) : Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(seleccionado ? Color(red: 0.129, green: 0.243, blue: 0.549) : Color(red: 0.890, green: 0.902, blue: 0.933), lineWidth: 2)
                )
    }
}

#Preview {
    InterestsView()
}
