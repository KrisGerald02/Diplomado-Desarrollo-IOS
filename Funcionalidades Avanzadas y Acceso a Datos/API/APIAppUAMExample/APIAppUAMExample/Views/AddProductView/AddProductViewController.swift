//
//  AddProductViewController.swift
//
//  Created by Geraldine on 30/10/24.
//

import UIKit

class AddProductViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var stockTextField: UITextField!
    @IBOutlet weak var discountTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    
    
    private let addProductController = AddProductController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Product"
    }
    
    @IBAction func onTapAddButton(_ sender: Any) {
        guard let title = titleTextField.text,
              let description = descriptionTextField.text,
              let price = priceTextField.text,
              let stock = stockTextField.text,
              let category = categoryTextField.text,
              let brand = brandTextField.text,
              let discount = discountTextField.text
               
        else { return }
        
        let product = ProductModel(
            id: nil,
            title: title,
            description: description,
            price: Double(price) ?? 0,
            stock: Double(stock) ?? 0,
            thumbnail: "",
            category: "",
            brand: "",
            discountPercentage: Double(discount) ?? 0
        )
        
        Task {
            let result = await addProductController.createProduct(product)
            
            if result {
                navigationController?.popViewController(animated: true)
            } else {
                let alert = UIAlertController(title: "Creation product failure", message: "There was an error on the product.", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(action)
                
                present(alert, animated: true)
            }
        }
    }
}
