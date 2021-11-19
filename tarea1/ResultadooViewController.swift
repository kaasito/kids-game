//
//  ResultadooViewController.swift
//  tarea1
//
//  Created by Lucas Romero Magaña on 19/11/21.
//

import UIKit

class ResultadooViewController: UIViewController {
    
    

    
    @IBOutlet weak var puntuacion: UILabel!
    var puntos:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        puntuacion.text =  "\(puntos)"
    }
    
    @IBAction func VOLVER(_ sender: Any) {
        performSegue(withIdentifier: "volver", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
