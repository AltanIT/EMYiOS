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
    
    
}



class ListaPersonasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var respuesta = ""
    
    var people: [String] = []


  
    var c = 0;


    
    @IBOutlet weak var tabla: UITableView!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabla.dataSource = self
        tabla.delegate = self
        

        let url = "https://emy.mx/ios/Jsontodo.php"
        let urlObj = URL(string: url)
        
        
        
         URLSession.shared.dataTask(with: urlObj!){(data, error, response) in
            do{
            var personas = try JSONDecoder().decode([Personas].self, from: data!)
            
                UserDefaults.standard.set(personas.count, forKey: "contador")
                
                
           self.people.append("Ho")
                
                
                
              
            
            }catch{
                print("error")
            }
            
            

            
            
            }.resume()

        self.c = UserDefaults.standard.integer(forKey: "contador")
        
        

        
  

    }
    
    

 

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.c  //Cuantos elementos contendra la tabla

    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    print(self.people)

        let celda = UITableViewCell()

        celda.textLabel?.text = "Hola"
        
        return celda
    }
    
}
