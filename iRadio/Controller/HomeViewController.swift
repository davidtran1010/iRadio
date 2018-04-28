//
//  ViewController.swift
//  iRadio
//
//  Created by DavidTran on 4/15/18.
//  Copyright © 2018 DavidTran. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let threshold = 50.0 // threshold from bottom of tableView
    var isLoadingMore = false // flag
    
    
    var resizedHeightTableView = false
    @IBOutlet weak var tableViewBottomConstraintInset: NSLayoutConstraint!
    @IBOutlet weak var kindChannelTableView: UITableView!
    
    var playDelegate:PlayAudioDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kindChannelTableView.dataSource = self
        kindChannelTableView.delegate = self
        kindChannelTableView.tableFooterView = UIView()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// KindChannelTableView delegate and datasource
extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        header.textLabel?.frame = header.frame
        header.textLabel?.textAlignment = .left
        header.backgroundView?.backgroundColor = UIColor.white
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
        
        if !isLoadingMore && (Double(maximumOffset - contentOffset) <= threshold) {
            // Get more data - API call
            self.isLoadingMore = true
            
            // Update UI
            DispatchQueue.main.async {
                self.tableViewBottomConstraintInset.constant = 50
                self.view.layoutIfNeeded()
                self.isLoadingMore = false
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ChannelKinds.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ChannelKinds[section]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kindChannelCell", for: indexPath) as! KindTableViewCell
        DispatchQueue.main.async {
            cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.section)
        }
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(UIScreen.main.bounds.height/3.5)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var view = UIView()
        if section == ChannelNames.count-1{
            let miniPlayerHeight = ((tabBarController as! GeneralTabBarViewController).miniPlayerVC?.view.frame.height)!
            let frame = ((tabBarController as! GeneralTabBarViewController).miniPlayerVC?.view.frame)!
             view = UIView(frame: frame)
           
        }
         return view
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == ChannelNames.count-1{
            return ((tabBarController as! GeneralTabBarViewController).miniPlayerVC?.view.frame.height)!
        }
        return 0
    }

}
extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return ChannelURLs[collectionView.tag].count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "channelCell", for: indexPath) as! ChannelCollectionViewCell
        
            cell.configure(name: ChannelNames[collectionView.tag][indexPath.item], logo:ChannelLogos[collectionView.tag][indexPath.item])
        
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        //cell?.backgroundColor = UIColor.lightGray
        cell?.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            //cell?.backgroundColor = UIColor.clear
           cell?.alpha = 1
        }, completion: nil)

        self.addMiniPlayerViewController()
        playDelegate?.play(channelName: ChannelNames[collectionView.tag][indexPath.item], logo: ChannelLogos[collectionView.tag][indexPath.item], urlString: ChannelURLs[collectionView.tag][indexPath.item])
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/3.5, height: UIScreen.main.bounds.height/3.5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func addMiniPlayerViewController(){
        
        let mTabBarController = self.tabBarController as! GeneralTabBarViewController
        let miniPlayerVC = mTabBarController.miniPlayerVC
        playDelegate = miniPlayerVC
        //self.tabBarController?.tabBar.addSubview(minPlayerVC!.view)
        //self.view.addSubview(miniPlayerVC!.view)
        UIApplication.shared.keyWindow?.addSubview(miniPlayerVC!.view)
       
    }
    
}

