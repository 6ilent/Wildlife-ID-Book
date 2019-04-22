//
//  CollectionViewController.swift
//  WildlifeID
//
//  Created by Jose Velasquez on 4/21/19.
//  Copyright © 2019 6ilent. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var items = [[String:String]]()
    
    func loadPlist() -> [[String:String]] {
        
        let path = Bundle.main.path(forResource: "Animals", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        // Do any additional setup after loading the view.
        self.items = loadPlist()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            
            let detail = segue.destination as! DetailViewController
            
            if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell) {
            
                let item = self.items[indexPath.row]
                
                detail.sentImage = item["Image"]
                detail.sentName = item["Name"]
                detail.sentScientificName = "(" + item["ScientificName"]! + ")"
                detail.sentDescription = item["Description"]
                
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        let item = self.items[indexPath.row]
        cell.cellImageView.image = UIImage(named: item["Image"]!)
        cell.layer.cornerRadius = 10
    
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenSize : CGRect = UIScreen.main.bounds
        var widthCell = 0
        var heightCell = 0
        
        if screenSize.width == 414 {
            widthCell = 185
            heightCell = 145
        }
        
        if screenSize.width == 375 {
            widthCell = 170
            heightCell = 125
        }
        
        if screenSize.width == 320 {
            widthCell = 145
            heightCell = 105
        }
        
        return CGSize(width: widthCell, height: heightCell)
    }

}
