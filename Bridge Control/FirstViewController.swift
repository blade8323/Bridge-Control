//
//  FirstViewController.swift
//  Bridge Control
//
//  Created by Admin on 07.08.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var officerlabel: UILabel!
    @IBOutlet var authorizationCodeLabel: UILabel!
    @IBOutlet var rankLabel: UILabel!
    @IBOutlet var warpDriveLabel: UILabel!
    @IBOutlet var warpFactorLabel: UILabel!
    @IBOutlet var fovoriteTeaLabel: UILabel!
    @IBOutlet var fovoriteCaptainLabel: UILabel!
    @IBOutlet var fovoriteGadgetLabel: UILabel!
    @IBOutlet var fovoriteAlienLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillEnterForeground(notification:)), name: UIApplication.willEnterForegroundNotification, object: app)
        
        refreshFields()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    
    func refreshFields() {
        let defaaults = UserDefaults.standard
        officerlabel.text = defaaults.string(forKey: officerKey)
        authorizationCodeLabel.text = defaaults.string(forKey: authorizationCodeKey)
        rankLabel.text = defaaults.string(forKey: rankKey)
        warpDriveLabel.text = defaaults.bool(forKey: warpDriveKey) ? "Engaged" : "Disabled"
        warpFactorLabel.text = String(defaaults.integer(forKey: warpFactorKey))
        fovoriteTeaLabel.text = defaaults.string(forKey: favoriteTeaKey)
        fovoriteCaptainLabel.text = defaaults.string(forKey: favoriteCaptainKey)
        fovoriteGadgetLabel.text = defaaults.string(forKey: favoriteGadgetKey)
        fovoriteAlienLabel.text = defaaults.string(forKey: favoriteAlienKey)
    }
    
    @objc func applicationWillEnterForeground(notification: NSNotification) {
        let defaaults = UserDefaults.standard
        defaaults.synchronize()
        refreshFields()
    }
    
}

