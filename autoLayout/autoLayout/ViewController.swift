//
//  ViewController.swift
//  autoLayout
//
//  Created by mac on 5/23/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var backgroundImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
         setBackground()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setBackground(){
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.image?.resizingMode
        view.sendSubviewToBack(backgroundImageView)
        
        
        
    }


}

