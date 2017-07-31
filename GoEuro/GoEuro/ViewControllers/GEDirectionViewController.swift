//
//  GEDirectionViewController.swift
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

import UIKit

class GEDirectionViewController: UIViewController {

    @IBOutlet weak var directionDateLabel: UILabel?
    @IBOutlet weak var directionLabel: UILabel?
    
    static let dateFormatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
        return formatter
    }()

    public var direction: GEDirection! {
        didSet {
            self.setupLabels()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupLabels()
    }

    func setupLabels() {
        let text = (direction.fromLocation as String) + " → " + (direction.toLocation as String)
        self.directionLabel?.text = text
        self.directionDateLabel?.text = GEDirectionViewController.dateFormatter.string(from: direction.date as Date)
    }

}
