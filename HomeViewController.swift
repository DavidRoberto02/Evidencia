//
//  HomeViewController.swift
//  Evidencia1
//
//  Created by David Saucedo on 14/04/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var ContactosButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
        
    @IBAction func ContactosAccion(_ sender: Any) {
        let vc =  self.storyboard?.instantiateViewController(withIdentifier: "ContactosTableView") as! ContactosTableView //App crashes here
                self.present(vc, animated: false, completion: nil)
    
    }
    
}
