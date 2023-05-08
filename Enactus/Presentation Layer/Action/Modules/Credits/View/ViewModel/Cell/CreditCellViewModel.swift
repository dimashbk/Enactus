import UIKit

protocol CreditCellViewModelProtocol {
    var title: String? { get }
    var subtitle: String? { get }
    var price: String? { get }
}

struct CreditCellViewModel: CreditCellViewModelProtocol {
    
    //MARK: - Properties
    typealias Row = CreditController.Section.Row
    
    var row: Row
    
    //MARK: - CreditCellViewModelProtocol
    var title: String? {
        switch row {
        case .overall:
            return "До 11 апреля"
        case .disc:
            return "IT Foundation"
        }
    }
    
    var subtitle: String? {
        switch row {
        case .overall, .disc:
            return "по всем кредитам"
        }
    }
    
    var price: String? {
        switch row {
        case .overall:
            return "1 638 014.15"
        case .disc:
            return "38 014.15"
        }
    }
}
