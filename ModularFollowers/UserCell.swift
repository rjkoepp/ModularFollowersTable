//
//  UserCell.swift
//  FollowersWindow
//
//  Created by Robert  Koepp on 9/2/17.
//  Copyright © 2017 Robert Koepp. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    var user: User? {
        
        didSet{
            //everytime a user is set in user cell
            profilePic.image = user?.image
            usernameLabel.text = user?.username
            fullnameLabel.text = user?.fullname
        }
        
    }
    
    //Simple way of defining a constant, non-mutable object
    // Curly braces indicates closure, and you execute the closure with () at the end,
    // gives you back the return value inside.
    
    private let profilePic: UIImageView = {
        
        let imageView = UIImageView()
        
        // allows for auto resizing
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private let usernameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "UserName"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let fullnameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "FullName"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // overide intializer
    // allows rendering
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profilePic)
        profilePic.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true // pin to left w/ 8 pixels of padding
        profilePic.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        profilePic.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        profilePic.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(usernameLabel)
        usernameLabel.leftAnchor.constraint(equalTo: profilePic.rightAnchor, constant: 8).isActive = true
        usernameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true // pushes left 8 pixels
        usernameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        
        addSubview(fullnameLabel)
        fullnameLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 4).isActive = true
        fullnameLabel.leftAnchor.constraint(equalTo: profilePic.rightAnchor, constant: 8).isActive = true
        fullnameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        fullnameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

//Notes
/*
 
 Auto layout needs to be provided with x coord, y coord, width, height (rectangle on where to render)
 */
