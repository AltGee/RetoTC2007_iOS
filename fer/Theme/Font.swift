//
//  Font.swift
//  fer
//
//  Created by MAC on 27/11/26.
//

import Foundation
import SwiftUI

extension Font {
    static func openSansRegular(_ size: CGFloat) -> Font {
        .custom("OpenSans-Regular", size: size)
    }

    static func openSansSemiBold(_ size: CGFloat) -> Font {
        .custom("OpenSans-SemiBold", size: size)
    }

    static func openSansBold(_ size: CGFloat) -> Font {
        .custom("OpenSans-Bold", size: size)
    }
}
