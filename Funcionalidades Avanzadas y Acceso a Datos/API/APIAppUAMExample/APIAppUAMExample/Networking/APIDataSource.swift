//
//  APIDataSource.swift
//
//  Created by Geraldine on 30/10/24.
//

import UIKit

final class APIDataSource {
    private let host = "https://dummyjson.com"
    
    func logIn(username: String, password: String) async -> LoginResponse? {
        guard let url = URL(string: "\(host)/auth/login") else { return nil }
        
        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let loginData = [
                "username": username,
                "password": password,
            ]
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: loginData, options: [])
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return nil }
            
            let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
            
            saveToken(loginResponse.accessToken)
            
            return loginResponse
            
        } catch {
            return nil
        }
    }
    
    func getProducts(query: String) async -> [ProductModel]? {
        var urlComponents = URLComponents(string: "\(host)/auth/products/search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "q", value: query)
        ]
        
        guard let url = urlComponents?.url, let token = getToken() else { return nil }
        
        var urlrequest = URLRequest(url: url)
        urlrequest.httpMethod = "GET"
        urlrequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlrequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlrequest)
            
            guard
                let urlResponse = response as? HTTPURLResponse,
                urlResponse.statusCode == 200
            else { return nil }
            
            let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
            
            return productResponse.products
            
        } catch {
            return nil
        }
    }
    
    func loadImage(url: String) async -> UIImage? {
        guard let url = URL(string: url) else { return nil }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard
                let urlResponse = response as? HTTPURLResponse,
                urlResponse.statusCode == 200
            else { return nil }
            
            let image = UIImage(data: data)
            
            return image
        } catch {
            return nil
        }
    }
    
    func createProduct(_ product: ProductModel) async -> Bool {
        guard let url = URL(string: "\(host)/auth/products/add"),
              let token = getToken()
        else { return false}
        
        do {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            urlRequest.httpBody = try JSONEncoder().encode(product)
            
            let (_, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let urlResponse = response as? HTTPURLResponse,
                  urlResponse.statusCode == 201
            else { return false }
            
            return true
        } catch {
            return false
        }
    }
    
    func getProductById(_ id: Int) async -> ProductModel? {
        guard let url = URL(string: "\(host)/products/\(id)"), let token = getToken() else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let urlResponse = response as? HTTPURLResponse, urlResponse.statusCode == 200 else { return nil }
            return try JSONDecoder().decode(ProductModel.self, from: data)
        } catch {
            return nil
        }
    }
    
    private func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "token")
    }
    
    private func getToken() -> String? {
        UserDefaults.standard.string(forKey: "token")
    }
    private func deleteToken() {
        UserDefaults.standard.removeObject(forKey: "token")
    }
    
}
