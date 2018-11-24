//
//  ViewController.swift
//  AppVersionExample
//

import UIKit
import AppVersion

class TableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.addVersionFooter(with: .longWithName)
    }

}
