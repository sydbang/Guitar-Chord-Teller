//
//  AppDelegate.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2021-11-29.
//

import Foundation
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    GADMobileAds.sharedInstance().start(completionHandler: nil)

    return true
  }

}
