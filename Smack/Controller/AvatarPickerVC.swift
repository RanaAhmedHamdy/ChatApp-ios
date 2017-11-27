//
//  AvatarPickerVC.swift
//  Smack
//
//  Created by Hazem Mohamed Magdy on 11/27/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var avatarType: AvatarType = .Dark
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath)
            as? AvatarCell{
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        return AvatarCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(avatarType == .Dark) {
            DataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        } else {
            DataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    @IBAction func BackBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func segmentedControlPressed(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
            avatarType = .Dark
        } else {
            avatarType = .Light
        }
        collectionView.reloadData()
    }
}
