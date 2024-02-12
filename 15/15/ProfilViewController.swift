//
//  ProfilViewController.swift
//  15
//
//  Created by Albert Hansson on 2021-10-06.
//

import UIKit

class ProfilViewController: UIViewController {

    
    lazy var profil = storyboard?.instantiateViewController(identifier: "profil") as! ProfilViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
