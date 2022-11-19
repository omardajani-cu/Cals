//
//  LoginScreen.swift
//  Cal
//
//  Created by Omar Dajani on 11/16/22.
//

import SwiftUI

struct LoginScreen: View {
    @Binding var signedIn: Bool
    
    @EnvironmentObject var loginScreenState: LoginScreenState
    
    @State var email: String = ""
    @State var password: String = ""
    @State var message: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Group {
                TextField("Enter email...", text: $email)
                TextField("Enter password...", text: $password)
            }
            .background(.gray)
            
            Button("Sign in") {
                Task {
                    let loginViewModel: LoginViewModel = LoginViewModel(email: email, password: password, uid: "", username: "", signedIn: $signedIn)
                    let result = await loginViewModel.login()
                    let success = result.0
                    let errorMsg = result.1
                    
                    if (success) {
//                        signedIn = true
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

//struct LoginScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginScreen()
//    }
//}
