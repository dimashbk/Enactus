protocol ENSuccessViewModelProtocol {
    var title: String? { get }
    var subtitle: String? { get }
    var onBackButtonDidTap: (() -> ())? { get }
}

struct ENSuccessViewModel: ENSuccessViewModelProtocol {
    var title: String?
    
    var subtitle: String?
    
    var onBackButtonDidTap: (() -> ())?
}


