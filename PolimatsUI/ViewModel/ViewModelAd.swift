//
//  ViewModelAd.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 5.03.2024.
//

import SwiftUI
import GoogleMobileAds

class ViewModelAd: NSObject, ObservableObject, GADNativeAdLoaderDelegate {
    
    @Published var nativeAd: GADNativeAd?
    private var adLoader: GADAdLoader!
    let multipleAdOptions = GADMultipleAdsAdLoaderOptions()
    
    
    func refreshAd() {
        multipleAdOptions.numberOfAds = 5;
        adLoader = GADAdLoader(
            adUnitID:
                "ca-app-pub-6847130714342539/9600935458",
            rootViewController: nil,
            adTypes: [.native], options: [ multipleAdOptions ])
        adLoader.delegate = self
        adLoader.load(GADRequest())
    }
    
    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
        self.nativeAd = nativeAd
    }
    
    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
        print("\(adLoader) failed with error: \(error.localizedDescription)")
    }
    
    func nativeAdDidRecordClick(_ nativeAd: GADNativeAd) {
        print("\(#function) called")
    }
    
    func nativeAdDidRecordImpression(_ nativeAd: GADNativeAd) {
        print("\(#function) called")
    }
    
    func nativeAdWillPresentScreen(_ nativeAd: GADNativeAd) {
        print("\(#function) called")
    }
    
    func nativeAdWillDismissScreen(_ nativeAd: GADNativeAd) {
        print("\(#function) called")
    }
    
    func nativeAdDidDismissScreen(_ nativeAd: GADNativeAd) {
        print("\(#function) called")
    }
}
