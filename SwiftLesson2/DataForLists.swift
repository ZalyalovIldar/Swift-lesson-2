//
//  DataForLists.swift
//  SwiftLesson2
//
//  Created by Rustam N on 17.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit
struct MyDataForLists {
    let imageName: String
    let words: String
}

class DataForLists: NSObject {
    class func getArrData()->Array<MyDataForLists>{
        var arrData: Array<MyDataForLists> = []
        let arrWords  = ["Spring", "Mushroom", "Stool", "Coat", "Soap", "Moon", "Fence", "Land", "Cat", "Sledge"]
        let arrImage = ["1", "2", "3", "4", "5"]
        for _ in 0...15{
            let myImage = arrImage[Int(arc4random_uniform(UInt32(arrImage.count)))]
            let myWord = arrWords[Int(arc4random_uniform(UInt32(arrWords.count)))]
            let data = MyDataForLists.init(imageName: myImage, words: myWord)
            arrData.append(data)
        }
        return arrData
    }

}
