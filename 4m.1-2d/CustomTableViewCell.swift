//
//  CustomCell.swift
//  4m.1d
//
//  Created by imran on 25.06.2023.
//

import UIKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        
        setUpView()
        
    }
    
    func setUpView(){
        self.addSubview(productImage)
        
        productImage.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview().inset(20)
            make.height.equalTo(220)
        }
        
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        self.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        self.addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
        }
        
        self.addSubview(starImage)
        
        starImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(priceLabel.snp.bottom).offset(-5)
            make.height.equalTo(20)
            make.width.equalTo(22)
        }
        
        self.addSubview(ratingLabel)
        
        ratingLabel.snp.makeConstraints { make in
            make.centerY.equalTo(starImage)
            make.trailing.equalTo(starImage.snp.leading).offset(-5)
        }
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with: Product){
        self.productImage.kf.setImage(with: URL(string: with.thumbnail ?? ""))
        self.titleLabel.text = with.title
        self.descriptionLabel.text = with.description
        self.priceLabel.text = "\(with.price ?? 0)$"
        self.ratingLabel.text = "\(with.rating ?? 0)"
    }
    
}
