//
//  RegistroViewController.swift
//  EMY
//  Created by Carlos Arturo Pimentel on 1/24/19.
//  Copyright © 2019 EMY. All rights reserved.

import UIKit

class RegistroViewController: UIViewController {

    override func viewDidLoad(){
        super.viewDidLoad()
        
        createDatePicker()
    
    }
     //Recoger los datos ingresados
    @IBOutlet weak var nombreText: UITextField!
    
    @IBOutlet weak var ApellidoPText: UITextField!
    
    @IBOutlet weak var ApellidoMText: UITextField!
    
    // Inicia funcion de conexion
 
    
    
    
        
    //Señor Don boton de registrar
    
    @IBAction func Guardar(_ sender: UIButton) {
   
        
        
     
    }
    
    
    //Empieza el Calendario
    @IBOutlet weak var DatePickerTF: UITextField!
    let datePicker = UIDatePicker()
    
   
    func createDatePicker(){
        
        datePicker.datePickerMode = .date
        
        //asigna el dato en nuestro textfield
        DatePickerTF.inputView = datePicker
        
        //create a toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //Agrega un boton en este toolbar
        let doneButton = UIBarButtonItem(barButtonSystemItem:.done, target: nil, action: #selector (doneClicked))
        
        toolbar.setItems([doneButton], animated: true)
        
        DatePickerTF.inputAccessoryView = toolbar
        
    }
    
    @objc func doneClicked(){
        //formato de fecha en textfield
        
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .none
        
        DatePickerTF.text = "\(datePicker.date)"
        self.view.endEditing(true)
        
        
    }     //Ternima calendario
    
    
    @IBOutlet weak var texto: UITextField!
    

    
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
