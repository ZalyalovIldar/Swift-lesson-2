//
//  Extensions.swift
//  SwiftLesson2
//
//  Created by Ленар on 16.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation
import UIKit


let reuseIdentifier:String = "cell"
let imageNameArr:Array = DataManager.sharedInstance.getDataForCollection()["image"]!
let textArr:Array = DataManager.sharedInstance.getDataForCollection()["text"]!

//MARK:Collection property
let customColCell:CustomCollectionViewCell = CustomCollectionViewCell()

//MARK:Collection Initilasation
extension CollectionViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func makeCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let frame = CGRect(x: 0, y: ((self.navigationController?.navigationBar.frame.height)!+20), width: self.view.frame.width, height: (self.view.frame.height - (self.navigationController?.navigationBar.frame.height)!))
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .lightGray
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView!.register(customColCell.nib(), forCellWithReuseIdentifier: reuseIdentifier)
        self.view.addSubview(self.collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        cell.cellImageView.image = UIImage(named: imageNameArr[indexPath.row])
        cell.cellNameLabel.text = textArr[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: self.view.frame.size.width/2-0.3, height: self.view.frame.size.width/2-0.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.3
    }
    
}

//MARK:Table Property
let customTableCell:TableViewCell = TableViewCell()

//MARK:Table Initilasation
extension CollectionViewController:UITableViewDelegate, UITableViewDataSource {
    
    //MARK:Set table with some format and add to subview
    func makeTableView() {
        let frame = CGRect(x: 0, y: ((self.navigationController?.navigationBar.frame.height)!), width: self.view.frame.width, height: (self.view.frame.height - (self.navigationController?.navigationBar.frame.height)!))
        tableView = UITableView(frame: frame, style: .grouped)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 60.0
        self.tableView.register(customTableCell.nib(), forCellReuseIdentifier: reuseIdentifier)
        self.view.addSubview(self.tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell
        
        cell.tableCellLabel.text = textArr[indexPath.row]
        cell.tableCellImageView.image = UIImage(named: imageNameArr[indexPath.row])
        return cell
    }
}

extension TableViewCell {
    func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
}

extension CustomCollectionViewCell {
    func nib() -> UINib {
        return UINib(nibName: "CustomCollectionViewCell", bundle: nil)
    }
}
