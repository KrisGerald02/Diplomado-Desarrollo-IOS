//
//  AddProductController.swift
//
//  Created by Geraldine on 30/10/24.
//

import Foundation

final class AddProductController {
    private let apiDataSource = APIDataSource()
    
    func createProduct(_ product: ProductModel) async -> Bool {
        await apiDataSource.createProduct(product)
    }
}
