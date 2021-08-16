//
//  InquireDepositorService.swift
//  NHBankFundManagemnet
//
//  Created by 이영재 on 2021/08/16.
//

//MARK: - 예금주 조회 business logic 담당 API 호출
import Foundation

class InquireDepositorService {
    //Type Method
    static func getInquireDepositor(apiNm: String, tsymd: String, trtm: String, iscd: String, fintechApsno: String, apiSvcCd: String, isTuno: String, accessToken: String, bncd: String, acno: String, completion: @escaping (InquireDepositorResponseData?) -> ()) -> Void {
        
        //요청 header
        let requestHeader = InquireDepositorRequestHeader(ApiNm: apiNm, Tsymd: tsymd, Trtm: trtm, Iscd: iscd, FintechApsno: fintechApsno, ApiSvcCd: apiSvcCd, IsTuno: isTuno, AccessToken: accessToken)
        //요청 paramater
        let requestData = InquireDepositorRequestData(Header: requestHeader, Bncd: bncd, Acno: acno)
        
        guard let uploadData = try? JSONEncoder().encode(requestData) else {
            return
        }
        
        //요청 url
        let url = URL(string: "https://developers.nonghyup.com/InquireDepositorAccountNumber.nh")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //정상적으로 응답이 넘어온 경우 responseData json struct을 view(viewController)에게 넘김.
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let responseData = try? JSONDecoder().decode(InquireDepositorResponseData.self, from: data)
                if let responseData = responseData {
                    completion(responseData)
                }
            }
        }
        
        task.resume()
    }
}

