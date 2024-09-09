import UIKit

class MainViewController: UIViewController {
    
    // Referenciando los Boton Inferior
    @IBOutlet weak var SettingsButton: UIButton!
    
    // Referenciando los Botones de Recomendados
    @IBOutlet weak var IslaAmorButton: UIButton!
    @IBOutlet weak var SalvadorAllendeButton: UIButton!
    
    // Referenciando los Views de Lugares Turisticos
    @IBOutlet weak var PlayaView: UIImageView!
    @IBOutlet weak var IslaAmorView: UIImageView!
    @IBOutlet weak var SalvadorAllendeView: UIImageView!
    @IBOutlet weak var LagunaView: UIImageView!
    @IBOutlet weak var VolcanesView: UIImageView!
    @IBOutlet weak var CatedralView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Forma de Bisel a los Views Turisticos
        VolcanesView.layer.cornerRadius = 10
        CatedralView.layer.cornerRadius = 10
        LagunaView.layer.cornerRadius = 10
        SalvadorAllendeView.layer.cornerRadius = 10
        IslaAmorView.layer.cornerRadius = 10
        PlayaView.layer.cornerRadius = 10
        
        SettingsButton.addTarget(self, action: #selector(navigateToSettings), for: .touchUpInside)
        
        SalvadorAllendeButton.addTarget(self, action: #selector(navigateToPuertoSalvadorAllendeView), for: .touchUpInside)
        
        IslaAmorButton.addTarget(self, action: #selector(navigateToIslaAmorView), for: .touchUpInside)
    }
    
    @objc func navigateToSettings() {
        let firstViewSettings = FirstViewSettings()
        navigationController?.pushViewController(firstViewSettings, animated: true)
    }
    
    @objc func navigateToPuertoSalvadorAllendeView() {
        let puertoSalvadorAllendeView = PuertoSalvadorAllendeView()
        navigationController?.pushViewController(puertoSalvadorAllendeView, animated: true)
    }
    
    @objc func navigateToIslaAmorView() {
        let islaAmorView = NicaDestinyApp.IslaAmorView()
        navigationController?.pushViewController(islaAmorView, animated: true)
    }
}

