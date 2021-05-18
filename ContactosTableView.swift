//
//  ContactosTableView.swift
//  Evidencia1
//
//  Created by David Saucedo on 07/05/21.
//

import UIKit
import CoreData

class ContactosTableView: UITableViewController {
    
    var contacts: [NSManagedObject] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        recuperar()
        //Table view
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        //Eliminar recursos que se puedan crear de nuevo.
    }
    
    func recuperar() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Contactos")
                do {
                    contacts = try managedObjectContext.fetch(fetchRequest) as! [NSManagedObject]
                } catch let error as NSError {
                    print("No se pudo recuperar \(error)")
                }
    }
    
    func guardado (nombre: String, fecha: String, noCliente: String, cantidadCuotas: String, domicilio: String, cuotasPag: String, valorPrestamo: String, saldoPendiente: String, estatus: String, monto: String) {
        
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
            let managedObjectContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName:"Contactos", in: managedObjectContext) else { return }
        
        
            let contact = NSManagedObject(entity: entity, insertInto: managedObjectContext)
        contact.setValue(nombre, forKey: "nombre")
        contact.setValue(fecha, forKey: "fecha")
        contact.setValue(noCliente, forKey: "noCliente")
        contact.setValue(cantidadCuotas, forKey: "cantidadCuotas")
        contact.setValue(domicilio, forKey: "domicilio")
        contact.setValue(cuotasPag, forKey: "cuotasPag")
        contact.setValue(valorPrestamo, forKey: "valorPrestamo")
        contact.setValue(saldoPendiente, forKey: "saldoPendiente")
        contact.setValue(estatus, forKey: "estatus")
        contact.setValue(monto, forKey: "monto")
            do {
                try managedObjectContext.save()
                self.contacts.append(contact)
            } catch let error as NSError {
                print("No se guardo el contacto \(error)")
            }
        }
    
    func actualizar (indexPath: IndexPath, nombre: String, fecha: String, noCliente: String, cantidadCuotas: String, domicilio: String, cuotasPag: String, valorPrestamo: String, saldoPendiente: String, estatus: String, monto: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
                let managedObjectContext = appDelegate.persistentContainer.viewContext
                let contact = contacts[indexPath.row]
        contact.setValue(nombre, forKey: "nombre")
        contact.setValue(fecha, forKey: "fecha")
        contact.setValue(noCliente, forKey: "noCliente")
        contact.setValue(cantidadCuotas, forKey: "cantidadCuotas")
        contact.setValue(domicilio, forKey: "domicilio")
        contact.setValue(cuotasPag, forKey: "cuotasPag")
        contact.setValue(valorPrestamo, forKey: "valorPrestamo")
        contact.setValue(saldoPendiente, forKey: "saldoPendiente")
        contact.setValue(estatus, forKey: "estatus")
        contact.setValue(monto, forKey: "monto")
        do {
                    try managedObjectContext.save()
                   contacts[indexPath.row] = contact
                } catch let error as NSError {
                    print("¡Oh!, un error ocurrio al guardarse el contacto \(error)")
                }
        
    }
    
    
    func eliminar (_ contact: NSManagedObject, indexPath: IndexPath) {
            guard let appDelegate = UIApplication.shared.delegate as?
            AppDelegate else {
            return
            }
            let managedObjectContext = appDelegate.persistentContainer.viewContext
            managedObjectContext.delete(contact)
            contacts.remove(at: indexPath.row)
        }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
       
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return contacts.count
       }
       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCelda", for: indexPath)
           
           let contact = contacts[indexPath.row]
           
        //VISTA PREVIA DE LA INFORMACION
           cell.textLabel?.text = contact.value(forKey:"nombre") as? String
           cell.detailTextLabel?.text = contact.value(forKey:"fecha") as? String
           cell.detailTextLabel?.text = contact.value(forKey:"noCliente") as? String
        cell.detailTextLabel?.text = contact.value(forKey:"cantidadCuotas") as? String
        cell.textLabel?.text = contact.value(forKey:"domicilio") as? String
        cell.detailTextLabel?.text = contact.value(forKey:"cuotasPag") as? String
        cell.detailTextLabel?.text = contact.value(forKey:"saldoPendiente") as? String
        cell.detailTextLabel?.text = contact.value(forKey:"valorPrestamo") as? String
        cell.detailTextLabel?.text = contact.value(forKey:"estatus") as? String
        cell.detailTextLabel?.text = contact.value(forKey:"monto") as? String
           return cell
       }
    
    @IBAction func addContact(segue: UIStoryboardSegue) {
        
        if let viewController = segue.source as? informacionContacto {
                guard let fecha: String = viewController.fecha.text,
                let noCliente : String = viewController.numCliente.text,
                let cantidadCuotas : String = viewController.cantidadCuotas.text,
                let domicilio : String = viewController.domicilio.text,
                let cuotasPag : String = viewController.cuotasPag.text,
                let valorPrestamo : String = viewController.valorPrestamo.text,
                let saldoPendiente : String = viewController.saldoPendiente.text,
                let estatus : String = viewController.estatus.text,
                let monto : String = viewController.monto.text,
                let nombre: String = viewController.nombreLabel.text
                else {return}
            
            //TEXTOS A LLENAR
            if fecha != "" && nombre != "" && cantidadCuotas != "" && noCliente != "" && domicilio != "" && cuotasPag != "" && valorPrestamo != "" && saldoPendiente != "" && estatus != "" && monto != ""  {
                if let indexPath = viewController.indexPathContacto {
                    
                    actualizar (indexPath: indexPath, nombre: nombre, fecha: fecha, noCliente: noCliente, cantidadCuotas: cantidadCuotas, domicilio: domicilio, cuotasPag: cuotasPag, valorPrestamo: valorPrestamo, saldoPendiente: saldoPendiente, estatus: estatus, monto: monto)
                } else {
                    guardado (nombre: nombre, fecha: fecha, noCliente: noCliente, cantidadCuotas: cantidadCuotas, domicilio: domicilio, cuotasPag: cuotasPag, valorPrestamo: valorPrestamo, saldoPendiente: saldoPendiente, estatus: estatus, monto: monto)
                }
            }
                   tableView.reloadData()
               } else if let viewController = segue.source as? DetalleContactosViewController {
                   if viewController.isDeleted {
                       guard let indexPath: IndexPath = viewController.indexPath
                       else {
                        return
                       }
                       let contact = contacts[indexPath.row]
                    eliminar(contact, indexPath: indexPath)
                       tableView.reloadData()
                   }
               }
         
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "contactoDetalle" {
                guard let navViewController = segue.destination as? UINavigationController else { return }
                guard let viewController = navViewController.topViewController as? DetalleContactosViewController else { return }
                guard let indexPath = tableView.indexPathForSelectedRow else { return }
                let contact = contacts[indexPath.row]
                viewController.contact = contact
                viewController.indexPath = indexPath
            }
        }
        
    }


