//
//  HomeViewController.swift
//  MassengerApp
//
//  Created by J  on 04/06/23.
//

import UIKit

class HomeViewController: UIViewController, Instantiable {

    static var storyboardName: StringConvertible {
        StoryboardName.homeScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green

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
