//
//  HomeViewController.swift
//  TestProjectScanQr
//
//  Created by MOHAMMADB on 12/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var saldoLabel: UILabel!
    @IBOutlet weak var riwayatTransaksiTableView: UITableView!
    @IBOutlet weak var homeTableView: UITableView!
    
    let viewModel =  HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getTransaction(user: viewModel.user)
    }
    
    func setUi() {
        saldoLabel.text = "\(viewModel.user?.balance ?? 0)"
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.transactionHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let data = viewModel.transactionHistory[indexPath.row]
        cell.setupCell(data: data)
        
        return cell
    }
}

class HomeTableViewCell : UITableViewCell {
    
    @IBOutlet weak var nominalLabel: UILabel!
    @IBOutlet weak var merchantLabel: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    
    func setupCell(data: Transaction) {
        nominalLabel.text = "Rp. \(data.amount)"
        merchantLabel.text = data.merchant
    }
    
    
}
