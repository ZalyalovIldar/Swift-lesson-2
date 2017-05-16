//
//  SecondViewController.swift
//  SwiftLesson2
//
//  Created by Ilyas on 16.05.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{


    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var dataArr:Array<cellData> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArr = [cellData(image: #imageLiteral(resourceName: "image1"), label: "lala"), cellData(image: #imageLiteral(resourceName: "image2"), label: "mama"), cellData(image: #imageLiteral(resourceName: "image3"), label: "keke"), cellData(image: #imageLiteral(resourceName: "image4"), label: "tata")]
        
        
        tableView.isHidden = true
        collectionView.isHidden = false

        // Do any additional setup after loading the view.
    }

    @IBAction func segmentControllerAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("Table")
            tableView.isHidden = true
            collectionView.isHidden = false
        case 1:
            print("Ceollection")
            tableView.isHidden = false
            collectionView.isHidden = true
        default:
            print("def")
        }
    }
    
    @IBAction func tapExit(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        userDefaults.set(false, forKey: "entered")
        userDefaults.synchronize()
        let controller = storyboard.instantiateViewController(withIdentifier: "FirstNavigation")
        dismiss(animated: true, completion: nil)
        self.present(controller, animated: true, completion: nil)
        
        
    }

}

// MARK: TableView
extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellTabel"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! CustomTableCell
        
        cell.cellImage.image = self.dataArr[indexPath.row].image
        cell.cellLabel.text = self.dataArr[indexPath.row].label
        
        return cell
    }
}

// MARK: ColletionView
extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "cellCollection"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CustomCollectionCell
        
        cell.cellImage.image = self.dataArr[indexPath.row].image
        cell.cellLabel.text = self.dataArr[indexPath.row].label
        
        return cell
    }
    
    
}
