//
//  ViewController.swift
//  HaberUygulamasi
//
//  Created by Samet on 22.10.2024.
//
/*
import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableWiewCell: UITableView!
    private var newsTableViewModel: NewsTableViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      tableWiewCell.delegate = self
      tableWiewCell.dataSource = self
        
        veriAl()
        
      
    }
    
    func veriAl(){
        let url = URL (string: "https://raw.githubusercontent.com/atilsamencioglu/BTK-iOSDataSet/master/dataset.json,burada linkte sıkıntı olduğu için çalışmıyor")
        
        Webservice().haberleriindir(url: url!) { (haberler) in
            if let haberler = haberler {
                self.newsTableViewModel = NewsTableViewModel(NewsList : haberler)
              
                DispatchQueue.main.async {
               //     self.tableView.reloadData()
                }
               
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return newsTableViewModel == nil ? 0 : self.newsTableViewModel?.tableView(UITableView, numberOfRowsInSection: Int)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        as! NewsCell
        let newsViewModel = self.newsTableViewModel?.newsAtIndexPath(index: indexPath.row)
        cell.titleLabel.text = newsViewModel?.title
        cell.storyLabel.text = newsViewModel?.story
        
        return cell
        
    }
}

*/
