import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    window = UIWindow(frame: UIScreen.main.bounds)

    let sunny = Weather(image: "🌞", description: "Sunny")
    let cloudy = Weather(image: "☁️", description: "Cloudy")
    let rainy = Weather(image: "☔️", description: "Rainy")
    let windy = Weather(image: "🌬", description: "Windy")
    let stormy = Weather(image: "⚡️", description: "Stormy")
    let snowy = Weather(image: "☃️", description: "Snowy")

    let vancouver = City(name: "Vancouver", country: "Canada", weather: sunny, temperature: 15.6, icon: "canada", summary: "Sunny")
    let tokyo = City(name: "Tokyo", country: "Japan", weather: cloudy, temperature: 20.3, icon: "japan", summary: "Hot")
    let saoPaulo = City(name: "Sao Paulo", country: "Brazil", weather: rainy, temperature: 26.8, icon: "brazil", summary: "Dangerous")
    let madrid = City(name: "Madrid", country: "Spain", weather: windy, temperature: 30.7, icon: "italy", summary: "Rainy")

    let vancouverVC = CityViewController()
    vancouverVC.render(city: vancouver)

    let tokyoVC = CityViewController()
    tokyoVC.render(city: tokyo)

    let saoPauloVC = CityViewController()
    saoPauloVC.render(city: saoPaulo)

    let madridVC = CityViewController()
    madridVC.render(city: madrid)

    let tabBarController = UITabBarController()
    tabBarController.viewControllers = [vancouverVC, tokyoVC, saoPauloVC, madridVC].map { UINavigationController(rootViewController: $0) }

    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()

    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }

}
