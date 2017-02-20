//
//  ViewController.swift
//  SwiftLesson2
//
//  Created by Ildar Zalyalov on 15.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

struct UserData {
    var imageName:String 
    var text:String
    
   
}




class ViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataArr:Array<UserData> = Array()
    
     let cellIdentifier = "tableCell"
     let collectionCellId = "collectionCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let user1 = UserData(imageName: "2.jpg", text: "Follow")
        let user2 = UserData(imageName: "2.jpg", text: "Me")
        let user3 = UserData(imageName: "2.jpg", text: "To")
        
        dataArr.append(user1)
        dataArr.append(user2)
        dataArr.append(user3)
        collectionView.register(UINib(nibName:"CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: collectionCellId)
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier:cellIdentifier )
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func segmentControllerAction(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            collectionView.isHidden = true
            tableView.isHidden = false
            
        case 1:
            collectionView.isHidden = false
            tableView.isHidden = true
            
        default: break
            
            
        }
    }

    
    @IBAction func logoutButonDidClicked(_ sender: UIBarButtonItem) {
        guard let loginController = storyboard?.instantiateViewController(withIdentifier: "loginController") else {
            NSLog("not found controller with identifire")
            return
        }

        loginController.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(loginController, animated: true, completion: nil)
        LoginManager().logOut()
    }
    
    
    
    

    
   
}

    //MARK: Custom methods 

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.dataArr.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! TableViewCell
        
        let model = dataArr[indexPath.row]
        cell.labelTableCell.text = model.text
        let image = UIImage(named: model.imageName)
        cell.imageTableCell.image = image
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellId, for: indexPath as IndexPath) as! CollectionViewCell
        let model = dataArr[indexPath.row]
        cell.image.image = UIImage(named: model.imageName)
        cell.label.text = model.text
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    
    
    
    
}


