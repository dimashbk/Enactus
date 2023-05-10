protocol CreditDetailCellViewModelProtocol {
    var title: String? { get }
}

struct CreditDetailCellViewModel: CreditDetailCellViewModelProtocol {
    
    //MARK: - Properties
    typealias Row = CreditDetailController.Section.Section
    
    var row: Row
    
    //MARK: - CreditDetailCellViewModelProtocol
    var title: String? {
        switch row {
        case .payment:
            return "Оплатить платеж"
        case .calendar:
            return "Календарь платежей"
        }
    }
}


