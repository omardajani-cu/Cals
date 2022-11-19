//
//  RegisterScreen.swift
//  Cal
//
//  Created by Omar Dajani on 11/16/22.
//

import SwiftUI

struct RegisterScreen: View {
    @EnvironmentObject var loginScreenState: LoginScreenState
    
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @State var username: String = ""
    @State var message: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Group {
                TextField("Enter email...", text: $email)
                TextField("Enter password...", text: $password)
                TextField("Enter name...", text: $name)
                TextField("Enter username...", text: $username)
            }
            .background(.gray)
            
            Button("Register") {
                Task {
                    let loginViewModel: LoginViewModel = LoginViewModel(email: email, password: password, uid: "", username: username, signedIn: nil)
                    let result = await loginViewModel.register(email: email, password: password, name: name, username: username)
                    let success = result.0
                    let errorMsg = result.1
                    
                    if (success) {
                        loginScreenState.screen = Screens.loginScreen
                    } else {
                        message = errorMsg
                    }
                }
            }
            Button("Back") {
                loginScreenState.screen = Screens.welcomeScreen
            }
            
            Text(message)
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
