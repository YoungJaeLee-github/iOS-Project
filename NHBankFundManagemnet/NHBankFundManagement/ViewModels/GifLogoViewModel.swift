//
//  GifLogoViewModel.swift
//  NHBankFundManagemnet
//
//  Created by 이영재 on 2021/08/16.
//

//MARK: - Splash Gif Logo ViewModel
import SwiftyGif

struct GifLogoViewModel {
    //Properties
    private let gifLogo: GifLogo
}

extension GifLogoViewModel {
    //Initializer
    init(_ gifLogo: GifLogo) {
        self.gifLogo = gifLogo
    }
}

extension GifLogoViewModel {
    //Read-Only Computed Properties
    var gifLogoImageView: UIImageView? {
        return self.gifLogo.gifLogoImageView
    }
}
