//
//  CompanyTableViewCell.swift
//  dz7.3
//
//  Created by Абдулла-Бек on 28/3/23.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {
    
    private let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = Collor.mainBlue
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    private let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 14
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = Collor.mainBlue
        return label
    }()
    
    private let titleImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "toch")
        return image
    }()
    
    private let emailImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "email")
        return image
    }()
    
    private let email1Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "email")
        return image
    }()
    
    private let email2Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "email")
        return image
    }()
    
    private let nameCompanyLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = Collor.mainBlue
        return label
    }()
    
    private let adreessLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    private let phoneNamberLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
            make.height.equalTo(120)
        }
        
        addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(28)
            make.height.equalTo(40)
            make.bottom.equalTo(bgView.snp.top)
        }
        
        headerView.addSubview(titleView)
        titleView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.height.equalTo(26)
            make.width.equalTo(66)
        }
        
        titleView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        headerView.addSubview(titleImage)
        titleImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-14)
            make.centerY.equalToSuperview()
            make.width.equalTo(14)
            make.height.equalTo(4)
        }
        
        bgView.addSubview(emailImage)
        emailImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.top.equalTo(headerView.snp.bottom).offset(47)
        }
        
        bgView.addSubview(email1Image)
        email1Image.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.top.equalTo(emailImage.snp.bottom).offset(12)
        }
        
        bgView.addSubview(email2Image)
        email2Image.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.top.equalTo(email1Image.snp.bottom).offset(12)
        }
        
        addSubview(nameCompanyLabel)
        nameCompanyLabel.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(20)
            make.leading.equalTo(bgView.snp.leading).offset(10)
        }
        
        addSubview(adreessLabel)
        adreessLabel.snp.makeConstraints { make in
            make.top.equalTo(nameCompanyLabel.snp.bottom).offset(10)
            make.leading.equalTo(bgView.snp.leading).offset(30)
        }
        
        addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(adreessLabel.snp.bottom).offset(10)
            make.leading.equalTo(bgView.snp.leading).offset(30)
        }
        
        addSubview(phoneNamberLabel)
        phoneNamberLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.leading.equalTo(bgView.snp.leading).offset(30)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(title: String, nameCompany: String, adreess: String, email: String, phoneNamber: String) {
        titleLabel.text = title
        nameCompanyLabel.text = nameCompany
        adreessLabel.text = adreess
        emailLabel.text = email
        phoneNamberLabel.text = phoneNamber
    }
    
}
