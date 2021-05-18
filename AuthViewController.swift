//
//  AuthViewController.swift
//  Evidencia1
//
//  Created by David Saucedo on 14/04/21.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth
import Firebase
import FirebaseFirestore

class AuthViewController: UIViewController {

    @IBOutlet weak var inicioSesionButton: UIButton!
    
    @IBOutlet weak var contraseñaField: UITextField!
    @IBOutlet weak var correoTextField: UITextField!
    
    @IBOutlet weak var registrarButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Titulo de la aplicacion en la zona superior de la app.
        title = "Autenticación de Usuario"
        
        //Evento Analytico de Firebase
        Analytics.logEvent("Init Screen", parameters: ["mensaje":"Integración de Firebase completa"])
        
    }
    
    
    @IBAction func registroAccion(_ sender: Any) {
        if let correo = correoTextField.text, let contraseña = contraseñaField.text{
            
            let email = correoTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = contraseñaField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

            
            Auth.auth().createUser(withEmail: correo, password: contraseña){
                (result, error) in
                
                if let result = result, error == nil {
                    
                    let database = Firestore.firestore()
                    
                    database.collection("usuarios").addDocument(data: ["Correo Electronico":email, "Contraseña":password, "uid": result.user.uid ]) { (error) in
                        
                        if error != nil {
                            let alertaController = UIAlertController(title: "Error", message: "Se ha producido un error registrando su cuenta", preferredStyle: .alert)
                            alertaController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                            
                            self.present(alertaController, animated: true, completion: nil)

                        }
                    }
                    
                }else{
                    let alertaController = UIAlertController(title: "Error", message: "Se ha producido un error registrando su cuenta", preferredStyle: .alert)
                    alertaController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertaController, animated: true, completion: nil)
                }
            }
        }
    }
    

    @IBAction func iniciarSesionAccion(_ sender: Any) {
        let email = correoTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = contraseñaField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                let alertaController = UIAlertController(title: "Error", message: "Se ha producido un error  su cuenta al iniciar sesion en su cuenta", preferredStyle: .alert)
                alertaController.addAction(UIAlertAction(title: "Ok", style: .default))
                
                self.present(alertaController, animated: true, completion: nil)
            }
            else {
                
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
        }

        }
    
