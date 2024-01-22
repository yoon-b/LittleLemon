//
//  Toggle.swift
//  LittleLemon
//
//  Created by Eunbi Kim on 1/19/24.
//

import SwiftUI

struct CategoryToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
            }
        }
        .foregroundColor(Color.primaryColor1)
        .padding(5)
        .background {
            if configuration.isOn {
                Color.highlightColor1
            }
        }
        .cornerRadius(8)
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .imageScale(.large)
                    .foregroundColor(.primaryColor1)
                configuration.label
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

