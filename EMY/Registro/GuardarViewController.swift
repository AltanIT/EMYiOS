//
//  GuardarViewController.swift
//  EMY
//
//  Created by Carlos Arturo Pimentel on 1/24/19.
//  Copyright © 2019 EMY. All rights reserved.
//

import UIKit

class GuardarViewController: UIViewController {

    @IBOutlet weak var resultado: UILabel!
    
    var recibirTexto:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultado.text = recibirTexto
        
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
