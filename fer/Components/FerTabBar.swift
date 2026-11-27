import SwiftUI

struct FerTabBar: View {
    @Binding var seleccion: AppTab
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.ferOutlineVariant)
                .frame(height: 1)

            HStack(spacing: 0) {
                ForEach(AppTab.allCases) { tab in
                    FerTabItem(tab: tab, seleccionado: tab == seleccion) {
                        withAnimation(reduceMotion ? nil : .spring(response: 0.35, dampingFraction: 0.75)) {
                            seleccion = tab
                        }
                    }
                }
            }
            .frame(height: 76)
            .padding(.horizontal, 12)
        }

        .background(Color.ferSurface.ignoresSafeArea(edges: .bottom))
    }
}

private struct FerTabItem: View {
    let tab: AppTab
    let seleccionado: Bool
    let accion: () -> Void

    var body: some View {
        Button(action: accion) {
            VStack(spacing: 4) {
                ZStack {
                    Capsule()
                        .fill(Color.ferPrimaryContainer)
                        .frame(width: seleccionado ? 64 : 28, height: 36)
                        .opacity(seleccionado ? 1 : 0)

                    Image(systemName: seleccionado ? tab.iconoActivo : tab.icono)
                        .font(.system(size: 22))
                        .foregroundStyle(seleccionado ? Color.ferOnPrimaryContainer : Color.ferOnSurfaceVariant)
                }
                .frame(width: 68, height: 36)

                Text(tab.titulo)
                    .font(.custom(seleccionado ? "OpenSans-Bold" : "OpenSans-Regular",
                                  size: 12, relativeTo: .caption))
                    .foregroundStyle(seleccionado ? Color.ferPrimary : Color.ferOnSurfaceVariant)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle()) 
        }
        .buttonStyle(.plain)
        .dynamicTypeSize(...DynamicTypeSize.accessibility1)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(tab.titulo)
        .accessibilityAddTraits(seleccionado ? .isSelected : [])
    }
}

#Preview {
    @Previewable @State var tab: AppTab = .inicio
    VStack {
        Spacer()
        FerTabBar(seleccion: $tab)
    }
    .background(Color.ferBackground)
}
