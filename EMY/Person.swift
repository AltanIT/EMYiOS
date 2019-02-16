//
//  Personas.swift
//  EMY
//
//  Created by Carlos Arturo Pimentel on 2/14/19.
//  Copyright © 2019 EMY. All rights reserved.
//

import UIKit



class Person:Codable {
    let Alias:String
    let RutaImagen:String
    
    
    init(Alias:String, RutaImagen:String) {
        self.Alias = Alias
        self.RutaImagen = RutaImagen
        
    
    }
}
