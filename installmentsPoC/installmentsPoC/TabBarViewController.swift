//
//  TabBarTableViewController.swift
//  installmentsPoC
//
//  Created by Vitalii Terekhov on 18/01/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = ExternalViewController()
        vc1.tabBarItem = UITabBarItem(title: "External browser", image: .strokedCheckmark, tag: 0)
        
        let vc2 = WebViewViewController()
        vc2.tabBarItem = UITabBarItem(title: "Web View", image: .strokedCheckmark, tag: 1)
        
        let vc3 = SafariViewController()
        vc3.tabBarItem = UITabBarItem(title: "Safari", image: .strokedCheckmark, tag: 2)
        viewControllers = [vc1, vc2, vc3]
    }

   
}
