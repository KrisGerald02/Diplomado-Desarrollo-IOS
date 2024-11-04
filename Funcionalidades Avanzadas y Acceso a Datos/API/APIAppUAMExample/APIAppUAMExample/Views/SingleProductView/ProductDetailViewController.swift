//
//  ProductDetailViewController.swift
//
//  Created by Geraldine on 30/10/24.
//
import UIKit

class ProductDetailViewController: UIViewController {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    
    var productId: Int?
        private let apiDataSource = APIDataSource()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Product Details"
            loadProductDetails()
        }
        
        private func loadProductDetails() {
            guard let productId = productId else { return }
            
            Task {
                if let product = await apiDataSource.getProductById(productId) {
                    titleLabel.text = product.title
                    descriptionLabel.text = product.description
                    priceLabel.text = "$\(product.price)"
                    categoryLabel.text = product.category
                    brandLabel.text = product.brand
                    discountLabel.text = "\(product.discountPercentage ?? 0)% off"
                    productImageView.image = await apiDataSource.loadImage(url: product.thumbnail)
                }
            }
        }
        
        
}
