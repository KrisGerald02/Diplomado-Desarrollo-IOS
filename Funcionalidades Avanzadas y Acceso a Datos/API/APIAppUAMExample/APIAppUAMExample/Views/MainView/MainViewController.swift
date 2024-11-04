//
//  MainViewController.swift
//
//  Created by Geraldine on 30/10/24.
//

import UIKit

enum Section  {
    case main
}

class MainViewController: UIViewController {
    
    typealias DataSource = UITableViewDiffableDataSource<Section, ProductModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, ProductModel>
    
    private let mainController = MainController()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search products"
        searchController.searchResultsUpdater = self
        
        return searchController
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    private var products = [ProductModel]()
    
    private lazy var dataSource: DataSource = {
        let dataSource = DataSource(tableView: tableView) { [weak self] tableView, indexPath, productModel in
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell
            cell?.titleProductLabel.text = productModel.title
            cell?.priceProductLabel.text = "$\(productModel.price)"
            
            Task {
                cell?.imageProductView.image = await self?.mainController.loadImage(url: productModel.thumbnail)
            }
            
            return cell
        }
        
        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Products"
        
        searchControllerConfiguration()
        configureButtons()
        registerCell()
        configureLogoutButton()
        
        tableView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    private func loadData() {
        Task {
            products = await mainController.getProducts() ?? []
            applySnapshot()
        }
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
    }
    
    private func configureButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addProduct))
    }
    
    @objc func addProduct() {
        performSegue(withIdentifier: "goToAddProduct", sender: self)
    }
    
    private func searchControllerConfiguration() {
        navigationItem.searchController = searchController
    }
    
    func applySnapshot() {
        var snapshot = Snapshot()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(products)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    private func configureLogoutButton() {
        navigationItem.leftBarButtonItem = nil
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        navigationItem.leftBarButtonItem = logoutButton
    }

    @objc func logoutTapped() {
        removeUserSession()
        
        navigationController?.popToRootViewController(animated: true)
    }
    private func removeUserSession() {
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.synchronize()
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else { return }
        
        Task {
            products = await mainController.getProducts(query: query) ?? []
            applySnapshot()
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let detailAction = UIContextualAction(style: .normal, title: "Detalle") { (action, view, completionHandler) in
            let product = self.products[indexPath.row]
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let productDetailVC = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController {
                productDetailVC.productId = product.id
                self.navigationController?.pushViewController(productDetailVC, animated: true)
            }
            completionHandler(true)
        }
        detailAction.backgroundColor = .systemBlue
        detailAction.image = UIImage(systemName: "info.circle")
        let configuration = UISwipeActionsConfiguration(actions: [detailAction])
        return configuration
    }
}

