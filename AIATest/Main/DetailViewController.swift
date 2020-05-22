//
//  DetailViewController.swift
//  AIATest
//
//  Created by Laelnaldi Saputra on 22/05/20.
//  Copyright © 2020 AIA. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgRobot: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPanjang: UILabel!
   
    @IBOutlet weak var lblTinggi: UILabel!
    @IBOutlet weak var lblBerat: UILabel!
    @IBOutlet weak var LBLID: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var viewDialog: UIView!
    @IBOutlet weak var lblDialogID: UILabel!
    @IBOutlet weak var tfNama: UITextField!
    @IBOutlet weak var tfPanjang: UITextField!
    @IBOutlet weak var tfTinggi: UITextField!
    @IBOutlet weak var tfBerat: UITextField!
    
    var detailListener : DetailListener!
    var robotStruct : RobotStruct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    private func setView(){
        self.navigationItem.title = robotStruct.name ?? ""
        btnEdit.layer.cornerRadius = 8
        LBLID.text = "ID : \(robotStruct.code ?? "")"
        lblName.text = robotStruct.name ?? ""
        lblPanjang.text = "\(robotStruct.robot_length ?? "") Meters"
        lblTinggi.text = "\(robotStruct.robot_height ?? "") Meters"
        lblBerat.text = "\(robotStruct.robot_weight ?? "") Tons"
        imgRobot.image = UIImage(named: robotStruct.pic ?? "")
        
        lblDialogID.text = "ID : \(robotStruct.code ?? "")"
        tfNama.text = robotStruct.name ?? ""
        tfPanjang.text = robotStruct.robot_length ?? ""
        tfTinggi.text = robotStruct.robot_height ?? ""
        tfBerat.text = robotStruct.robot_weight ?? ""
    }
    
    private func editRobot(){
         
           let name = tfNama.text ?? ""
           let length = tfPanjang.text ?? ""
           let height = tfTinggi.text ?? ""
           let weight = tfBerat.text ?? ""
           
           if name.isEmpty{
               return
           }
           
           if length.isEmpty{
               return
           }
           
           if height.isEmpty{
               return
           }
           
           if weight.isEmpty{
               return
           }
           
         robotStruct.name = name
         robotStruct.robot_length = length
         robotStruct.robot_height = height
         robotStruct.robot_weight = weight
        
         lblName.text = robotStruct.name ?? ""
         lblPanjang.text = "\(robotStruct.robot_length ?? "") Meters"
         lblTinggi.text = "\(robotStruct.robot_height ?? "") Meters"
         lblBerat.text = "\(robotStruct.robot_weight ?? "") Tons"
        
         viewDialog.isHidden = true
       }
    
    @IBAction func actionEditRobot(_ sender: UIButton) {
         viewDialog.isHidden = false
    }
    
    @IBAction func actionCloseDialog(_ sender: UIButton) {
         viewDialog.isHidden = true
    }
    
    @IBAction func actionCloseDialogImage(_ sender: Any) {
        viewDialog.isHidden = true
    }
    
    @IBAction func actionSimpan(_ sender: UIButton) {
        editRobot()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        detailListener.onDetailResult(robotStruct: robotStruct)
    }
}
