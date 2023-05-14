import UIKit

//MARK: - UITableViewDataSource
extension CreditDetailController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section].section
        
        switch section {
        case .payment, .calendar:
            let cell: CreditDetailCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: CreditDetailCellViewModel(row: section))
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UITableViewHeaderFooterView()
        view.backgroundColor = .clear
        return view
    }
    
}

//MARK: - UITableViewDelegate
extension CreditDetailController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let retake = retake else { return }
        
        let section = sections[indexPath.section].section
        
        switch section {
        case .payment:
            coordinator?.showConfirmFlow(retake: retake)
        case .calendar:
            print("calendar")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}
