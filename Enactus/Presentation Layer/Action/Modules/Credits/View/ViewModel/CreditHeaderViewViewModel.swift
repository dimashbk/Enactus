import UIKit

protocol CreditHeaderViewViewModelProtocol {
    var title: String? { get }
}

struct CreditHeaderViewViewModel: CreditHeaderViewViewModelProtocol {
    typealias Section = CreditController.Section.Section
    
    let section: Section
    
    var title: String? {
        switch section {
        case .education:
            return "За обучение"
        case .credit:
            return "Кредиты"
        }
    }
}
