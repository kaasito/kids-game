//
//  ViewController.swift
//  tarea1
//
//  Created by Lucas Romero Magaña on 15/10/21.
//

import UIKit

class ViewController: UIViewController {
    var puntuacionValor = 0
    let array1: [String] = ["🦆", "🦋", "🦥", "🐈"]
    let array2: [String] = ["🗿", "🔮", "👺", "👻"]
    let array3: [String] = ["🦖", "🍙", "💿", "💩"]
    let array4: [String] = ["💖", "💘", "💝", "💗"]
    let array5: [String] = ["☦️", "♍️", "🕎", "♊️"]
    let array6: [String] = ["🔞", "‼️", "🚯", "⁉️"]
    let array7: [String] = ["✅", "🈯️", "✳️", "❎"]
    let array8: [String] = ["🛂", "🛃", "🈳", "🅿️"]
    let array9: [String] = ["🔼", "🔽", "◀️", "▶️"]
    let array10: [String] = ["🔴", "🟡", "🟤", "🟢"]

    
    
    @IBOutlet weak var puntuacion: UILabel!
    @IBOutlet weak var cuadrado: UIButton!
    @IBOutlet weak var emojirandom: UILabel!
    @IBOutlet weak var estrella: UIButton!
    @IBOutlet weak var circulo: UIButton!
    @IBOutlet weak var triangulo: UIButton!
    @IBOutlet weak var timer: UILabel!
    var tiempo = 6
    var timerr = Timer()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        timerr = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        let arrayDeArrays: [Array<String>] = [array1, array2, array3, array4, array5, array6, array7, array8, array9, array10]
        let randomArray = arrayDeArrays.randomElement()
        let arrayDesOrdenado = randomArray?.shuffled()
        let randomElement = arrayDesOrdenado?.randomElement()
       //Ponemos los emjois random al iniciarse
        cuadrado.setTitle(String((arrayDesOrdenado?[0])!), for: .normal)
        estrella.setTitle(String((arrayDesOrdenado?[1])!), for: .normal)
        circulo.setTitle(String((arrayDesOrdenado?[2])!), for: .normal)
        triangulo.setTitle(String((arrayDesOrdenado?[3])!), for: .normal)
        
        emojirandom.text = randomElement
        puntuacion.text = "Puntuacion \(puntuacionValor)"
    }
  
    
    @IBAction func cuadrado(_ sender: UIButton) {
        
        figura(figura: cuadrado.currentTitle)
    }
    @IBAction func estrella(_ sender: Any) {
        figura(figura: estrella.currentTitle)
    }
    @IBAction func circulo(_ sender: Any) {
        figura(figura: circulo.currentTitle)
    }
    @IBAction func triangulo(_ sender: Any) {
        figura(figura: triangulo.currentTitle)
    }
   
    
    
    
    func figura(figura: String?){
      
        if(emojirandom.text == figura ){
            colorFondo(colorFondo: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))
            reiniciarTiempoCorrecto()
            mostrarPuntuacionSumar()
            retrasar()
            nuevosEmojis()
        }else{
            colorFondo(colorFondo: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
            reiniciarTiempoFallo()
            motrarPuntuacionRestar()
            retrasar()
            nuevosEmojis()
        }
    }
    
    
    
    
    func reiniciarTiempoCorrecto(){
        tiempo = 3
    }
    func reiniciarTiempoFallo(){
        tiempo = 0
    }
    func mostrarPuntuacionSumar(){
        puntuacionValor += 100
        puntuacion.text = "Puntuacion \(puntuacionValor)"
    }
    func motrarPuntuacionRestar(){
        puntuacionValor -= 100
        puntuacion.text = "Puntuacion \(puntuacionValor)"
    }
    func retrasar(){
     
    }
    func colorFondo(colorFondo: UIColor){
        self.view.backgroundColor = colorFondo
    }
    func nuevosEmojisPrimeraVez(){
        let arrayDeArrays: [Array<String>] = [array1, array2, array3]
        let randomArray = arrayDeArrays.randomElement()
        
        let randomElement = randomArray?.randomElement()
       
        cuadrado.setTitle(String((randomArray?[0])!), for: .normal)
        estrella.setTitle(String((randomArray?[1])!), for: .normal)
        circulo.setTitle(String((randomArray?[2])!), for: .normal)
        triangulo.setTitle(String((randomArray?[3])!), for: .normal)
        emojirandom.text = randomElement
    }
    func nuevosEmojis(){
        let seconds = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        let arrayDeArrays: [Array<String>] = [array1, array2, array3, array4, array5, array6, array7, array8, array9, array10]
        let randomArray = arrayDeArrays.randomElement()
        let arrayDesOrdenado = randomArray?.shuffled()
        let randomElement = arrayDesOrdenado?.randomElement()
       
        cuadrado.setTitle(String((arrayDesOrdenado?[0])!), for: .normal)
        estrella.setTitle(String((arrayDesOrdenado?[1])!), for: .normal)
        circulo.setTitle(String((arrayDesOrdenado?[2])!), for: .normal)
        triangulo.setTitle(String((arrayDesOrdenado?[3])!), for: .normal)
        emojirandom.text = randomElement
      
    }
    @objc func fireTimer() {
        if tiempo > 0{
            tiempo-=1
            timer.text = "\(tiempo)"
        }else{
            timer.text = "\(tiempo)"
            timerr.invalidate()
        
            performSegue(withIdentifier: "asies", sender: self)
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as! ResultadooViewController
        
        destino.puntos = puntuacionValor
    }
       
       
    }
    



