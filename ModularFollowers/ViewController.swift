//
//  ViewController.swift
//  FollowersWindow
//
//  Created by Robert  Koepp on 8/30/17.
//  Copyright © 2017 Robert Koepp. All rights reserved.
// https://pastebin.com/qMamHMH4
//

import UIKit

class ViewController: UITableViewController, UISearchResultsUpdating {
    
    var users: [User]?
    // var filteredUsers: [User]?
    var filteredUsers = [User]()
    
    
    // with a nil value for the searchResultsController, you tell the search controller that you want use the same view you’re searching to display the results
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tells the ui table view, everytime we deque a cell w/ cellID just use table view cell to render
        tableView.register(UserCell.self, forCellReuseIdentifier: "cellId")
        
        tableView.tableFooterView = UIView()
        
        navigationItem.title = "Followers"
        
        // called everytime view controller is instantiated
        setupUsers()
        
        setupSearch()
        
        
    }
    
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        // present a view controller
    //        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "UserController") as UIViewController, animated: true)
    //
    //        self.performSegue(withIdentifier: "UserController", sender:self)
    //
    //        // default spacing of 10
    //        //let layout = UICollectionViewFlowLayout()
    //        //let userController = UserController(ViewController: layout)
    //        let navController = UINavigationController(rootViewController: userController)
    //
    //        present(navController, animated: true, completion: nil)
    //    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // will try to recycle cell, if unable, will create
        
        // downcasted to user cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! UserCell
        
        if isFiltering() {
            
            let user = filteredUsers[indexPath.row]
            
            cell.user = user
            
        } else {
            
            let user = users?[indexPath.row]
            
            cell.user = user
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //  check whether the user is searching or not, and use either the filtered or normal users as a data source for the table
        if isFiltering() {
            
            return filteredUsers.count
            
        }
        
        if let count = users?.count {
            
            // refreshes self
            return count
            
        }
        
        return 0
        
    }
    
    func setupUsers() {
        
        
        // Icons made by Freepik from www.flaticon.com
        
        let user1 = User(username: "AnalyticalEngine", fullname: "Ada Lovelace", image: #imageLiteral(resourceName: "avatar1"))
        
        let user2 = User(username: "VoldyKiller", fullname: "Harry Potter", image: #imageLiteral(resourceName: "avatar2"))
        
        let user3 = User(username: "Rock", fullname: "Dwayne Johnson", image: #imageLiteral(resourceName: "avatar3"))
        
        let user4 = User(username: "GameOn", fullname: "David Blackwell", image: #imageLiteral(resourceName: "avatar4"))
        
        let user5 = User(username: "Spacebound", fullname: "Mae C. Jemison", image: #imageLiteral(resourceName: "avatar5"))
        
        self.users = [user1, user2, user3, user4, user5]
        
    }
    
    func setupSearch() {
        
        
        //Setting the searchResultsUpdater property to self, sets the delegate to our view controller instance.
        searchController.searchResultsUpdater = nil
        
        searchController.searchResultsUpdater = self
        
        // prevents the navigation bar from hiding while you type in the search bar.
        searchController.hidesNavigationBarDuringPresentation = false
        
        // The dimsBackgroundDuringPresentation indicates whether the search results look dim when typing a search
        searchController.dimsBackgroundDuringPresentation = false
        
        //ensures that the search bar does not remain on the screen if the user navigates to another view controller while the UISearchController is active
        definesPresentationContext = true
        
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        print("updating")
        filterContentForSearchText(searchController.searchBar.text!)
        
    }
    
    func isFiltering() -> Bool {
        
        return searchController.isActive && !searchBarIsEmpty()
        
    }
    
    func searchBarIsEmpty() -> Bool {
        
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
        
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        filteredUsers = users!.filter({( user : User) -> Bool in
            
            // checks username and full name
            return user.username.lowercased().contains(searchText.lowercased()) || user.fullname.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    
}

