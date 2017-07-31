//
//  GETransitTableControllerTableViewController.swift
//  GoEuro
//
//  Created by Dmitry Osipa on 7/30/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

import UIKit

class GETransitTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate {

    private static let popoverCellSegue = "popoverCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = true
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: GETransitTableViewController.popoverCellSegue, sender: nil)
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == GETransitTableViewController.popoverCellSegue {
            let popoverViewController = segue.destination
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            //popoverViewController.popoverPresentationController!.delegate = self
        }
    }

}
