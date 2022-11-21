import UIKit

enum Months: String, CaseIterable {
    case january = "JAN"
    case february = "FEB"
    case march = "MAR"
    case april = "APR"
    case may = "MAY"
    case june = "JUN"
    case july = "JUL"
    case august = "AUG"
    case september = "SEP"
    case october = "OCT"
    case november = "NOV"
    case december = "DEC"
}

extension SettingsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let spacing = CGFloat(0)
        return UIEdgeInsets(top: spacing, left: 10, bottom: 15, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CollectionViewCell
        let months = Months.allCases
        print(indexPath.item, indexPath.section)
        cell.label.text = months[indexPath.item + (indexPath.section * 6)].rawValue
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize = collectionView.frame.size.width - 50
        return CGSize(width: collectionViewSize / 7, height: collectionViewSize / 7)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(Months.allCases[indexPath.item + (indexPath.section * 6)].rawValue)
    }
}
