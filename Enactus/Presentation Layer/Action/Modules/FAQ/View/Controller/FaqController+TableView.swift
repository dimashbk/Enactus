import UIKit

//MARK: - UITableViewDataSource
extension FaqController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = viewModel else {return 0}
        
        return viewModel.questions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {return UITableViewCell()}
        
        let question = viewModel.questions[indexPath.section]
        
        let cell: QuestionViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: question)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UITableViewHeaderFooterView()
        view.backgroundColor = .clear
        return view
    }
}

//MARK: - UITableViewDelegate
extension FaqController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
}
