//
//  HideBar.swift
//  TV Guide
//
//  Created by Blue Parrot Software Mac 01 on 5/26/21.
//

import SwiftUI
import UIKit

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

