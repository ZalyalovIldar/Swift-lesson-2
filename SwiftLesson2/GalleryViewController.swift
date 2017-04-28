//
//  ViewController.swift
//  SwiftLesson2
//
//  Created by Ildar Zalyalov on 15.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

struct DataInCell {
    var imageName: String
    var label: String
}

class GalleryViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellIdentifier = "tableViewCell"
    let collectionCellIdentifier = "collectionViewCell"
    
    var dataArr:Array<DataInCell> = [DataInCell(imageName: "1.jpg", label: "Louboutin"), DataInCell(imageName: "2.jpg", label: "Space"), DataInCell(imageName: "3.jpg", label: "Girl")]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier:cellIdentifier)
        collectionView.register(UINib(nibName:"CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: collectionCellIdentifier)
    }
    
    //MARK: Action
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
       guard let loginViewController = storyboard?.instantiateViewController(withIdentifier: "login")
        else {
            NSLog("Not found сontroller with specified identifier")
            return
        }
        loginViewController.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(loginViewController, animated: true, completion: nil)
        LoginManager().logOut()
    }
    
    //MARK: - SegmentedContol

    @IBAction func chooseTheTypeOfView(_ sender: UISegmentedControl) {
        
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
}

    //MARK: - TableViewDataSource

extension GalleryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! TableViewCell
        cell.imageInTableViewCell.image = UIImage(named: dataArr[indexPath.row].imageName)
        cell.labelInTableViewCell.text = dataArr[indexPath.row].label
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

    //MARK: - CollectionViewDataSource

extension GalleryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        cell.imageInCollectionViewCell.image = UIImage(named: dataArr[indexPath.row].imageName)
        cell.labelInCollectionViewCell.text = dataArr[indexPath.row].label
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 120)
    }

}
