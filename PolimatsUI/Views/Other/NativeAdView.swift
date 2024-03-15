//
//  NativeAdView.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 5.03.2024.
//

import SwiftUI
import UIKit
import GoogleMobileAds

struct NativeAdView: UIViewRepresentable {
    
    typealias UIViewType = GADNativeAdView
    
    @ObservedObject var nativeAdViewModel: ViewModelAd
    
    func makeUIView(context: Context) -> GADNativeAdView {
        // Link the outlets to the views in the GADNativeAdView.
        
         return Bundle.main.loadNibNamed("NativeAdView", owner: nil, options: nil)?.first as! GADNativeAdView
    }
    
    func updateUIView(_ nativeAdView: GADNativeAdView, context: Context) {
        guard let nativeAd = nativeAdViewModel.nativeAd else { return }
        
        // Work with your native ad.
        nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent
        (nativeAdView.bodyView as? UILabel)?.text = nativeAd.body
        
        (nativeAdView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)
        (nativeAdView.iconView as? UIImageView)?.image = nativeAd.icon?.image
        nativeAdView.starRatingView?.isHidden = nativeAd.starRating == nil
        (nativeAdView.storeView as? UILabel)?.text = nativeAd.store
        (nativeAdView.priceView as? UILabel)?.text = nativeAd.price
        (nativeAdView.advertiserView as? UILabel)?.text = nativeAd.advertiser
        nativeAdView.callToActionView?.isUserInteractionEnabled = false
        (nativeAdView.headlineView as? UILabel)?.text = nativeAd.headline
        nativeAdView.nativeAd = nativeAd

        
    }
}
