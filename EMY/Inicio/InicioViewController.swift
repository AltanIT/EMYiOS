//
//  InicioViewController.swift
//  EMY
//
//  Created by Carlos Arturo Pimentel on 1/24/19.
//  Copyright © 2019 EMY. All rights reserved.
//

import UIKit
import SDWebImage



class InicioViewController: UIViewController {
    
    @IBOutlet weak var txtAlias: UILabel!
    @IBOutlet weak var Portada: UIImageView!
    @IBOutlet weak var imgPerfil: UIImageView!
    
    @IBOutlet weak var txtCorreo: UILabel!
    @IBOutlet weak var txtNumero: UILabel!
    
    
    var persona = Persona()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        

            txtAlias.text = "Cargando"
            txtCorreo.text = "Cargando"
            txtNumero.text = "Cargando"
        
        
        // Do any additional setup after loading the view.
        let Usuario = UserDefaults.standard.string(forKey: "Usuario")
        
        let webservice = "http://35.196.214.220/ios/MiPerfil.php?correo=\(Usuario!)"
        let objetoUrl =    URL(string: webservice)
        
        let tarea = URLSession.shared.dataTask(with: objetoUrl!){
            datos,respuesta,error in
            
            if error != nil{
                print("Error de conexion")

            }else{
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: datos!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:Any]
                    
                  //print(json)
                    DispatchQueue.main.async {
                        //Habilitar tarea asincrona para optimizar carga

                    
                    //Recorrer las llaves del JSON hasta llegar a los valores que necesitamos
                    let llaveJson = json["Persona"] as! [String:Any]
                    //print(llaveJson)
                    let StringAlias = llaveJson["Alias"] as! String
                    let StringPortada = llaveJson["FotoPortada"] as! String
                    let StringPerfil = llaveJson["FotoPerfil"] as! String
                    
                    let StringEmail = llaveJson["Email"] as! String
                    let StringMovil = llaveJson["Movil"] as! String
                        
                        
                        self.mostrarPerfil(alias: StringAlias, portada: StringPortada, perfil: StringPerfil, email: StringEmail, movil: StringMovil )
                    }
                   
                  
                    
                }catch{
                    print("error")
                }
            }

        }
        
        tarea.resume()

    }
    
    func mostrarPerfil(alias:String, portada:String, perfil:String, email: String, movil:String){
        self.txtAlias.text = alias
        
        DispatchQueue.main.async {
            self.imgPerfil.sd_setImage(with: URL(string: "http://35.196.214.220/emy/"+perfil), placeholderImage: UIImage(named: "placeholder.png"))
            
            self.imgPerfil.layer.borderWidth = 1
            self.imgPerfil.layer.masksToBounds = false
            self.imgPerfil.layer.borderColor = UIColor.white.cgColor
            self.imgPerfil.layer.cornerRadius = self.imgPerfil.frame.height/2
            self.imgPerfil.clipsToBounds = true
            
            self.Portada.sd_setImage(with: URL(string: "http://35.196.214.220/emy/"+portada), placeholderImage: UIImage(named: "placeholder.png"))
            
            print(portada)
            
            
            
            self.txtAlias.text = alias
            self.txtCorreo.text = email
            self.txtNumero.text = movil
        }

        
    }
    

    @IBAction func btnAtras(_ sender: Any) {
        //self.dismiss(animated: true, completion:  nil)
    }
    
}
