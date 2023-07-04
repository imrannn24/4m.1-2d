//
//  PostRequestPage.swift
//  4m.1-2d
//
//  Created by imran on 26.06.2023.
//

import Foundation
import UIKit

class PostRequestPage: UIViewController {
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Product"
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.text = "Product ID"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var idTF: UITextField = {
       let view = UITextField()
        view.placeholder = "ID..."
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        view.layer.cornerRadius = 16
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.height))
        view.leftViewMode = .always
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Product Name"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var titleTF: UITextField = {
        let view = UITextField()
         view.placeholder = "Name..."
         view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
         view.layer.cornerRadius = 16
         view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.height))
         view.leftViewMode = .always
         return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Product price"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var priceTF: UITextField = {
        let view = UITextField()
         view.placeholder = "Price..."
         view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
         view.layer.cornerRadius = 16
         view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.height))
         view.leftViewMode = .always
         return view
    }()
    
    private lazy var brandLabel: UILabel = {
        let label = UILabel()
        label.text = "Product brand"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var brandTF: UITextField = {
        let view = UITextField()
         view.placeholder = "Brand..."
         view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
         view.layer.cornerRadius = 16
         view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.height))
         view.leftViewMode = .always
         return view
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Product category"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var categoryTF: UITextField = {
        let view = UITextField()
         view.placeholder = "Category..."
         view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
         view.layer.cornerRadius = 16
         view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.height))
         view.leftViewMode = .always
         return view
    }()
    
    private lazy var postButton: UIButton = {
       let button = UIButton()
        button.setTitle("POST", for: .normal)
        button.addTarget(self, action: #selector(postRequest), for: .touchUpInside)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 16
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpView()
        
    }
    
    private func setUpView(){
        
        view.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(idLabel)
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
        }
        
        view.addSubview(idTF)
        idTF.snp.makeConstraints { make in
            make.top.equalTo(idLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(idTF.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(40)
        }
        
        view.addSubview(titleTF)
        titleTF.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
        
        view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTF.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(40)
        }
        
        view.addSubview(priceTF)
        priceTF.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
        
        view.addSubview(brandLabel)
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(priceTF.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(40)
        }
        
        view.addSubview(brandTF)
        brandTF.snp.makeConstraints { make in
            make.top.equalTo(brandLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
        
        view.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(brandTF.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(40)
        }
        
        view.addSubview(categoryTF)
        categoryTF.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
        
        view.addSubview(postButton)
        postButton.snp.makeConstraints { make in
            make.top.equalTo(categoryTF.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
    
    }
    
    @objc private func postRequest(){
        if idTF.text != "" && titleTF.text != "" && priceTF.text != "" && brandTF.text != "" && categoryTF.text != ""{
            postButton.backgroundColor = #colorLiteral(red: 0, green: 0.3269367218, blue: 0.5832633972, alpha: 1)
            ApiManager.shared.requestPostData(id: Int(idTF.text ?? "") ?? 0,
                                              title: titleTF.text ?? "",
                                              price: Int(idTF.text ?? "") ?? 0,
                                              brand: brandTF.text ?? "",
                                              category: categoryTF.text ?? "") { result in
                switch result {
                case .success(let statusCode):
                    DispatchQueue.main.async {
                        self.showAllert(with: "Status Code", message: "Request Code\n\(statusCode) ")
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
    
    private func showAllert(with title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        present(alert, animated: true)
        
    }
    
}
