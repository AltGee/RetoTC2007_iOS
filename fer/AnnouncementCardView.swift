
import SwiftUI

struct AnnouncementCardView: View {
    let announcement: Announcement

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(announcement.title)
                    .font(.headline)
                    .foregroundColor(.gray)

                Spacer()

                Text(announcement.date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Text(announcement.description)
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(2)

            Image(announcement.image)
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
    AnnouncementCardView(
        announcement: Announcement(
            id: 1,
            title: "Renovación",
            category: "Becarios",
            date:"Hace un día",
            description: "Ya puedes renovar",
            image: "convocatoria"
        )
    )
    .padding()
}
