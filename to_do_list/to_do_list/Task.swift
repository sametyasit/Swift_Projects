//
//  Task.swift
//  to_do_list
//
//  Created by Samet on 06/12/2024.
//

import Foundation
import UIKit

// Görevlerin öncelik seviyeleri
enum Priority: String, Codable {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
    
    func color() -> UIColor {
        switch self {
        case .high:
            return UIColor.red.withAlphaComponent(0.5)
        case .medium:
            return UIColor.yellow.withAlphaComponent(0.5)
        case .low:
            return UIColor.green.withAlphaComponent(0.5)
        }
    }
}

// Görev yapısı
struct Task: Codable {
    let title: String
    let priority: Priority
}
