//
//  TaskCellHelper.swift
//  to_do_list
//
//  Created by Samet on 06/12/2024.
//

import Foundation
import UIKit

class TaskCellHelper {
    // Hücreyi görev verisine göre ayarlayan metod
    static func configure(cell: UITableViewCell, with task: Task) {
        cell.textLabel?.text = task.title
        cell.backgroundColor = task.priority.color()
    }
}
