//
//  ContentView.swift
//  PantallaIntereses
//
//  Created by MAC on 24/11/26.
//

import SwiftUI

struct InterestsView: View {
    let advertisements = Interest(title: "Anuncios generales", description: "Eventos, noticias y avisos de la Fundación")
    let interns = Interest(title:  "Becarios", description: "Renovaciones, requisitos y recordatorios")
    let applicants = Interest(title: "Aspirantes", description: "Convocatorias y procesos de solicitud")
    
    var onContinue: () -> Void = {}
    
    @State private var selected_items : Set<String> = []
    var body: some View {
        
        VStack (alignment:.leading, spacing:16 ){
            StepIndicator(total : 3,current : 1).padding(.bottom, 40)
            Text("¿Que te interesa?")
                .font(.largeTitle.bold())
                .foregroundStyle(Color(red: 0.059, green: 0.102, blue: 0.200))
            Text("Elige al menos una opción. Recibirás avisos solo de lo que elijas y puedes cambiarlo después en Preferencias.")
                .font(.body)
                .padding(.bottom, 16)
                .foregroundStyle(Color(red: 0.353, green: 0.380, blue: 0.439))
            InterestCard(interest: advertisements,
                           icon: "megaphone.fill",
                           selected: selected_items.contains(advertisements.title))
            .onTapGesture { change(advertisements) }
            
            InterestCard(interest: interns,
                           icon: "graduationcap.fill",
                           selected: selected_items.contains(interns.title))
            .onTapGesture { change(interns) }
            
            InterestCard(interest: applicants,
                           icon: "doc.text.fill",
                           selected: selected_items.contains(applicants.title))
            .onTapGesture { change(applicants) }
            
            Spacer()
            HStack(){
                Spacer()
                Button("Continuar") {
                    onContinue()
                }
                .disabled(selected_items.isEmpty)
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
    
    func change(_ interest: Interest) {
        if selected_items.contains(interest.title) {
            selected_items.remove(interest.title)
            } else {
                selected_items.insert(interest.title)
            }
        }
}

struct StepIndicator: View {
    let total : Int
    let current : Int
    
    var body: some View {
        HStack(spacing:6){
            ForEach(0..<total, id: \.self){ i in
                Capsule()
                    .fill(i <= current ? Color.blue : Color.gray.opacity(0.3))
                    .frame(width: i == current ? 28:8, height: 8)
            }
        }
    }
}

struct Interest {
    let title: String
    let description: String
}

struct InterestCard: View {
    let interest: Interest
    let icon: String
    let selected : Bool
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(selected ? .white : Color(red: 0.129, green: 0.243, blue: 0.549))
                .frame(width: 56, height: 56)
                .background(Circle().fill(selected ? Color(red: 0.129, green: 0.243, blue: 0.549) : Color(red: 0.933, green: 0.945, blue: 0.980)))
            VStack(alignment: .leading, spacing: 4) {
                Text(interest.title)
                    .font(.headline)
                    .foregroundStyle(Color(red: 0.059, green: 0.102, blue: 0.200))
                Text(interest.description)
                    .font(.subheadline)
                    .foregroundStyle(Color(red: 0.353, green: 0.380, blue: 0.439))
            }
            Spacer()
            Image(systemName: selected ? "checkmark.circle.fill" : "circle")
                            .font(.title)
                            .foregroundStyle(selected ? Color(red: 0.129, green: 0.243, blue: 0.549) : Color(red: 0.545, green: 0.580, blue: 0.647))
        }
        .padding()
        .background(selected ? Color(red: 0.875, green: 0.898, blue: 0.961) : Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(selected ? Color(red: 0.129, green: 0.243, blue: 0.549) : Color(red: 0.890, green: 0.902, blue: 0.933), lineWidth: 2)
                )
    }
}

#Preview {
    InterestsView()
}
