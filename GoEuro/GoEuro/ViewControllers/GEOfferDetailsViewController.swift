//
//  GEOfferDetailsViewController.swift
//  GoEuro
//
//  Created by Dmitry Osipa on 7/31/17.
//  Copyright © 2017 Dmitry Osipa. All rights reserved.
//

import UIKit

class GEOfferDetailsViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView.layer.cornerRadius = 8.0
    }

    @IBAction func tapAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
