//
//  MainController.swift
//
//  Created by Geraldine on 30/10/24.
//

import UIKit

final class MainController {
    private let apiDataSource = APIDataSource()
    
    func getProducts(query: String = "") async -> [ProductModel]? {
        await apiDataSource.getProducts(query: query)
    }
    
    func loadImage(url: String) async -> UIImage? {
        await apiDataSource.loadImage(url: url)
    }
}
