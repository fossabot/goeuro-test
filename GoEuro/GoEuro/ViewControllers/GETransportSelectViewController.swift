//
//  GETransportSelectViewController.swift
//  GoEuro
//
//  Created by Dmitry Osipa on 7/30/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

import UIKit

class GETransportSelectViewController: UIViewController {

    private static let kEmbedSegue = "embedTable"
    private let offerDataSource = GEOffersDataSource()
    private var transitTableViewController: GETransitTableViewController!

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func tabChangedAction(_ sender: UISegmentedControl) {
        self.offerDataSource.selectSection(sender.selectedSegmentIndex, table: self.transitTableViewController.tableView)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == GETransportSelectViewController.kEmbedSegue {
            transitTableViewController = (segue.destination as! GETransitTableViewController)
            transitTableViewController.tableView.dataSource = offerDataSource;
        }
    }
}
