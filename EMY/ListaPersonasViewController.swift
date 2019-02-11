//
//  ListaPersonasViewController.swift
//  EMY
//
//  Created by Carlos Arturo Pimentel on 2/6/19.
//  Copyright © 2019 EMY. All rights reserved.
//

import UIKit

struct Personas: Decodable{
    let Alias: String
    let ImagenPerfil: String
    
}

class ListaPersonasViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let webservice = "http://35.196.214.220/ios/Jsontodo.php"
        
        let objetoUrl =    URL(string: webservice)
        
        
        
    
        let tarea = URLSession.shared.dataTask(with: objetoUrl!){
            datos,respuesta,error in
            
            if error != nil{
                print("Error de conexion")
                
            }else{
            
                
                
               do{
                    

                    
                /*let personas = try JSONDecoder().decode([Personas].self, from: datos!)
                    

                 for person in personas{
                        print(person.Alias)
                    }*/
                
                DispatchQueue.main.async {
                    

                   print(respuesta)
                    /*let personas = json["Persona"] as! [String:Any]
                    print(personas)*/
                    
                    
                    
                }
               
                    
                }catch{
                    print("error")
                }
            }
            
            
        }
        
        tarea.resume()


    
        
    }

  

}
