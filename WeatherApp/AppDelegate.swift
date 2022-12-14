import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
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
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func fetchAllValuesInSection(key: String, ascending: Bool) -> [Cities]? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cities")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: key, ascending: ascending)]
        let result = try? context.fetch(fetchRequest) as? [Cities]
        return result
    }
    
    func addCity(name: String, size: CitySizes) {
        let context = persistentContainer.viewContext
        if let city = fetchCity(name: name) {
            city.name = name
            city.size = size.toString
            city.avg_temp_fall = 10
            city.avg_temp_autumn = 15
            city.avg_temp_winter = 20
            city.avg_temp_summer = 30
        } else {
            let newCity = Cities(context: context)
            newCity.name = name
            newCity.size = size.toString
            newCity.avg_temp_fall = 10
            newCity.avg_temp_autumn = 15
            newCity.avg_temp_winter = 20
            newCity.avg_temp_summer = 30
        }
        saveContext()
    }
    
    func removeCity(name: String) -> Bool {
        let context = persistentContainer.viewContext
        if let city = fetchCity(name: name) {
            context.delete(city)
            saveContext()
            return true
        }
        return false
    }
    
    func setTemperature(name: String, temp: Double, month: Months) {
        if let city = fetchCity(name: name) {
            switch month {
                case .january:
                    city.january = temp
                case .february:
                    city.february = temp
                case .march:
                    city.march = temp
                case .april:
                    city.april = temp
                case .may:
                    city.may = temp
                case .june:
                    city.june = temp
                case .july:
                    city.july = temp
                case .august:
                    city.august = temp
                case .september:
                    city.september = temp
                case .october:
                    city.october = temp
                case .november:
                    city.november = temp
                case .december:
                    city.december = temp
            }
            saveContext()
        } else {
            print("unable to find city")
        }
    }
    
    func fetchCity(name: String) -> Cities? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cities")
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        return try? context.fetch(fetchRequest).first as? Cities
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

