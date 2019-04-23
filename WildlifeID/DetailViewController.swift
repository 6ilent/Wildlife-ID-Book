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
    @IBOutlet var detailScientificName: UIButton!
    @IBOutlet var detailDescription: UITextView!
    
    @IBAction func TaxonomyMessage(_ sender: UIButton) {
        let TaxMess = UIAlertController(title: "Taxonomy", message: "Kingdom: \n\(TaxK!) \n\nPhylum: \n\(TaxP!) \n\nClass: \n\(TaxC!) \n\nOrder: \n\(TaxO!) \n\nFamily: \n\(TaxF!) \n\nGenus & Species: \n\(sentScientificName!)", preferredStyle: .alert)
        TaxMess.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        self.present(TaxMess, animated: true, completion: nil)
    }
    
    var sentImage: String!
    var sentName: String!
    var sentScientificName: String!
    var sentDescription: String!
    
    var TaxK: String!
    var TaxP: String!
    var TaxC: String!
    var TaxO: String!
    var TaxF: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailImageView.layer.cornerRadius = 10
        detailImageView.image = UIImage(named: sentImage)
        
        detailName.text = sentName
        self.navigationItem.title = sentName
    
        detailScientificName.setTitle("(" + sentScientificName! + ")", for: .normal)
        
        detailDescription.text = sentDescription
    }

}
