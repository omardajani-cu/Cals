//
//  WelcomeScreen.swift
//  Cal
//
//  Created by Omar Dajani on 11/16/22.
//

import SwiftUI

struct WelcomeScreen: View {
    @EnvironmentObject var loginScreenState: LoginScreenState
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Login") {
                loginScreenState.screen = Screens.loginScreen
            }
            
            Button("Register") {
                loginScreenState.screen = Screens.registerScreen
            }
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
