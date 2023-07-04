//
//  DetalisViewController.swift
//  4m.1d
//
//  Created by imran on 25.06.2023.
//

import UIKit
import Kingfisher

class DetalisViewController: UIViewController {
    
    var product: Product?
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 10
        return label
    }()
    
    lazy var productImage: UIImageView = {
       let image = UIImageView()
        return image
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        return label
    }()
    
    lazy var starImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.tintColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        return image
    }()
    
    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        return label
    }()
    
    lazy var brandLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return label
    }()
    
    lazy var categoryLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return label
    }()
    
    lazy var addToCartBtn: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        button.setTitle("Add To Cart", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 16
        return button
    }()
    
    @objc func addToCart(){
        print(1+2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
        
        setUpViews()
        
        let url = URL(string: (product?.thumbnail)!)
        productImage.kf.setImage(with: url)
        
        titleLabel.text = product?.title
        descriptionLabel.text = product?.description
        brandLabel.text = "Brand: \(product?.brand ?? "")"
        categoryLabel.text = "Category: \(product?.category ?? "")"
        priceLabel.text = "\(product?.price ?? 0)$"
        ratingLabel.text = "\(product?.rating ?? 0)"
        
    }
    
    private func setUpViews(){
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(productImage)
        
        productImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.width.equalTo(300)
        }
        
        view.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).offset(30)
            make.trailing.leading.equalToSuperview().inset(20)
        }
        
        view.addSubview(brandLabel)
        
        brandLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(30)
        }
        
        view.addSubview(categoryLabel)
        
        categoryLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(brandLabel.snp.bottom).offset(5)
        }
        
        view.addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(categoryLabel.snp.bottom).offset(30)
        }
        
        view.addSubview(starImage)
        
        starImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(priceLabel.snp.bottom).offset(-5)
            make.height.equalTo(20)
            make.width.equalTo(22)
        }
        
        view.addSubview(ratingLabel)
        
        ratingLabel.snp.makeConstraints { make in
            make.centerY.equalTo(starImage)
            make.trailing.equalTo(starImage.snp.leading).offset(-5)
        }
        
        view.addSubview(addToCartBtn)
        
        addToCartBtn.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-50)
            make.height.equalTo(60)
        }
        
    }
    
}
