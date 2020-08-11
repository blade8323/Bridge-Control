//
//  SecondViewController.swift
//  Bridge Control
//
//  Created by Admin on 07.08.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var engineSwitch: UISwitch!
    @IBOutlet var warpFactorSlider: UISlider!
    
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

    @objc func applicationWillEnterForeground(notification: NSNotification) {
        let defaaults = UserDefaults.standard
        defaaults.synchronize()
        refreshFields()
    }
    
    func refreshFields() {
        let defaaults = UserDefaults.standard
        engineSwitch.isOn = defaaults.bool(forKey: warpDriveKey)
        warpFactorSlider.value = defaaults.float(forKey: warpFactorKey)
    }
    
    @IBAction func onEngineSwitchTapped(_ sender: UISwitch) {
        let defaaults = UserDefaults.standard
        defaaults.set(engineSwitch.isOn, forKey: warpDriveKey)
        defaaults.synchronize()
    }
    
    @IBAction func onWarpSliderDragged(_ sender: UISlider) {
        let defaaults = UserDefaults.standard
        defaaults.set(warpFactorSlider.value, forKey: warpFactorKey)
        defaaults.synchronize()
    }
    
    @IBAction func onSettingButtonTapped(_ sender: UIButton) {
        let application = UIApplication.shared
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        if application.canOpenURL(url) {
            application.open(url, options: [:], completionHandler: nil)
        }
    }
}

