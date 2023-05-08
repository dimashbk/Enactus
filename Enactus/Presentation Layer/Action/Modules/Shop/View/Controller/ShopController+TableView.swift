import UIKit

//MARK: - UITableViewDataSource
extension ShopController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let shopViewModel = viewModel else {return 0}
        
        return shopViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let shopViewModel = viewModel else {return UITableViewCell()}
        
        let product = shopViewModel.products[indexPath.section]
        
        let cell: ProductViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.selectionStyle = .none
        cell.configure(with: product)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ShopController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 103
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
}
