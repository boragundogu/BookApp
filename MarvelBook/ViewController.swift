//
//  ViewController.swift
//  MarvelBook
//
//  Created by Bora Gündoğu on 1.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var superKahramanlar = [String]()
    var kahramanGörseller = [String]()
    var secilenIsim = ""
    var secilenResim = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        superKahramanlar.append("Thor")
        superKahramanlar.append("Iron Man")
        superKahramanlar.append("Spider Man")
        superKahramanlar.append("Loki")
        superKahramanlar.append("Cpt. America")
        
//        var kahramanResimler = [UIImage]()
//        kahramanResimler.append(UIImage(named: "thor")!)
        
        
        kahramanGörseller.append("thor")
        kahramanGörseller.append("ironman")
        kahramanGörseller.append("spiderman")
        kahramanGörseller.append("loki")
        kahramanGörseller.append("cptamerica")
        
        
    }
    
    
    // numberOfRowsInsection -> satır sayısı
    // cellForRow atIndexPath -> satırın içerisinde neler gösterilecek
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return superKahramanlar.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superKahramanlar[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            superKahramanlar.remove(at: indexPath.row
            kahramanGörseller.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        secilenIsim = superKahramanlar[indexPath.row]
        secilenResim = kahramanGörseller[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenKahraman = secilenIsim
            destinationVC.secilenKahramanResim = secilenResim
        }
    }

}

