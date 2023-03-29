import Foundation

protocol OnBoardingCollectionViewCellViewModelProtocol {
    var imageName: String { get }
    var gradientText: String { get }
    var firstLabelText: String { get }
    var secondLabelText: String { get }
    
}

struct OnBoardingCollectionViewCellViewModel: OnBoardingCollectionViewCellViewModelProtocol {
    typealias Row = OnboardingViewController.Section.Row
    
    //MARK: - Proprties
    
    let row: Row
    
    //MARK: - OnBoardingCollectionViewCellViewModelProtocol
    var imageName: String {
        switch row {
        case .first:
            return "backImage1"
        case .second:
            return "backImage2"
        case .third:
            return ""
        }
    }
    
    var gradientText: String {
        switch row {
        case .first:
            return "Shop and earn points "
        case .second:
            return "Follow the news and schedule"
        case .third:
            return ""
        }
    }
    
    var firstLabelText: String {
        switch row {
        case .first:
            return "and make your student life easier"
        case .second:
            return "from the app"
        case .third:
            return ""
        }
    }
    
    var secondLabelText: String {
        switch row {
        case .first:
            return "Accumulate bonuses and pay off your debts"
        case .second:
            return "Schedule, news, payment and transfer options - everything you need"
        case .third:
            return ""
        }
    }
}
