//
//  MainViewController.swift
//  AIATest
//
//  Created by Laelnaldi Saputra on 22/05/20.
//  Copyright © 2020 AIA. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, CollectionCellListener, DetailListener{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionVIew: UICollectionView!
    
    @IBOutlet weak var viewDialog: UIView!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfLenght: UITextField!
    
    private var currentID = ""
    private var currentClickedPosition = 0
    
    private var myCustomViewLayout : CustomCollectionViewLayout!
    private var robotList = [RobotStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    private func setView(){
        self.navigationItem.title = "AIA TEST - Laelnaldi Saputra"
        collectionVIew.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionVIew.dataSource = self
        myCustomViewLayout = CustomCollectionViewLayout()
        myCustomViewLayout.delegate = self
        collectionVIew.collectionViewLayout = self.myCustomViewLayout
        
        initiateExampleRobot()
    }
    
    private func initiateExampleRobot(){
        let robotStruct = RobotStruct(name: "Optimus Prime", code: CodeUtil.generateRandomCode(),pic : "optimus", robot_length: "120", robot_height: "150", robot_weight: "100", rate: 1)
        let robotStruct2 = RobotStruct(name: "Megatron", code: CodeUtil.generateRandomCode(),pic : "megatron", robot_length: "120", robot_height: "150", robot_weight: "100", rate: 5)
        let robotStruct3 = RobotStruct(name: "Ironhide", code: CodeUtil.generateRandomCode(),pic : "iron_hide", robot_length: "120", robot_height: "150", robot_weight: "100", rate: 1)
        let robotStruct4 = RobotStruct(name: "Starscream", code: CodeUtil.generateRandomCode(),pic : "starscream", robot_length: "120", robot_height: "150", robot_weight: "100", rate: 1)
        let robotStruct5 = RobotStruct(name: "Bumblebee", code: CodeUtil.generateRandomCode(),pic : "bumblebee", robot_length: "120", robot_height: "150", robot_weight: "100", rate: 5)
         let robotStruct6 = RobotStruct(name: "Optimus Prime", code: CodeUtil.generateRandomCode(),pic : "optimus", robot_length: "120", robot_height: "150", robot_weight: "100", rate: 1)
        
         robotList.append(robotStruct)
         robotList.append(robotStruct2)
         robotList.append(robotStruct3)
         robotList.append(robotStruct4)
         robotList.append(robotStruct5)
         robotList.append(robotStruct6)
    }
    
    private func addRobot(){
        let picList = ["optimus","iron_hide","megatron","bumblebee","starscream"]
        let pic = picList[Int.random(in: 0 ... picList.count - 1)]
        let rate = Int.random(in: 0 ... 5)
        let name = tfName.text ?? ""
        let length = tfLenght.text ?? ""
        let height = tfHeight.text ?? ""
        let weight = tfWeight.text ?? ""
        
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
        
        let robotStruct = RobotStruct(name: name, code: currentID, pic: pic, robot_length: length, robot_height: height, robot_weight: weight, rate: rate)
        robotList.append(robotStruct)
        collectionVIew.reloadData()
        myCustomViewLayout.reloadData()
        
        tfName.text = ""
        tfLenght.text = ""
        tfHeight.text = ""
        tfWeight.text = ""
        
        viewDialog.isHidden = true
    }
    
    func onCollectionViewClicked(position: Int) {
        currentClickedPosition = position
        let robotStruct = robotList[position]
        let vc = DetailViewController()
        vc.robotStruct = robotStruct
        vc.detailListener = self
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func onDetailResult(robotStruct: RobotStruct) {
        robotList[currentClickedPosition] = robotStruct
        collectionVIew.reloadData()
    }
    
    @IBAction func addRobot(_ sender: UIButton) {
        currentID = CodeUtil.generateRandomCode()
        lblID.text = "ID : \(currentID)"
        viewDialog.isHidden = false
    }
    
    @IBAction func closeDialog(_ sender: UIButton) {
        viewDialog.isHidden = true
    }
    
    @IBAction func simpanDialog(_ sender: UIButton) {
        addRobot()
    }
    
    @IBAction func closeViewDialog(_ sender: UIButton) {
        viewDialog.isHidden = true
    }
}

extension MainViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return robotList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let robotStruct = robotList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        cell.config(robotStruct: robotStruct, collectionCellListener: self, position : indexPath.row)
        return cell
    }
}

extension MainViewController : CustomLayoutDelegate {
          func collectionView(_ collectionView: UICollectionView, heightForItemAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
              let robotStruct = robotList[indexPath.row]
              let rate = robotStruct.rate
            
              if rate > 3{
                  return 200
              }
              else{
                  return 100
              }
          }
      }


