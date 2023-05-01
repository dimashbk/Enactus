import UIKit

protocol ActionsViewCellViewModelProtocol {
    var iconName: String { get }
    var titleText: String { get }
}

struct ActionsViewCellViewModel: ActionsViewCellViewModelProtocol {
    
    //MARK: - Properties
    typealias Row = MainViewController.Action.Row
    
    let row: Row
    
    //MARK: - ActionsViewCellViewModelProtocol
    var iconName: String {
        switch row {
        case .remittance:
            return "remittance"
        case .shop:
            return "shop"
        case .credits:
            return "credits"
        case .faq:
            return "FAQ"
        }
    }
    
    var titleText: String {
        switch row {
        case .remittance:
            return "Переводы"
        case .shop:
            return "Магазин"
        case .credits:
            return "Кредиты"
        case .faq:
            return "FAQ"
        }
    }
}
