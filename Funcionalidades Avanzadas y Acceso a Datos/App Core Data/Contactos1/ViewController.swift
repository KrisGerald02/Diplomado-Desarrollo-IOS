//
//  ViewController.swift
//  Contactos1
//
//  Created by Geraldine on 12/1/24.
//
import UIKit
import CoreData

class ViewController: UIViewController, UISearchBarDelegate {
    
    var contactos = [Contacto]()
    var contactosFiltrados = [Contacto]()
    var buscando = false
    @IBOutlet weak var TablaContactos: UITableView!
    @IBOutlet weak var barraBusqueda: UISearchBar!
    @IBOutlet weak var tituloLabel: UILabel!
    func conexion() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        barraBusqueda.delegate = self
        cargarInfoCoreData()
        
        print(contactos)
        TablaContactos.delegate = self
        TablaContactos.dataSource = self
    }

    @IBAction func agregarContactos(_ sender: Any) {
        let alert = UIAlertController(title: "Add Contact", message: "New Contact", preferredStyle: .alert)
        
        alert.addTextField { (nombreAlert) in
            nombreAlert.placeholder = "Name"
        }
        alert.addTextField { (telefonoAlert) in
            telefonoAlert.placeholder = "Number"
            telefonoAlert.keyboardType = .numberPad
        }
        alert.addTextField { (direccionAlert) in
            direccionAlert.placeholder = "Adress"
        }
        let actionAceptar = UIAlertAction(title: "Acept", style: .default) { (_) in
            guard let nombreAlert = alert.textFields?[0].text,
                  let telefonoAlert = alert.textFields?[1].text,
                  let direccionAlert = alert.textFields?[2].text else { return }
            
            guard !nombreAlert.isEmpty, !telefonoAlert.isEmpty, !direccionAlert.isEmpty else {
                print("All fields are required")
                return
            }
            let contexto = self.conexion()
            let entidadContacto = NSEntityDescription.insertNewObject(forEntityName: "Contacto", into: contexto) as! Contacto
            
            entidadContacto.nombre = nombreAlert
            entidadContacto.telefono = Int64(telefonoAlert) ?? 0
            entidadContacto.direccion = direccionAlert
            
            do {
                try contexto.save()
                print("Contact Saved")
                self.cargarInfoCoreData()
                self.TablaContactos.reloadData()
            } catch let error as NSError {
                print("Error: \(error.localizedDescription)")
            }
        }
        
        let actionCancelar = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actionAceptar)
        alert.addAction(actionCancelar)
        present(alert, animated: true, completion: nil)
    }
    
    func cargarInfoCoreData() {
        let contexto = conexion()
        
        let fetchRequest: NSFetchRequest<Contacto> = Contacto.fetchRequest()
        do {
            contactos = try contexto.fetch(fetchRequest)
            contactosFiltrados = contactos
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
    }
    func eliminarContacto(at indexPath: IndexPath) {
        let contexto = conexion()
        let contactoAEliminar = contactosFiltrados[indexPath.row]
        contexto.delete(contactoAEliminar)
        
        do {
            try contexto.save()
            print("Contact Erased")
            if let index = contactos.firstIndex(of: contactoAEliminar) {
                contactos.remove(at: index)
            }
            contactosFiltrados.remove(at: indexPath.row)
            
            TablaContactos.deleteRows(at: [indexPath], with: .automatic)
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            contactosFiltrados = contactos
        } else {
            contactosFiltrados = contactos.filter { contacto in
                contacto.nombre?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
        TablaContactos.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        contactosFiltrados = contactos
        TablaContactos.reloadData()
        searchBar.resignFirstResponder()
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactosFiltrados.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let contacto = contactosFiltrados[indexPath.row]
        
        celda.textLabel?.text = contacto.nombre
        celda.detailTextLabel?.text = String(contacto.telefono)
        
        return celda
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let contactoSeleccionado = contactosFiltrados[indexPath.row]
        print("Contact Selected: \(contactoSeleccionado.nombre ?? "Without Name")")
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            eliminarContacto(at: indexPath)
        }
    }
}
