import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        let mainWindow = UIWindow(frame: UIScreen.main.bounds)
        let mainController = BoardController()
        mainWindow.rootViewController = mainController

        window = mainWindow

        mainWindow.makeKeyAndVisible()

        return true
    }
}
