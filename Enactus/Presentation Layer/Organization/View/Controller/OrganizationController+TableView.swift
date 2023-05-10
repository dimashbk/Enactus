import UIKit

//MARK: - UITableViewDataSource
extension OrganizationController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = orgsViewModel?.organizationModel else {return UITableViewCell()}
        
        let row = sections[indexPath.section].rows[indexPath.row]
        switch row {
        case .image:
            
            let cell: OrgsImageViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: model)
            return cell
        case .title:
            let cell: OrgsTitleViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: model)
            return cell
        case .location:
            let cell: OrgsLocationViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: model)
            return cell
        case .description:
            let cell: OrgsDescriptionViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: model)
            return cell
        }
    }
}

//MARK: - UITableViewDelegate
extension OrganizationController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = sections[indexPath.section].rows[indexPath.row]
        switch row {
        case .image:
            return 252
        case .title:
            return 122
        case .location:
            return 66
        case .description:
            return 300
        }
    }
}

