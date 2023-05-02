import UIKit
import Foundation

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let mainViewModel = mainViewModel else {return 0}
        
        return mainViewModel.organizations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let organization = mainViewModel?.organizations[indexPath.row] else {return UITableViewCell()}
        
        let cell: OrganizationTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.selectionStyle = .none
        DispatchQueue.main.async {
            cell.configure(with: organization)
        }
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 99
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let organization = mainViewModel?.organizations[indexPath.row] else {return}
        
        coordinator?.showOrgDetailFlow(model: organization)
    }
}
