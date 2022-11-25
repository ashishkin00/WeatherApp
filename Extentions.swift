import UIKit

extension Array where Element == Double {
    func avg() -> Double {
        return (self.reduce(0, +) / Double(self.count)).rounded()
    }
}

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension UIViewController {
    func dispose() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.timingFunction = CAMediaTimingFunction(name: .linear)
        transition.type = .reveal
        transition.subtype = .fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
    
    func present(_ vc: UIViewController) {
        vc.modalPresentationStyle = .fullScreen
        let transition = CATransition()
        transition.duration = 0.25
        transition.timingFunction = CAMediaTimingFunction(name: .linear)
        transition.type = .moveIn
        transition.subtype = .fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        self.present(vc, animated: false)
    }
}
