//
//  ViewController.swift
//  SwiftLesson2
//
//  Created by Ildar Zalyalov on 15.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

struct SomeData {
    var imageName: String
    var text: String
    
    init(imageName: String, text: String) {
        self.imageName = imageName
        self.text = text
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var someId: Int?
    lazy var dataArr:Array<SomeData> = {
        var dataArr = Array<SomeData>()
        var someData = SomeData(imageName: "image.jpg", text: "Some text")
        for i in 1...10 {
            dataArr.append(someData)
        }
        
        return dataArr
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Action handlers
    @IBAction func signOutBarButtonDidClicked(_ sender: Any) {
        
        AuthorizationManager.sharedInstance.signOut()
        let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginController")
        loginViewController?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(loginViewController!, animated: true, completion: nil)
    }

    @IBAction func segmentControllDidChangeValue(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0)
        {
            tableView.isHidden = false
            self.collectionView.isHidden = true
        }else
        {
            self.collectionView.isHidden = false
            tableView.isHidden = true
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! CustomTableViewCell
        cell.customImageView.image = UIImage(named: dataArr[indexPath.row].imageName)
        cell.customTexLable.text = dataArr[indexPath.row].text
        
        return cell
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CustomCollectionViewCell
        cell.imageView.image = UIImage(named: dataArr[indexPath.row].imageName)
        cell.textLabel.text = dataArr[indexPath.row].text
        return cell
    }

}

