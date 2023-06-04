//
//  ViewController.swift
//  MassengerApp
//
//  Created by J  on 03/06/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClick(_ sender: Any) {
        let stroyBoard = UIStoryboard(name: "LoginOptionTypeViewController", bundle: nil)
        guard let navigation = stroyBoard.instantiateViewController(withIdentifier: "LoginOptionTypeViewController") as? LoginOptionTypeViewController else { return }
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}

