import Foundation
import UIKit

class WelcomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var welcomeImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    

    // Array de nombres de imágenes del sistema
    let systemImages = [
        "star", "bell", "bolt.circle", "heart", "leaf",
        "flame", "snow", "cloud.rain", "sun.max", "moon.stars",
        "airplane", "car", "bicycle", "tram", "train.side.front.car",
        "bus", "globe", "pawprint", "hammer", "scissors"
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Welcome"
        tableView.accessibilityIdentifier = "WelcomeTableViewCell"
        welcomeImage.accessibilityIdentifier = "welcomeImage"

        tableView.dataSource = self
        tableView.delegate = self
         
        
       

        
        // Registrar la celda personalizada
        registerCell()
    }
    
    func registerCell() {
        
        tableView.register(UINib(nibName: "WelcomeTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }

    // Método para definir el número de filas en la sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return systemImages.count
    }
    
    // Método para configurar y devolver la celda en cada índice
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WelcomeTableViewCell
        
        // Asignar la imagen del sistema correspondiente
        let imageName = systemImages[indexPath.row]
        cell.imageView?.image = UIImage(systemName: imageName)
        
        return cell
    }
}
