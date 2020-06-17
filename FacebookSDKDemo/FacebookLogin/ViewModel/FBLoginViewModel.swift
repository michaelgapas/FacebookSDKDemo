//
//  FBLoginViewModel.swift
//  FacebookSDKDemo
//
//  Created by Michael San Diego on 6/16/20.
//  Copyright © 2020 Michael San Diego. All rights reserved.
//

import Foundation
import FacebookCore
import FacebookLogin

class FBLoginViewModel {
    
    
    func isLoggedIn() -> Bool {
        if let token = AccessToken.current,
            !token.isExpired {
            // User is logged in, do work such as go to next view controller.
            return true
        } else {
            return false
        }
    }
    
    func hideLoginButton() -> Bool {
        return isLoggedIn()
    }
    
    func setupLoginButton(view: UIView) {
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
    }
    
    func loginWithFacebook(_ viewController: UIViewController) {
        let manager = LoginManager()
        manager.logIn(permissions: [.publicProfile, .email, .userBirthday], viewController: viewController) { result in
            switch result {
            case .cancelled:
                print("User cancelled login process")
                break
            case .failed(let error):
                print("Login failed with error - \(error.localizedDescription)")
                break
            case .success(let granterPermissions, let declinedPermissions, let accessToken):
                print("""
                    userID: \(accessToken.userID),
                    access token: \(accessToken.tokenString)
                    """)
                self.getUserProfile()
            }
        }
    }
    
    func getUserProfile() {
        let connection = GraphRequestConnection()
        connection.add(GraphRequest(graphPath: "me", parameters: ["fields":"id,name,about,birthday,picture"])) { (_, result, error) in
                                        print("RESULT: \(result)")
        }
        connection.start()
    }
}
