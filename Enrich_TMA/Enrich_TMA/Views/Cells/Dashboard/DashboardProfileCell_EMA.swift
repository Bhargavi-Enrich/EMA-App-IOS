//
//  DashboardProfileCell_EMA.swift
//  Enrich_TMA
//
//  Created by Bhargavi on 07/09/22.
//  Copyright © 2022 EnrichBeauty. All rights reserved.
//

import UIKit

protocol DashboardHeaderCellDelegate: class {
    func locationUpdateAction()
    func locationDetailViewUpdate()
    func actionCustomerCount()
    func actionCheckIn(_ cell:DashboardProfileCell_EMA)
    func actionCheckOut()
}

class DashboardProfileCell_EMA: UITableViewCell {
    
    @IBOutlet weak private var btnSelectALocation: UIButton!
    @IBOutlet weak private var locationNameView: UIStackView!
    @IBOutlet weak private var lblUserName: UILabel!
    @IBOutlet weak private var lblDesignation: UILabel!
    @IBOutlet weak var btnCustomerCount: UIButton!
    @IBOutlet weak private var profilePicture: UIImageView!
    @IBOutlet weak private var lblRating: UILabel!
    @IBOutlet weak private var btnSOS: UIButton!
    
    
    @IBOutlet weak var btnCheckIn: UIButton!
    @IBOutlet weak var btnCheckOut: UIButton!
    @IBOutlet weak var lblCheckInValue: UILabel!
    @IBOutlet weak var lblCheckIn: UILabel!
    @IBOutlet weak var lblCheckOutValue: UILabel!
    @IBOutlet weak var lblCheckOut: UILabel!
    
    weak var delegate: DashboardHeaderCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell() {
        
        if let userData = UserDefaults.standard.value(MyProfile.GetUserProfile.UserData.self, forKey: UserDefauiltsKeys.k_Key_LoginUser) {
            
            
            btnCheckIn.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .light)
            btnCheckIn.addTarget(self, action: #selector(actionCheckIn(_:)), for: .touchUpInside)
            btnCheckIn.isHidden = false
            lblCheckInValue.isHidden = true
            lblCheckIn.isHidden = true
            
            btnCheckOut.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .light)
            btnCheckOut.addTarget(self, action: #selector(actionCheckOut(_:)), for: .touchUpInside)
            btnCheckOut.isHidden = true
            lblCheckOutValue.isHidden = false
            lblCheckOut.isHidden = false
            
            lblUserName.text = ("\(userData.firstname ?? "") \(userData.lastname ?? "")").capitalized
            lblDesignation.text = userData.designation ?? ""
            btnSelectALocation.setTitle(userData.base_salon_name ?? "", for: .normal)
            
            let ratingTest = userData.rating?.description ?? "0"
            let rating = Double(ratingTest)?.cleanForRating
            lblRating.text = "\(rating ?? "0")/5"
            
            let count = userData.customer_count ?? "0"
            
            btnCustomerCount.setTitle("\(count.isEmpty ? "0" : count) Customers", for: .normal)
            btnSOS.isHidden = !showSOS
            
            profilePicture.layer.cornerRadius = profilePicture.frame.size.height * 0.5
            profilePicture.kf.indicatorType = .activity
            
            let defaultImage = UIImage(named: "defaultProfile")
            if let url = userData.profile_pic,
               let imageurl = URL(string: url) {
                profilePicture.kf.setImage(with: imageurl, placeholder: defaultImage, options: nil, progressBlock: nil, completionHandler: nil)
            } else {
                profilePicture.image = defaultImage
            }
        }
        contentView.layer.cornerRadius = 15
        contentView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    @IBAction func actionSOS(_ sender: UIButton) {
        SOSFactory.shared.raiseSOSRequest()
    }
    
    @IBAction func actionCustomerCount(_ sender: UIButton) {
        delegate?.actionCustomerCount()
    }
                                 
    @IBAction func actionCheckIn(_ sender: UIButton) {
        delegate?.actionCheckIn(self)
    }
                                 
    @IBAction func actionCheckOut(_ sender: UIButton) {
        //delegate?.actionCheckIn()
        
        btnCheckOut.isHidden = true
        lblCheckOutValue.isHidden = false
        lblCheckOut.isHidden = false
    }
    
}

struct DashboardProfileCellModel {
    let userName: String
    let location: String
    let profilePictureURL: String
    let rating: Double
    let customerCount: Int
}
