//
//  MainView.swift
//  NicaDestinyApp
//
//  Created by Kristel Geraldine Villalta Porras on 3/9/24.
//

import UIKit

class MainView: UIView {

    @IBOutlet var contentView: UIView!  // Conectar a la vista principal en el XIB

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        // Cargar el archivo XIB
        Bundle.main.loadNibNamed("MainView", owner: self, options: nil)
        // Agregar la vista cargada como subvista
        addSubview(contentView)
        // Asegurar que la vista se ajuste al tamaño del contenedor
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

