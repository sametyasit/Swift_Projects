//
//  ViewController.swift
//  to_do_list
//
//  Created by Samet on 06/12/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var UIView: UIView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private let taskStorage = TaskStorage()
    var tasks: [Task] = [] // Görev listesi
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To-Do List"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
       
        // Görevleri yükle
        tasks = taskStorage.loadTasks()
    }
    
    
    // TableView Delegate ve DataSource metotları:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskTableViewCell else {
            fatalError("TaskTableViewCell bulunamadı.")
        }
        let task = tasks[indexPath.row]
        cell.configure(with: task)
        return cell
    }
    
    
    @IBAction func addTaskTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Task", message: "Enter task details", preferredStyle: .alert)
           alert.addTextField { textField in
               textField.placeholder = "Task Title"
           }
           
           let priorities: [Priority] = [.high, .medium, .low]
           for priority in priorities {
               alert.addAction(UIAlertAction(title: "\(priority.rawValue) Priority", style: .default, handler: { _ in
                   if let title = alert.textFields?.first?.text, !title.isEmpty {
                       let newTask = Task(title: title, priority: priority)
                       self.tasks.append(newTask)
                       self.tableView.reloadData()
                       
                       // Görevleri kaydet
                       self.taskStorage.saveTasks(self.tasks)
                   }
               }))
           }
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
           present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func foldersTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Folders", message: "Manage your folders", preferredStyle: .alert)
           alert.addTextField { textField in
               textField.placeholder = "Folder Name"
           }
           alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { _ in
               if let folderName = alert.textFields?.first?.text, !folderName.isEmpty {
                   print("Folder Created: \(folderName)") // Daha sonra klasör logic'i eklenebilir
               }
           }))
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
           present(alert, animated: true, completion: nil)
    }
    
    
    
    
   
    
    
    //Silme metodu
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Görevi veri kaynağından sil
            tasks.remove(at: indexPath.row)
         
            
            // Tabloyu güncelle
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            
            // Tabloyu tamamen yeniden yükle (daha az verimli ama kesin çözüm)
                  tableView.reloadData()
            
            // Güncellenen görevleri kaydet
            taskStorage.saveTasks(tasks)
        }
    }
}
