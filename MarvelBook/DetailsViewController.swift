//
//  DetailsViewController.swift
//  MarvelBook
//
//  Created by Bora Gündoğu on 1.03.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    var secilenKahraman = ""
    var secilenKahramanResim = ""
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: secilenKahramanResim)
        label.text = secilenKahraman
        
    }
    
    
}
