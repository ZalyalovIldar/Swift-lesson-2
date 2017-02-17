//
//  Lists.swift
//  SwiftLesson2
//
//  Created by Rustam N on 15.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class Lists: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var segment: UISegmentedControl!
    var tableView: UITableView!
    var collectionView : UICollectionView!
    let arrData = DataForLists.getArrData()
    let tableCellIdentifier = "ListsTableCell"
    let collectionCellIdentifier = "CollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        initCollectionView()
        collectionView.isHidden = true
    }

    @IBAction func segemetAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            collectionView.isHidden = true
            tableView.isHidden = false
        case 1:
            tableView.isHidden = true
            collectionView.isHidden = false
        default:
            break;
        }
    }

    @IBAction func exitButtonAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true) {
            let userDefaults = Foundation.UserDefaults.standard
            userDefaults.set(false, forKey: "isAutohorization")
        }
    }

}


extension Lists: UICollectionViewDelegate, UICollectionViewDataSource{
    // MARK: UICollectionViewDataSource

    func initCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 92, height: 131)
        let nib = UINib(nibName: "ListsCollectionCell", bundle: nil)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(nib, forCellWithReuseIdentifier: collectionCellIdentifier)
        collectionView.backgroundColor = UIColor.white
        self.contentView.addSubview(collectionView)
   }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath as IndexPath) as! ListsCollectionCell
        let myData: MyDataForLists = arrData[indexPath.row]
        cell.myLabel.text = myData.words
        cell.myImage.image = UIImage(named: myData.imageName)
        return cell
    }
}

extension Lists: UITableViewDelegate, UITableViewDataSource{
    // MARK: - Table view data source
    
    func initTableView(){
        let nib = UINib(nibName: "ListsTableCell", bundle: nil)
        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tableView.rowHeight = 122
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nib, forCellReuseIdentifier: tableCellIdentifier)
        self.contentView.addSubview(self.tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as! ListsTableCell
        let myData: MyDataForLists = arrData[indexPath.row]
        cell.myLabel.text = myData.words
        cell.myImage.image = UIImage(named: myData.imageName)
        return cell;
    }


}


