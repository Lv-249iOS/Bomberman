//
//  SettingsController.swift
//  BomberMan
//
//  Created by Kristina Del Rio Albrechet on 9/22/17.
//  Copyright © 2017 Lv-249 iOS. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    let settingModel = SettingsModel.shared
    var currentPage: Int?
    
    @IBOutlet weak var chooseHero: UIScrollView!
    @IBOutlet weak var choosePlayMode: UIPickerView!
    
    @IBOutlet weak var controlModeLabel: UILabel!
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choosePlayMode.delegate = self
        choosePlayMode.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fillchoosingHeroView()
        setContentOffsetForImageScroll(with: view.frame.width)
        if let row = settingModel.pickerModeArray.index(of: settingModel.currentMode) {
            choosePlayMode.selectRow(row, inComponent: 0, animated: true)
        }
    }
    
    func fillchoosingHeroView() {
        //print(choosingPlayMode.subviews.count)
        for i in 0 ..< settingModel.gameModeArray.count {
            let rect = CGRect(x: view.bounds.width * CGFloat(i),
                              y: 0,
                              width: view.bounds.width,
                              height: chooseHero.bounds.height)
            
            let imageView = UIImageView(frame: rect)
            imageView.contentMode = .center
            imageView.clipsToBounds = true
            
            imageView.image = settingModel.gameModeArray[i]
            
            chooseHero.contentSize.width = view.bounds.width * CGFloat(i + 1)
            chooseHero.addSubview(imageView)
            
        }
    }
    func setContentOffsetForImageScroll(with width: CGFloat) {
        let pointOffset = CGPoint(x: width * CGFloat(currentPage ?? settingModel.currentPage), y: 0)
        chooseHero.setContentOffset(pointOffset, animated: true)
    }
}

extension SettingsController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingModel.pickerModeArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        settingModel.currentMode = settingModel.pickerModeArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return settingModel.pickerModeArray[row]
    }
}


