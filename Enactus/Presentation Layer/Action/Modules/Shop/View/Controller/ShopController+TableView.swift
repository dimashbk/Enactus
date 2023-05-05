import UIKit

//MARK: - UITableViewDataSource
extension ShopController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ShopController: UITableViewDelegate {
}
