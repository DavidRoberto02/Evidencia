//
//  informacionContacto.swift
//  Evidencia1
//
//  Created by David Saucedo on 14/05/21.
//

import UIKit
import CoreData


class informacionContacto: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fecha: UITextField!
    
    @IBOutlet weak var numCliente: UITextField!
    
    @IBOutlet weak var nombreLabel: UITextField!
    
    @IBOutlet weak var cantidadCuotas: UITextField!
    
    @IBOutlet weak var domicilio: UITextField!
    
    @IBOutlet weak var cuotasPag: UITextField!
    
    @IBOutlet weak var valorPrestamo: UITextField!
    
    @IBOutlet weak var saldoPendiente: UITextField!
    
    @IBOutlet weak var estatus: UITextField!
    
    @IBOutlet weak var monto: UITextField!
    
    var titleText = "Añadir cliente"
    var contact: NSManagedObject? = nil
    var indexPathContacto: IndexPath? = nil
    var text = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleText
        
        if let contact = self.contact {
            fecha.text = contact.value(forKey:"fecha") as? String
            numCliente.text = contact.value(forKey:"noCliente") as? String
            nombreLabel.text = contact.value(forKey:"nombre") as? String
            cantidadCuotas.text = contact.value(forKey:"cantidadCuotas") as? String
            domicilio.text = contact.value(forKey:"domicilio") as? String
            cuotasPag.text = contact.value(forKey:"cuotasPag") as? String
            valorPrestamo.text = contact.value(forKey:"valorPrestamo") as? String
            saldoPendiente.text = contact.value(forKey:"saldoPendiente") as? String
            estatus.text = contact.value(forKey:"estatus") as? String
            monto.text = contact.value(forKey:"monto") as? String
        }
    }


    @IBAction func Guardar(_ sender: Any) {
        performSegue(withIdentifier: "addContact", sender: self)
    }
    
    
    @IBAction func Cancelar(_ sender: Any) {
            fecha.text = nil
            numCliente.text = nil
            nombreLabel.text = nil
            cantidadCuotas.text = nil
            domicilio.text = nil
            cuotasPag.text = nil
            valorPrestamo.text = nil
            saldoPendiente.text = nil
            estatus.text = nil
            monto.text = nil
        performSegue(withIdentifier: "addContact", sender: self)

    }
    
}
