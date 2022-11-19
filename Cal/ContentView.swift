//
//  ContentView.swift
//  Cal
//
//  Created by Omar Dajani on 11/16/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var loginScreenState: LoginScreenState = LoginScreenState()
    @State var signedIn: Bool = false
    
    var body: some View {
        if !signedIn {
            switch loginScreenState.screen {
            case Screens.welcomeScreen:
                WelcomeScreen()
                    .environmentObject(loginScreenState)
                
            case Screens.registerScreen:
                RegisterScreen()
                    .environmentObject(loginScreenState)
                
            case Screens.loginScreen:
                LoginScreen(signedIn: $signedIn)
                    .environmentObject(loginScreenState)
            }
        } else {
            TabView {
                SocialFeed()
                .tabItem {
                    Label("Social Feed", systemImage: "list.dash")
                }

                SearchFood()
                .tabItem {
                    Label("Search Food", systemImage: "square.and.pencil")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
