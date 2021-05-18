//
//  DetalleContactosViewController.swift
//  Evidencia1
//
//  Created by David Saucedo on 15/05/21.
//

import UIKit
import CoreData

class DetalleContactosViewController: UIViewController {

    var contact: NSManagedObject? = nil
    var isDeleted: Bool = false
    var indexPath: IndexPath? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        nombreLabel.text = contact?.value(forKey:"nombre") as? String
        fechaLabel.text = contact?.value(forKey:"fecha") as? String
        noCliente.text = contact?.value(forKey:"noCliente") as? String
        cantidadCuotas.text = contact?.value(forKey:"cantidadCuotas") as? String
        domicilio.text = contact?.value(forKey:"domicilio") as? String
        cuotasPag.text = contact?.value(forKey:"cuotasPag") as? String
        valorPrestamo.text = contact?.value(forKey:"valorPrestamo") as? String
        saldoPendiente.text = contact?.value(forKey:"saldoPendiente") as? String
        estatus.text = contact?.value(forKey:"estatus") as? String
        monto.text = contact?.value(forKey:"monto") as? String
        
    }
    
    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var fechaLabel: UILabel!
    
    @IBOutlet weak var noCliente: UILabel!
    
    @IBOutlet weak var cantidadCuotas: UILabel!
    
    @IBOutlet weak var domicilio: UILabel!
    
    @IBOutlet weak var cuotasPag: UILabel!
    
    @IBOutlet weak var valorPrestamo: UILabel!
    
    @IBOutlet weak var saldoPendiente: UILabel!
    
    @IBOutlet weak var estatus: UILabel!
    
    @IBOutlet weak var monto: UILabel!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func done(_ sender: Any) {
        performSegue(withIdentifier: "addContact", sender: self)

    }
    
    
    @IBAction func eliminarContacto(_ sender: Any) {
        isDeleted = true
        performSegue(withIdentifier: "addContact", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editarContacto" {
            guard let viewController = segue.destination as? informacionContacto else { return }
            viewController.title = "Editar Contact"
            viewController.contact = contact
            viewController.indexPathContacto = indexPath!
            
        }
    
}
}

