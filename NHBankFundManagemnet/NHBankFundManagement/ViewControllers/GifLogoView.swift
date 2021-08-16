//
//  GifLogoView.swift
//  NHBankFundManagemnet
//
//  Created by 이영재 on 2021/08/16.
//

//MARK: - Splash Logo 화면을 그리는 View
import SwiftyGif

class GifLogoView: UIView {
    //MARK: - Properites
    private var gifLogoViewModel: GifLogoViewModel!
    var gifLogoImageView: UIImageView!
    
    //MARK: - Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        GifLogoService.getGifLogo(gifName: "logo.gif") { (gifImageView) in
            guard let gifImageView = gifImageView else {
                print("Gif is empty.")
                return
            }
            self.gifLogoViewModel = GifLogoViewModel(gifImageView)
            
            self.gifLogoImageView = self.gifLogoViewModel.gifLogoImageView!
            
            self.backgroundColor = UIColor.black
            self.addSubview(self.gifLogoImageView)
            self.gifLogoImageView.translatesAutoresizingMaskIntoConstraints = false
            self.gifLogoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            self.gifLogoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            self.gifLogoImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
            self.gifLogoImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        }
    }
}

//MARK: - Extensions
extension UIView {
    func pinEdgesToSuperView() {
        guard let superView = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
    }
}
