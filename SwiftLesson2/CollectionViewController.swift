//
//  CollectionViewController.swift
//  SwiftLesson2
//
//  Created by Ленар on 15.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    let signInKey = "SignIn"
    let signInLaunchedKey = "SignInLaunched"
    
    @IBOutlet weak var collectionSegmentContoller: UISegmentedControl!
    var tableView:UITableView!
    var collectionView:UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeTableView()
    }
    
    @IBAction func signOutAction(_ sender: UIBarButtonItem){
        let userData = UserDefaults.standard
        
        userData.set(false, forKey: signInKey)
        userData.synchronize()
        if userData.bool(forKey: signInLaunchedKey) {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let signInController = storyBoard.instantiateViewController(withIdentifier: signInKey)
            present(signInController, animated: true, completion: nil)
        }else {
            userData.set(false, forKey: signInLaunchedKey)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func changeSegmentAction(_ sender: UISegmentedControl) {
        switch collectionSegmentContoller.selectedSegmentIndex {
        case 0:
            self.makeTableView()
        case 1:
            self.makeCollectionView()
        default:
            break
        }
    }
    
}
