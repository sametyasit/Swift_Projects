//
//  DetailsViewController.swift
//  SehirTanitimKitabi
//
//  Created by Samet on 8.08.2024.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var SehirIsmi: UILabel!
    @IBOutlet weak var SehirBolgesi: UILabel!
    
    var secilenSehir : Sehir?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SehirIsmi.text = secilenSehir?.isim
        SehirBolgesi.text = secilenSehir?.bolge
        imageView.image = secilenSehir!.gorsel
    }
    


}
