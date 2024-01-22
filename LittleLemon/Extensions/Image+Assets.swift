//
//  Image+Assets.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/18/24.
//

import SwiftUI

enum Asset: String {
    case logo = "logo"
    case hero = "hero"
    case profile = "profile"
    case van = "delivery-van"
}

extension Image {
    init(_ asset: Asset) {
        self.init(asset.rawValue)
    }
}
