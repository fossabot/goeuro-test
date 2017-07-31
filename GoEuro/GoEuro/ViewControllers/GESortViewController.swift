//
//  GESortViewController.swift
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

import UIKit

enum SortType: String {
    case arrivalTime = "Arrival Time"
    case duration = "Trip Duration"
    case departure = "Departure Time"
}

protocol GESortViewControllerDelegate: NSObjectProtocol {
    func controller(controller: GESortViewController, didPick sort: SortType)
}

class GESortViewController: UITableViewController {

    static let sortCell = "kSortCell"
    let items: [SortType] = [.arrivalTime, .duration, .departure]
    private var selectedIndex = 0

    weak open var delegate: GESortViewControllerDelegate?

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GESortViewController.sortCell, for: indexPath)
        cell.textLabel?.text = items[indexPath.row].rawValue
        if indexPath.row == self.selectedIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        cell.selectionStyle = .none
        return cell;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let prevIndex = selectedIndex
        let prevIndexPath = IndexPath(row: prevIndex, section: 0)
        selectedIndex = indexPath.row;
        self.tableView.beginUpdates()
        self.tableView.reloadRows(at: [indexPath, prevIndexPath], with: .none)
        self.tableView.endUpdates()
        self.delegate?.controller(controller: self, didPick: items[selectedIndex])
    }

    func select(type: SortType) {
        self.selectedIndex = items.index(of: type)!
    }

}
