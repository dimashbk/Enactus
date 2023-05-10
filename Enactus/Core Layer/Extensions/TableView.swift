import UIKit

extension UITableView {
    
    func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: "\(Cell.self)", for: indexPath) as? Cell else {
            fatalError("register(cellClass: \(Cell.self) has not been implemented")
        }
        
        return cell
    }
    
    public func dequeueReusableHeaderFooterView<Cell: UITableViewHeaderFooterView>() -> Cell {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: "\(Cell.self)") as? Cell else {
            fatalError("register(aClass: \(Cell.self) has not been implemented")
        }

        return view
    }
    
    func register(cellClass: AnyClass) {
        register(cellClass, forCellReuseIdentifier: "\(cellClass)")
    }
    
    public func register(aClass: AnyClass) {
        register(aClass, forHeaderFooterViewReuseIdentifier: "\(aClass)")
    }
}
