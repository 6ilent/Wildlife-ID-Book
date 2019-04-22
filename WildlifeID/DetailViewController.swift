//
//  DetailViewController.swift
//  WildlifeID
//
//  Created by Jose Velasquez on 4/21/19.
//  Copyright © 2019 6ilent. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailName: UILabel!
    @IBOutlet var detailScientificName: UILabel!
    @IBOutlet var detailDescription: UITextView!
    
    var sentImage: String!
    var sentName: String!
    var sentScientificName: String!
    var sentDescription: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailImageView.layer.cornerRadius = 10
        detailImageView.image = UIImage(named: sentImage)
        
        detailName.text = sentName
        self.navigationItem.title = sentName
        
        detailScientificName.text = sentScientificName
        
        detailDescription.text = sentDescription
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
