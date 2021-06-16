//
//  ViewController.swift
//  CodableDemo
//
//  Created by Mirajkar on 16/06/21.
//  Copyright © 2021 Mirajkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //API call
        NetworkManager.shared.callPetitionAPI()
    }


}

