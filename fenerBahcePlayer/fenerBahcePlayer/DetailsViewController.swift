//
//  DetailsViewController.swift
//  fenerBahcePlayer
//
//  Created by Samet on 6.08.2024.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var secilenPlayerI = ""
    var secilenPalyerF = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: secilenPalyerF)
        label.text = secilenPlayerI
        
        }
    

    

}
