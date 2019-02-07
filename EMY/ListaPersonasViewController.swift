//
//  ListaPersonasViewController.swift
//  EMY
//
//  Created by Carlos Arturo Pimentel on 2/6/19.
//  Copyright © 2019 EMY. All rights reserved.
//

import UIKit

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
                    
                    let json = try JSONSerialization.jsonObject(with: datos!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:Any]
                    
               
                    let llaveJson = json["Persona"] as! [String:Any]
                    let alias = llaveJson["Alias"] as! String
                    
                    
                    //var AliasArreglo = [String]()
                    for i in alias{
                        print(i)
                    }
               
                    
                }catch{
                    print("error")
                }
            }
            
            
        }
        
        tarea.resume()


    }
    

  

}
