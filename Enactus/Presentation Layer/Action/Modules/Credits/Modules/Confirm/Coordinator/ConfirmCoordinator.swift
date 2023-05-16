import UIKit

final class ConfirmCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(text: String) {
        
    }
    
    func start(retake: RetakeElement) {
        let viewModel = ConfirmViewModel(retake: retake)
        let confirmController = ConfirmController()
        confirmController.coordinator = self
        confirmController.viewModel = viewModel
        confirmController.viewModel?.coordinator = self
        navigationController.pushViewController(confirmController, animated: true)
    }
    
    func showSuccessPage() {
        let coordinator = ENSuccessCoordinator(navigationController: navigationController)
        coordinator.start(title: "Ваш перевод принят!", subtitle: "Чек об оплате можете найти в истории платежей", onBackButtonDidTap: {
            DispatchQueue.main.async {
                let controllers = self.navigationController.viewControllers
                for vc in controllers {
                    if vc is MainViewController {
                        AuthorizationService.shared.getRetakes()
                        _ = self.navigationController.dismiss(animated: true)
                        _ = self.navigationController.popToViewController(vc, animated: true)
                    }
                }
            }
        })
    }
    
    func showAlert() {
        let alert = CustomAlertController(alertTitle: "Что то пошло не так, пожалуйста, перепроверьте данные")
        navigationController.present(alert, animated: true)
    }
}
