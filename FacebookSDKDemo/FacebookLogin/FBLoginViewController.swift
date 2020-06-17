//
//  FBLoginViewController.swift
//  FacebookSDKDemo
//
//  Created by Michael San Diego on 6/16/20.
//  Copyright © 2020 Michael San Diego. All rights reserved.
//

import UIKit

class FBLoginViewController: UIViewController {

    @IBOutlet weak var btnFBLogin: UIButton!
    
    var viewModel = FBLoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        viewModel.setupLoginButton(view:self.view)
//        setupViews()
    }
    
    func setupViews() {
        btnFBLogin.isHidden = viewModel.hideLoginButton()
    }
    
    @IBAction func loginWithFacebook(_ sender: Any) {
        viewModel.loginWithFacebook(self)
    }
    
}
