import UIKit

class CalendarViewInCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.registerCellNib(DateCell.self)
        }
    }
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    var customArray: [Int] = [Int](1...7)
    var indexes = 0 {
        didSet {
            prevButton.isEnabled = indexes != 1
            customArray.removeAll()
            customArray = [Int](1...(indexes * 7))
            collectionView.reloadData()
            //
            let height = (UIScreen.main.bounds.width / 7) * CGFloat(customArray.count / 7) + 64.0
            label.text = "Height of cell = \(height)"
            self.complitionHandler?(height)
        }
    }
    
    @IBAction func next(_ sender: Any) {
        indexes += 1
    }
    
    @IBAction func previous(_ sender: Any) {
        indexes -= 1
    }
    
    var complitionHandler: ((_ height: CGFloat?) -> ())?
}

extension CalendarViewInCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return customArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCellWithClass(DateCell.self, for: indexPath)
        let title = customArray[indexPath.item]
        cell.dateLabel.text = "\(title)"
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 7
        return CGSize(width: width, height: width)
    }
}

