//
//  GuitarChordTellerApp.swift
//  GuitarChordTeller
//
//  Created by Sunghee Bang on 2021-09-13.
//

import SwiftUI
import AppTrackingTransparency
import GoogleMobileAds

@main
struct GuitarChordTellerApp: App {
    var guitarChordModel = GuitarChordModel()
    
    //Use init() in place of ApplicationDidFinishLaunchWithOptions in App Delegate
    init() {
        if ATTrackingManager.trackingAuthorizationStatus == .notDetermined {
            //User has not indicated their choice for app tracking
            //You may want to show a pop-up explaining why you are collecting their data
            //Toggle any variables to do this here
        } else {
            ATTrackingManager.requestTrackingAuthorization { status in
                //Whether or not user has opted in initialize GADMobileAds here it will handle the rest
                                                            
                GADMobileAds.sharedInstance().start(completionHandler: nil)
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(guitarChordModel)
        }
    }
}
