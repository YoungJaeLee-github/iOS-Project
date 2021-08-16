//
//  GifLogoService.swift
//  NHBankFundManagemnet
//
//  Created by 이영재 on 2021/08/16.
//

//MARK: - Splash Logo Business Logic 담당.
import SwiftyGif

class GifLogoService {
    //Type Method
    static func getGifLogo(gifName: String, completion: @escaping(GifLogo?) -> ()) {
        guard let gifImageView = try? GifLogo.init(gifLogoImageView: UIImageView(gifImage: UIImage(gifName: gifName), loopCount: 1)) else {
            completion(nil)
            return
        }
        
        completion(gifImageView)
    }
}
