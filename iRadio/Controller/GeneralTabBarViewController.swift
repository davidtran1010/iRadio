//
//  GeneralTabBarViewController.swift
//  iRadio
//
//  Created by DavidTran on 4/15/18.
//  Copyright © 2018 DavidTran. All rights reserved.
//

import UIKit

class GeneralTabBarViewController: UITabBarController {
    var miniPlayerVC:MiniPlayerController?
    override func viewDidLoad() {
        super.viewDidLoad()

        miniPlayerVC = storyboard?.instantiateViewController(withIdentifier: "miniPlayerVCIndentity") as? MiniPlayerController
        let tabBarHeight = tabBar.frame.height
        let tabBarWidth = tabBar.frame.width
        let tabBarMinY = tabBar.frame.minY
        
        // If IPhone X Screen
        if UIScreen.main.nativeBounds.height == 2436{
            miniPlayerVC?.view.frame = CGRect(x: 0, y: tabBarMinY - tabBarHeight-34, width: tabBarWidth, height: tabBarHeight)
        }else{
            miniPlayerVC?.view.frame = CGRect(x: 0, y: tabBarMinY - tabBarHeight, width: tabBarWidth, height: tabBarHeight)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
