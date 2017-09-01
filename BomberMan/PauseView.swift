//
//  PauseView.swift
//  BomberMan
//
//  Created by Alejandro Del Rio Albrechet on 9/1/17.
//  Copyright © 2017 Lv-249 iOS. All rights reserved.
//

import UIKit

class PauseView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var pauseButton: UIButton!
    
    var onPauseButtTap: (()->())?
    
    @IBAction func onPauseTap(_ sender: UIButton) {
        onPauseButtTap?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("PauseView", owner: self, options: nil)
        tintColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.5)
        pauseButton.setImage(#imageLiteral(resourceName: "pause ").withRenderingMode(.alwaysTemplate), for: .normal)

        
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}