//
//  RegistroViewController.swift
//  EMY
//
//  Created by Carlos Arturo Pimentel on 1/24/19.
//  Copyright © 2019 EMY. All rights reserved.
//

import UIKit

class RegistroViewController: UIViewController {

    @IBOutlet weak var texto: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func btnLog(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func guardar(_ sender: Any) {
        performSegue(withIdentifier: "enviar", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviar" {
            let destino = segue.destination as! GuardarViewController
            destino.recibirTexto = texto.text
        }
        
    }
}
