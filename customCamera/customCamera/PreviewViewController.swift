//
//  PreviewViewController.swift
//  customCamera
//
//  Created by mac on 5/22/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    var image:UIImage!

    @IBAction func saveButton(_ sender: Any) {
    }
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = self.image

        // Do any additional setup after loading the view.
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
