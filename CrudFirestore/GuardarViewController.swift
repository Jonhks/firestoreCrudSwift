//
//  GuardarViewController.swift
//  CrudFirestore
//
//  Created by Jonh Parra on 10/12/19.
//  Copyright © 2019 Jonh Parra. All rights reserved.
//

import UIKit
import FirebaseFirestore

class GuardarViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  

    @IBOutlet weak var titulo: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    let generos = ["Acción", "Aventuras", "ciencia Ficcion", "Terror", "Drama"]
    var genero = ""
    let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
  
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return generos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return generos[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genero = generos[row]
    }
      
    @IBAction func guardar(_ sender: UIButton) {
        let campos: [String: Any] = [
            "titulo": titulo.text ?? "Sin titulo",
            "genero": genero
        ]
        db.collection("peliculas").addDocument(data: campos) { (error) in
            if let error = error{
                print("Fallo al guardar", error.localizedDescription)
            } else {
                print("Guardado correctamente")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
 
}
