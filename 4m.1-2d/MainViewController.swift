//
//  ViewController.swift
//  4m.1d
//
//  Created by imran on 25.06.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private var catalogData: [Product] = []
    
    private lazy var catalogTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        let titleLabel = UILabel()
        titleLabel.text = "CATALOG"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        titleLabel.adjustsFontSizeToFitWidth = true
        navigationItem.titleView = titleLabel
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(openPostPage))
        
        netWorking()
        tableViewSetting()
        setUpView()
        
    }
    
    
    
    private func netWorking(){
        
        ApiManager.shared.universalRequest(type: .get) { result in
            switch result {
            case .success(.model(let value)):
                DispatchQueue.main.async {
                    self.catalogData = value.products ?? []
                    self.catalogTableView.reloadData()
                }
            case .failure(let failure):
                print(failure.localizedDescription)
                
            default: print("success")
            }
        }

        
//        ApiManager.shared.requestData { result in
//            switch result {
//            case .success(let value):
//                DispatchQueue.main.async {
//                    self.catalogData = value.products ?? []
//                    self.catalogTableView.reloadData()
//                }
//            case .failure(let failure):
//                print(failure.localizedDescription)
//            }
//        }
//        
    }
    
    func tableViewSetting(){
        catalogTableView.dataSource = self
        catalogTableView.delegate = self
        catalogTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setUpView() {
        
        view.addSubview(catalogTableView)
        
        catalogTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catalogData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let model = catalogData[indexPath.row]

        cell.setData(with: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetalisViewController()
        
        vc.product = catalogData[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func openPostPage(){
        navigationController?.pushViewController(PostRequestPage(), animated: true)
    }
    
}

