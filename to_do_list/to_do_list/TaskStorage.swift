//
//  TaskStorage.swift
//  to_do_list
//
//  Created by Samet on 06/12/2024.
//

import Foundation
import Foundation

class TaskStorage {
    private let userDefaultsKey = "savedTasks"
    
    // Görevleri kaydetmek
    func saveTasks(_ tasks: [Task]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    // Görevleri yüklemek
    func loadTasks() -> [Task] {
        let decoder = JSONDecoder()
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? decoder.decode([Task].self, from: savedData) {
            return decoded
        }
        return [] // Eğer veri yoksa boş liste döner
    }
}
