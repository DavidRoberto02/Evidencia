//
//  AppDelegate.swift
//  Evidencia1
//
//  Created by David Saucedo on 14/04/21.
//

import UIKit
import FirebaseCore
import CoreData
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        //Interfaz de contactos
        //window = UIWindow()
        //window?.makeKeyAndVisible()
        //window?.rootViewController = ContactosTableView ()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    lazy var persistentContainer: NSPersistentContainer = {
            /*
         Esta implementación crea y
         devuelve un contenedor, habiendo cargado la UI para el
                     aplicación a él.
            */
            let container = NSPersistentContainer(name: "Evidencia1")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
    
    func guardarContexto () {
            let contexto = persistentContainer.viewContext
            if contexto.hasChanges {
                do {
                    try contexto.save()
                } catch {
                    
                    // la aplicación genere un registro de fallos y finalice.
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        
        


}
}
