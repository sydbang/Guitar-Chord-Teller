//
//  BannerAd.swift
//  ChordTeller
//
//  Created by Sunghee Bang on 2021-11-29.
//

import SwiftUI
import GoogleMobileAds
import UIKit

struct BannerAd: UIViewControllerRepresentable {
    let adUnitId: String
    
    init(adUnitId: String) {
        self.adUnitId = adUnitId
    }
    
    
    func makeUIViewController(context: Context) -> BannerAdVC {
        return BannerAdVC(adUnitId: adUnitId)
    }

    func updateUIViewController(_ uiViewController: BannerAdVC, context: Context) {
        
    }
}
