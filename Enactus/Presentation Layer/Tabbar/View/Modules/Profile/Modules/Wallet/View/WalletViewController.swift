//
//  WalletViewController.swift
//  Enactus
//
//  Created by Dinmukhamed on 28.04.2023.
//

import UIKit

final class WalletViewController: UIViewController {
    
    var viewModel: WalletViewModelProtocol?
    
    private lazy var gradientCard: CardGradientView = {
        let view = CardGradientView()
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var paymentsLabel: UILabel = {
        let label = UILabel()
        label.text = "История Платежей"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.regiter(cellClass: PaymentTableViewCell.self)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func loadView() {
        super.loadView()
        
        fetchTransactions()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup() {
        self.title = "Кошелек"
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
    }
    private func setupSubviews() {
        [gradientCard, paymentsLabel, tableView].forEach {
            view.addSubview($0)
        }
    }
    private func setupConstraints() {
        gradientCard.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(view.bounds.height / 4 + 10)
        }
        paymentsLabel.snp.makeConstraints { make in
            make.top.equalTo(gradientCard.snp.bottom).offset(32)
            make.left.equalToSuperview().inset(32)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(paymentsLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
    
    private func fetchTransactions() {
        viewModel?.getTransactions()
        viewModel?.updateViewData = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension WalletViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        
        return viewModel.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let viewModel = viewModel else { return UITableViewCell() }
        
        let cell: PaymentTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel.transactions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
