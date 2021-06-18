//
//  QueueListViewController.swift
//  MusicChallenge
//
//  Created by Nicolas Godoy on 18/06/21.
//

import UIKit

class QueueListViewController: UIViewController {

    @IBAction func closeButton(_ sender: UIButton) {
        navigationController?.dismiss(animated: true)
    }
    
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
