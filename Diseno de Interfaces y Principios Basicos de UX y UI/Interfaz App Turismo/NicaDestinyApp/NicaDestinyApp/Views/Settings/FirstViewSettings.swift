import UIKit

class FirstViewSettings: UIViewController {

    @IBOutlet weak var HistoryTravelButton: UIButton!
    @IBOutlet weak var ChangeLanguageButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Boton Cl Action
        ChangeLanguageButton.addTarget(self, action: #selector(navigateToSecondViewSettings), for: .touchUpInside)

        // Boton History Travel Action
        HistoryTravelButton.addTarget(self, action: #selector(navigateToThreeViewSettings), for: .touchUpInside)
    }

    @objc func navigateToSecondViewSettings() {
        let secondViewController = SecondViewSettings()
        navigationController?.pushViewController(secondViewController, animated: true)
    }

    @objc func navigateToThreeViewSettings() {
        let threeViewController = ThreeViewSettings()
        navigationController?.pushViewController(threeViewController, animated: true)
    }
}

