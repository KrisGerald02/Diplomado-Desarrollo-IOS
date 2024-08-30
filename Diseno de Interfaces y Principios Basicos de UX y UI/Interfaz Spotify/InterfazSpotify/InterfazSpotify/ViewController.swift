//
//  ViewController.swift
//  InterfazSpotify
//
//  Created by Kristel Geraldine Villalta Porras on 30/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    //Declarando Variables para el contador
    var musicCounter = 0
    var peopleCounter = 0
    var heartCounter = 0

    //Referenciando Iconos para contador
    @IBOutlet weak var musicButton: UIImageView!
    @IBOutlet weak var peopleButton: UIImageView!
    @IBOutlet weak var heartButton: UIImageView!
    //Label de persona
    @IBOutlet weak var labelperson: UILabel!
    
    
    @IBOutlet weak var labelmusic: UILabel!
    //Mi cuarto imagen en circulo
    @IBOutlet weak var FourImageView: UIImageView!
    //Mi tercer imagen en circulo
    @IBOutlet weak var ThreeImageView: UIImageView!
    //Mi segunda imagen en circulo
    @IBOutlet weak var SecondImageView: UIImageView!
    // Mi primer imagen en circulo
    @IBOutlet weak var FirstImageView: UIImageView!
    
    //Referenciando el borde
    @IBOutlet weak var MyFirstBorder: UIView!
    
    //Forma Bisel Rectangular
    @IBOutlet weak var MyFirstImageMusic: UIView!
    
    @IBOutlet weak var hearthlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //Codigo para hacer mi primera vista redonda
        FirstImageView.layer.cornerRadius = FirstImageView.frame.size.width / 2
        //Codigo para hacer mi segunda vista redonda
        SecondImageView.layer.cornerRadius = SecondImageView.frame.size.width / 2
        //Codigo para hacer mi tercer vista redonda
        ThreeImageView.layer.cornerRadius = ThreeImageView.frame.size.width / 2
        //Codigo para hacer mi cuarta vista redonda
        FourImageView.layer.cornerRadius = FourImageView.frame.size.width / 2
        MyFirstImageMusic.layer.cornerRadius = 10
        //Mi primer border
        //Color de borde
        MyFirstBorder.layer.borderColor = UIColor.black.cgColor
        //Forma de circulo
        MyFirstBorder.layer.cornerRadius = MyFirstBorder.frame.size.width / 2
        //Grosor del borde
        MyFirstBorder.layer.borderWidth = 0.10
        labelperson.text = "0"
        labelmusic.text = "0"
        hearthlabel.text = "0"
    }
    // Acciones para incrementar los contadores
        
    @IBAction func musicbotton(_ sender: Any) {
        
        musicCounter = musicCounter + 1
        labelmusic.text = "\(musicCounter)"
        print("Music Counter: \(musicCounter)")
        // Actualiza la interfaz de usuario si es necesario
        
    }
        
    @IBAction func increasePeopleCounter(_ sender: Any) {
        
        peopleCounter += 1
        labelperson.text = "\(peopleCounter)"
        print("peopleCounter: \(peopleCounter)")
        // Actualiza la interfaz de usuario si es necesario
    }
 
         
    @IBAction func hearthbutton(_ sender: Any) {
        
        heartCounter += 1
        hearthlabel.text = "\(heartCounter)"
        print("Heart Counter: \(heartCounter)")
        // Actualiza la interfaz de usuario si es necesario
    }
}

