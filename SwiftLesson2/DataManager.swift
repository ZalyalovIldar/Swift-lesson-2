//
//  Data.swift
//  SwiftLesson2
//
//  Created by Ленар on 16.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation

class DataManager {
    
    static let sharedInstance = DataManager()
    
    func getDataForCollection() -> Dictionary<String, Array<String>> {
        let textArr:Array<String> = ["Max","Bella","Callie","Kitty","Lilly","Leo","Daisy","Jack"]
        let imageArr:Array<String> = ["cat1","cat2","cat3","cat4","cat5","cat6","cat7","cat8"]
        let dataDict:Dictionary<String,Array<String>> = ["image":imageArr, "text":textArr];
        
        return dataDict
    }
    
}
