import UIKit

class TabBarController: UITabBarController {
    
    let winter = SeasonVC()
    let autumn = SeasonVC()
    let summer = SeasonVC()
    let fall = SeasonVC()
    
    func setupGestures() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeLeft))
        swipeLeft.direction = .left
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
    }
    
    @objc func didSwipeLeft() {
        self.selectedIndex += 1
    }
    
    @objc func didSwipeRight() {
        self.selectedIndex -= 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winter.season = .winter
        autumn.season = .autumn
        fall.season = .fall
        summer.season = .summer
        self.view.backgroundColor = .white
        winter.tabBarItem = UITabBarItem(title: "Winter", image: UIImage(systemName: "snow"), tag: 0)
        autumn.tabBarItem = UITabBarItem(title: "Autumn", image: UIImage(systemName: "smoke"), tag: 1)
        summer.tabBarItem = UITabBarItem(title: "Summer", image: UIImage(systemName: "sun.max.fill"), tag: 2)
        fall.tabBarItem = UITabBarItem(title: "Fall", image: UIImage(systemName: "cloud.drizzle.fill"), tag: 3)
        self.viewControllers = [winter, autumn, summer, fall]
        setupGestures()
    }
}
