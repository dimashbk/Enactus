import UIKit

final class TransConfirmCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(walletId: String, amount: Int) {
        let viewModel = TransConfirmViewModel(walletID: walletId, amount: amount)
        let controller = TransConfirmController()
        controller.viewModel = viewModel
        controller.viewModel?.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showSuccessPage() {
        let coordinator = ENSuccessCoordinator(navigationController: navigationController)
        coordinator.start(title: "Ваш перевод принят!", subtitle: "Чек об оплате можете найти в истории платежей", onBackButtonDidTap: {
            DispatchQueue.main.async {
                let controllers = self.navigationController.viewControllers
                for vc in controllers {
                    if vc is MainViewController {
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
