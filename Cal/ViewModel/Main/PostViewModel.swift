//
//  PostViewModel.swift
//  Cal
//
//  Created by Omar Dajani on 11/18/22.
//

import Foundation

class PostViewModel {
    private func parseJson(data: Data) {
        var postsArry = [PostModel]()
        do {
            let jsonArr = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
            for jsonResult in jsonArr {
                let jsonDic = jsonResult as! [String:String]
            }
        } catch {
            
        }
    }

    public func retrievePosts(uid: String) {
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
}
