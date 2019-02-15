//
//  ListaPersonasViewController.swift
//  EMY
//
//  Created by Carlos Arturo Pimentel on 2/6/19.
//  Copyright © 2019 EMY. All rights reserved.
//

import UIKit




class ListaPersonasViewController: UIViewController, UITableViewDataSource{
   
    @IBOutlet weak var tabla: UITableView!
    
    final let url = URL(string: "https://emy.mx/ios/Jsontodo.php")
    private var PersonasArray = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarwebservice()
    }
    
    func cargarwebservice(){
        guard let downloadURL = url else {return}
        URLSession.shared.dataTask(with: downloadURL) { (data, response, error) in
            
            guard let data = data, error == nil, response != nil else {
                print("Error, revise su conexion")
                return
            }
            print("ok")
            
            do{
                let decoder = JSONDecoder()
                let person = try decoder.decode([Person].self, from: data)
                //print(person[0].Alias)
                self.PersonasArray = person
                DispatchQueue.main.async {

                self.tabla.reloadData()
                    
                }
                
                
            }catch{
                print("error")
            }

            }.resume()
        

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.PersonasArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellPersonas") as? PersonasCell else {return UITableViewCell()}
        
        cell.lblalias.text = PersonasArray[indexPath.row].Alias
        
        return cell
    }
}
