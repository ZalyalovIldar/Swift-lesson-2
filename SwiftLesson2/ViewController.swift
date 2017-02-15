//
//  ViewController.swift
//  SwiftLesson2
//
//  Created by Ildar Zalyalov on 15.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

struct Location {
    var latitute: Double
    var longitute: Double
    var name: String
    
    init(name: String) {
        self.name = name
        self.latitute = 41.4
        self.longitute = 21.4
    }
    
    init(latititute: Double, longitute: Double) {
        self.latitute = latititute
        self.longitute = longitute
        self.name = "name"
    }
}

class ViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    var someId: Int?
    var dataArr:Array<String> = ["News","News","News"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let lat: Double  = 4.009231
        let long: Double = 5.01020
        let location = Location(latititute: lat, longitute: long)
        self.calculateSmth(location: location)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Custom methods
    
    func calculateSmth(location: Location){
        
        print("Lat: \(location.latitute) \nLong: \(location.longitute)")
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath)
        
        cell.textLabel?.text = self.dataArr[indexPath.row]
        
        return cell
    }
}

