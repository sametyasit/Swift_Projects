//
//  ViewController.swift
//  fenerBahcePlayer
//
//  Created by Samet on 6.08.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var PlayerI = [String]()
    var PlayerF = [String]()
    
    var secilenPlayerI = ""
    var secilenPlayerF = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
      
        PlayerI.append("ferdi")
        PlayerI.append("tadic")
        PlayerI.append("sow")
        PlayerI.append("kuyt")
        PlayerI.append("volkan")
        PlayerI.append("alex")
        
        // var PlayerF = [UIImage]()
        // PlayerF.append(UIImage(named : " Ferdi ") ! )
        
      
        PlayerF.append("ferdi")
        PlayerF.append("tadic")
        PlayerF.append("sow")
        PlayerF.append("kuyt")
        PlayerF.append("volkan")
        PlayerF.append("alex")
        
        // Do any additional setup after loading the view.
    }
        //numberOfRowsInSelection --> kaç tane row olacak
        //cellForRow atIndexPath --> Hücrenin içerisinde neler gösterilecek

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlayerI.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = PlayerI[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath ){
        
        if editingStyle == .delete {
            
            PlayerF.remove(at: indexPath.row)
            PlayerI.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.bottom )
        }
       
        }
    func tableView(_  tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        secilenPlayerI = PlayerI[indexPath.row]
        secilenPlayerF = PlayerF[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil )
    }
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            
            let destinationsVC = segue.destination as! DetailsViewController
            destinationsVC.secilenPlayerI = secilenPlayerI
            destinationsVC.secilenPalyerF = secilenPlayerF
            
        }
    }
    
    
    
}
    


