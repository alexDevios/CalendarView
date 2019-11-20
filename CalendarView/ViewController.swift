import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerCell(withClass: CalendarViewInCell.self)
            tableView.tableFooterView = UIView(frame: .zero)
        }
    }
    var height: CGFloat = UIScreen.main.bounds.width / 7 + 64
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCellWithClass(CalendarViewInCell.self, path: indexPath)
        cell.indexes = 1
        cell.complitionHandler = { [weak self] height in
            guard let self = self else { return }
            if let height = height {
                tableView.beginUpdates()
                self.height = height
                tableView.endUpdates()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height
    }
}

