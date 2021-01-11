//
//  DeviceTraitStatus.swift
//  SwiftUIDeviceTraitStatus
//
//  Created by okudera on 2021/01/11.
//

import SwiftUI

enum DeviceTraitStatus {
    case wRhR
    case wChR
    case wRhC
    case wChC
    
    init(hSizeClass: UserInterfaceSizeClass?, vSizeClass: UserInterfaceSizeClass?) {
        
        switch (hSizeClass, vSizeClass) {
        case (.regular, .regular):
            self = .wRhR
        case (.compact, .regular):
            self = .wChR
        case (.regular, .compact):
            self = .wRhC
        case (.compact, .compact):
            self = .wChC
        default:
            self = .wChR
        }
    }
}
