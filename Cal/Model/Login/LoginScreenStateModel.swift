//
//  LoginScreenStateModel.swift
//  Cal
//
//  Created by Omar Dajani on 11/16/22.
//

import Foundation

enum Screens {
    case welcomeScreen
    case loginScreen
    case registerScreen
}

class LoginScreenState: ObservableObject {
    @Published var screen: Screens = Screens.welcomeScreen
}
