//
//  firstScreenController.swift
//  pragramaticview
//
//  Created by mac on 5/23/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class firstScreenController: UIViewController {
    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setNextButton()

        // Do any additional setup after loading the view.
    }
    
    func setNextButton(){
        nextButton.backgroundColor = .white
        nextButton.setTitleColor(.red, for: .normal)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(onNextButtonPress), for: .touchUpInside)
        
        view.addSubview(nextButton)
        setNextButtonContraints()
    }

    @objc func onNextButtonPress (){
        let secondScreen = secondScreenController()
        
        secondScreen.title = "Details ♥️"
        navigationController?.pushViewController(secondScreen, animated: true)
    }
    
    func setNextButtonContraints (){
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50)
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
