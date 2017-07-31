//
//  GETransportSelectViewController.swift
//  GoEuro
//
//  Created by Dmitry Osipa on 7/30/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

import UIKit

extension UIScrollView {
    func scrollToTop(animated: Bool) {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: animated)
    }
}

class GETransportSelectViewController: UIViewController, UIPopoverPresentationControllerDelegate, GESortViewControllerDelegate  {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let segmentTransitMap: [Int: GEOfferType] = [ 0 : .train, 1: .bus, 2: .plane]

    private static let embedSegue = "embedTable"
    private static let popoverSegue = "popoverSegue"
    private let offerDataSource = GEOffersDataSource()
    private var transitTableViewController: GETransitTableViewController!
    private var sortType: SortType?
    
    @IBAction func tabChangedAction(_ sender: UISegmentedControl) {
         self.select(segment: sender.selectedSegmentIndex)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == GETransportSelectViewController.embedSegue {
            transitTableViewController = (segue.destination as! GETransitTableViewController)
            transitTableViewController.tableView.dataSource = offerDataSource;
            self.select(segment: segmentedControl.selectedSegmentIndex);
        } else if segue.identifier == GETransportSelectViewController.popoverSegue {
            let popoverViewController = segue.destination as! GESortViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            popoverViewController.popoverPresentationController!.delegate = self
            popoverViewController.delegate = self
            if let sort = sortType {
                popoverViewController.select(type: sort)
            }
        }
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }

    private func select(segment: Int) {
        guard let type = segmentTransitMap[segment]
            else { return }
        self.transitTableViewController.tableView.scrollToTop(animated: false)
        self.offerDataSource.select(type, table: self.transitTableViewController.tableView)
    }

    func controller(controller: GESortViewController, didPick sort: SortType) {
        switch sort {
        case .arrivalTime:
            self.offerDataSource.sortByArrival()
            break
        case .departure:
            self.offerDataSource.sortByDeparture()
            break;
        default:
            self.offerDataSource.sortByDuration()
            break
        }
        sortType = sort
        self.dismiss(animated: true, completion: nil)
    }
}
