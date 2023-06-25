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
    
    lazy var image: UIImageView = {
       let image = UIImageView()
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        
        setUpView()
        
    }
    
    func setUpView(){
        self.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview().inset(20)
            make.height.width.equalTo(200)
        }
        
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        self.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with: Product){
        self.titleLabel.text = with.title
        self.descriptionLabel.text = with.description
        self.image.kf.setImage(with: URL(string: with.thumbnail ?? ""))
    }
    
}
