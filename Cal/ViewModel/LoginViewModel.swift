//
//  Login.swift
//  Cal
//
//  Created by Omar Dajani on 11/16/22.
//

import SwiftUI
import Foundation
import FirebaseAuth

class LoginViewModel {
    private var email: String
    private var password: String
    private var uid: String
    private var username: String
    private var signedIn: Binding<Bool>?
    
    public init(email: String, password: String, uid: String, username: String, signedIn: Binding<Bool>?) {
        self.email = email
        self.password = password
        self.uid = uid
        self.username = username
        if signedIn != nil {
            self.signedIn = signedIn
        }
    }
    
    public func register(email: String, password: String, name: String, username: String) async -> (Bool, String) {
        var errorMsg: String = ""
        
        do {
            let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
            let user = authDataResult.user
            
            createProfile(uid: user.uid, name: name, username: username)
        } catch {
            errorMsg = error.localizedDescription
        }
        
        return (errorMsg.isEmpty, errorMsg)
    }
    
    public func login() async -> (Bool, String) {
        var errorMsg: String = ""
        
        do {
            let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
            let user = authDataResult.user
            
            retrieveProfile(uid: user.uid)
        } catch {
            errorMsg = error.localizedDescription
        }
        
        return (errorMsg.isEmpty, errorMsg)
    }
    
    private func parseJson(data: Data) {
        do {
            let userInfo = try JSONSerialization.jsonObject(with: data, options: [])
            let userDic = userInfo as! [String:String]
            let role = Int(userDic["role"]!)
            DispatchQueue.main.async{
                let factory: UserFactory = UserFactory()
                UserModel.instance = factory.factory(uid: self.uid, email: self.email, name: userDic["name"]!, username: userDic["username"]!, role: role!)
            }
            self.signedIn?.wrappedValue = true
        } catch {
            print("Error parsing JSON data")
        }
    }
    
    public func retrieveProfile(uid: String) {
        let url = URL(string: "https://omardajani.com/projects/cal/getuser.php")!
        let parameters: [String: Any] = ["uid": uid]
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("error \(error)")
            } else if let data = data {
                self.parseJson(data: data)
            }
        }
        
        task.resume()
    }
    
    public func createProfile(uid: String, name: String, username: String) {
        let url = URL(string: "https://omardajani.com/projects/cal/insertprofile.php")!
        let parameters: [String: Any] = ["uid": uid, "name": name, "username": username]
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("error \(error)")
            } else if let data = data {
                print(String(decoding: data, as: UTF8.self))
            }
        }
        
        task.resume()
    }
}
