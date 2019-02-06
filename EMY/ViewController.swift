//
//  ViewController.swift
//  EMY
//
//  Created by Carlos Arturo Pimentel on 21/01/19.
//  Copyright © 2019 EMY. All rights reserved.
//

import UIKit
var mensaje = ""


class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsuario: UITextField!
    
    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    //Boton Iniciar Sesiòn
    @IBAction func btnIniciar(_ sender: Any) {
        
        if(txtUsuario.text==""||txtPass.text==""){
            
            let alerta = UIAlertController(title: "EMY", message: "Completa los datos de sesiòn", preferredStyle: .alert)
            
            let accion = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
            
        }else{
            cargarwebservice()

        }
        
    }
    
    //Boton Registro
    @IBAction func btnRegistro(_ sender: Any) {
        
        
    }
    
    //Metodo para esconder el teclado cuendo se presione en otro lado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func cargarwebservice(){
        
        
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://35.196.214.220/ios/Login.php?correo=\(txtUsuario.text!)&contrasena=\(txtPass.text!)")! as URL)
        request.httpMethod = "GET"
    
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {
            data, response, error in
            
            if error != nil
            {
                print("error=\(String(describing: error))")
            }
           
            print(String(describing: response))
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            let respuesta = responseString!
            
    
          print(respuesta)
            mensaje = respuesta as String
                
            
            
            
            if(respuesta==""||respuesta=="Ok"){

                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "login", sender: nil)
                    
                    //Guardar usuario en preferencias
                    UserDefaults.standard.set(self.txtUsuario.text, forKey: "Usuario")
                    
                }
                    
                
            }else{
           self.mostrarmensaje()
            }



            
            
        }
        task.resume()
      
        
    
}
    
    
    func mostrarmensaje(){
       DispatchQueue.main.async {
        
        let alerta = UIAlertController(title: "EMY", message: mensaje, preferredStyle: .alert)
        
        let accion = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alerta.addAction(accion)
        self.present(alerta, animated: true, completion: nil)
        
        }
    }

}

