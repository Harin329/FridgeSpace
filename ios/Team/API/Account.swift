//
//  Account.swift
//  Team
//
//  Created by Harin Wu on 2021-01-16.
//
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

struct AccountEndpoints {
    
    static func createUser(user: User) {
        var semaphore = DispatchSemaphore (value: 0)
        
        let parameters = "{\n    \"facebookId\": \"" + user.facebookId + "\",\n    \"email\": \"" + user.email + "\",\n    \"name\": \"" + user.name + "\"\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://fridg.space/api/login/facebook")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
    }
}
