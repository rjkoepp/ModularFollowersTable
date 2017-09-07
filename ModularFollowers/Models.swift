//
//  Models.swift
//  FollowersWindow
//
//  Created by Robert  Koepp on 9/2/17.
//  Copyright © 2017 Robert Koepp. All rights reserved.
//

import UIKit

class User {
    
    let username: String
    let fullname: String
    let image: UIImage
    
    init (username: String, fullname: String, image: UIImage) {
        
        self.username = username
        self.fullname = fullname
        self.image = image
    }
    
}
