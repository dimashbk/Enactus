import UIKit

extension CreditController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = sections[indexPath.section].rows[indexPath.row]
        let retake = retakes[indexPath.row]
        
        switch row {
        case .overall, .disc:
            let cell: CreditCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: CreditCellViewModel(retake: retake, row: row))
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = sections[section].section
        
        switch section {
        case .education, .credit:
            let view: CreditHeaderView = tableView.dequeueReusableHeaderFooterView()
            view.configure(with: CreditHeaderViewViewModel(section: section))
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = sections[indexPath.section].rows[indexPath.row]
        let retake = retakes[indexPath.row]
        
        switch row {
        case .overall:
            mainCoordinator?.showDetailFlow(retake: retake)
        case .disc:
            mainCoordinator?.showDetailFlow(retake: retake)
        }
    }
}
