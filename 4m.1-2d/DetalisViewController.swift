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
    
    lazy var image: UIImageView = {
       let image = UIImageView()
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
        
        setUpViews()
        
        let url = URL(string: (product?.thumbnail)!)
        image.kf.setImage(with: url)
        
        titleLabel.text = product?.title
        descriptionLabel.text = product?.description
        
    }
    
    private func setUpViews(){
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.width.equalTo(300)
        }
        
        view.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(30)
            make.trailing.leading.equalToSuperview().inset(20)
        }
        
    }
    
}
