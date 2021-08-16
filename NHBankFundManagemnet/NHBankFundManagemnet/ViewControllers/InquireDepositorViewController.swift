//
//  ViewController.swift
//  NHBankFundManagemnet
//
//  Created by 이영재 on 2021/08/16.
//

//MARK: - 예금주 조회 View(ViewController)
import UIKit
import SwiftyGif

class InquireDepositorViewController: UIViewController {
    //MARK: - Properties
    private let gifLogoView = GifLogoView()
    private var inquireDepositorViewModel: InquireDepositorViewModel!
    private let apiNm: String = "InquireDepositorAccountNumber"
    private let tsymd: String = "20210816"
    private let trtm: String = "003544"
    private let iscd: String = "001052"
    private let fintechApsno:String = "001"
    private let apiSvcCd: String = "DrawingTransferA"
    private let isTuno: String = "20210816333333333"
    private let accessToken: String = "c5ade183e6c2d34e92aa0544a2ac35941fa1a24fc668a87897004f7b1d6b2e72"
    private let bncd: String = "011"
    
    @IBOutlet weak var inputAccountNumberTextField: UITextField!
    @IBOutlet weak var bncdLabel: UILabel!
    @IBOutlet weak var acnoLabel: UILabel!
    @IBOutlet weak var dpnmLabel: UILabel!
    @IBOutlet weak var inquireDepositorButton: UIButton!
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(gifLogoView)
        gifLogoView.pinEdgesToSuperView()
        gifLogoView.gifLogoImageView.delegate = self
        inputAccountNumberTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gifLogoView.gifLogoImageView.startAnimating()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @IBAction func requestInquireDepositorButton(_ sender: Any) {
        guard let acno = inputAccountNumberTextField.text else {
            print("Acno is empty.")
            return
        }
        
        //예금주 조회 API 호출 후 화면에 view를 그림.
        InquireDepositorService.getInquireDepositor(apiNm: apiNm, tsymd: tsymd, trtm: trtm, iscd: iscd, fintechApsno: fintechApsno, apiSvcCd: apiSvcCd, isTuno: isTuno, accessToken: accessToken, bncd: bncd, acno: acno) { (responseData) in
            
            if let responseData = responseData {
                self.inquireDepositorViewModel = InquireDepositorViewModel(responseData)
            }
            DispatchQueue.main.async {
                guard let responseHeader = responseData?.Header else {
                    print("Response header is empty.")
                    return
                }
                
                guard let responseBncd = responseData?.Bncd else {
                    print(responseHeader)
                    return
                }
                
                guard let responseAcno = responseData?.Acno else {
                    print(responseHeader)
                    return
                }
                
                guard let responseDpnm = responseData?.Dpnm else {
                    print(responseHeader)
                    return
                }
                
                self.bncdLabel.text = responseBncd
                self.acnoLabel.text = responseAcno
                self.dpnmLabel.text = responseDpnm
            }
        }
    }
}

//MARK: - Extensions
extension InquireDepositorViewController: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        gifLogoView.isHidden = true
    }
}

extension InquireDepositorViewController: UITextFieldDelegate {
    //버튼 제어
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, text.isEmpty {
            inquireDepositorButton.isEnabled = false
            inquireDepositorButton.backgroundColor = UIColor.systemGray5
        } else {
            inquireDepositorButton.isEnabled = true
            inquireDepositorButton.backgroundColor = UIColor(rgb: 0xD92B4B)
        }
    }
    
    //키보드 제어
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //글자수 제한
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else {
            return false
        }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 20
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(a) / 255.0)
    }
    
    convenience init(rgb: Int) {
        self.init(red: (rgb >> 16) & 0xFF, green: (rgb >> 8) & 0xFF, blue: rgb & 0xFF)
    }
    
    convenience init(argb: Int) {
        self.init(red: (argb >> 16) & 0xFF, green: (argb >> 8) & 0xFF, blue: argb & 0xFF, a: (argb >> 24) & 0xFF)
    }
}
