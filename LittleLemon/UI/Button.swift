//
//  Button.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/19/24.
//

import SwiftUI

struct Primary1Button: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.primaryColor1 : .white)
            .padding(10)
            .background(configuration.isPressed ? .white : Color.primaryColor1)
            .cornerRadius(8)
            .overlay (
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct Primary2Button: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .white: .black)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : Color.primaryColor2)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct ReversePrimary1Button: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .white : Color.primaryColor1)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : .white)
            .cornerRadius(8)
            .overlay (
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}
