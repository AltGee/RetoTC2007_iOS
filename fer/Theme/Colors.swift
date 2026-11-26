
import SwiftUI
import UIKit

extension Color {
    static let ferNavy       = Color(hex: 0x143F90)
    static let ferNavyDeep   = Color(hex: 0x0B2A66)
    static let ferNavyBright = Color(hex: 0x2456B8)

    static let ferPrimary            = Color(light: 0x143F90, dark: 0x9DB7F0)
    static let ferPrimaryContainer   = Color(light: 0xDCE5F7, dark: 0x1E3463)
    static let ferOnPrimaryContainer = Color(light: 0x0A1F4A, dark: 0xDCE5F7)
    static let ferBackground         = Color(light: 0xF4F7FC, dark: 0x0B1220)
    static let ferSurface            = Color(light: 0xFFFFFF, dark: 0x131C2F)
    static let ferOnSurface          = Color(light: 0x13213D, dark: 0xE4E9F3)
    static let ferOnSurfaceVariant   = Color(light: 0x556378, dark: 0xA3AEC2)
    static let ferOutlineVariant     = Color(light: 0xE3E8F1, dark: 0x24304A)
}

extension Color {
    init(hex: UInt32) {
        self.init(uiColor: UIColor(hex: hex))
    }

    init(light: UInt32, dark: UInt32) {
        self.init(uiColor: UIColor { traits in
            UIColor(hex: traits.userInterfaceStyle == .dark ? dark : light)
        })
    }
}

private extension UIColor {
    convenience init(hex: UInt32) {
        self.init(
            red:   CGFloat((hex >> 16) & 0xFF) / 255,
            green: CGFloat((hex >> 8) & 0xFF) / 255,
            blue:  CGFloat(hex & 0xFF) / 255,
            alpha: 1
        )
    }
}
