//
//  Spotify.swift
//  Swap2
//
//  Created by Justin Stares on 11/21/20.
//

import Foundation
import Firebase
import FirebaseAuth
import SwiftyJSON


func addSpotify(){
    print("spotify here")
    if (Auth.auth().currentUser != nil) {
        let user = Auth.auth().currentUser
        if let user = user {
            user.getIDTokenForcingRefresh(true) { idToken, error in
                if error != nil {
                    return;
            }
            GlobalVar.IdToken = idToken!
            // Send token to your backend via HTTPS
            let url = URL(string: "https://us-central1-swap-2b365.cloudfunctions.net/api/user")
            guard let requestUrl = url else { fatalError() }

            // Create URL Request
            var request = URLRequest(url: requestUrl)

            // Specify HTTP Method to use
            request.httpMethod = "GET"
              
            // Request Header
            request.setValue("Bearer " + idToken!, forHTTPHeaderField: "Authorization")
            // Send HTTP Request
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                    return
            }
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
                
            //ADD Later if we get a 403 error stop.
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
            }
            task.resume()
            //Now send to the url
            if let url = URL(string: "https://accounts.spotify.com/authorize?client_id=89cdb29bf6f44790a723ad12a28b4904&response_type=code&redirect_uri=swap2%3A%2F%2Fspotify%2F&scope=user-read-private%20user-follow-modify") {
                UIApplication.shared.open(url)
                }
            }
        }
    }
    else {
        //TODO: do we need to implement this???
        print("sign them out")
    }
    

}

func deleteSpotify(){
    
    ///NOT YET IMPLEMENTED
    
    if (Auth.auth().currentUser != nil) {
        // User is signed in.
        let user = Auth.auth().currentUser

        if let user = user {
            user.getIDTokenForcingRefresh(true) { idToken, error in
                if let error = error {
                    // Handle error
                    print("Something is wrong with the token\n Error: \(error)")
                    return;
                }

                // Create the url and subsequently the request
                let url = URL(string: "https://us-central1-swap-2b365.cloudfunctions.net/api/github")
                //print("User ID for get request is: " + string)
                guard let requestUrl = url else {fatalError()}
                
                var request = URLRequest(url: requestUrl)
                request.httpMethod = "DELETE"
                
                // Append the token to request header
                request.setValue("Bearer " + idToken!, forHTTPHeaderField: "Authorization")
                
                // Send the request
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    
                    // Prints an error if an error occured
                    if let error = error {
                        print("Error took place \(error)")
                        return
                    }
                    if let response = response as? HTTPURLResponse {
                        //print("Response HTTP Status Code: \(response.statusCode)")
                        if response.statusCode != 204 {
                            print("deletion did not work")
                            fatalError("deletion failed ")
                        }
                    }
                }
                task.resume()
                
            }
        }
    }
}

