//
//  InquireDepositorModel.swift
//  NHBankFundManagemnet
//
//  Created by 이영재 on 2021/08/16.
//

//MARK: - 예금주 조회 Model
struct InquireDepositorRequestHeader: Codable {
    //Properties
    let ApiNm: String   //API명
    let Tsymd: String   //전송일자
    let Trtm: String    //전송시각
    let Iscd: String    //기관코드
    let FintechApsno: String    //핀테크 앱 일련번호
    let ApiSvcCd: String    //API서비스코드
    let IsTuno: String  //기관거래고유번호
    let AccessToken: String //인증키
}

struct InquireDepositorRequestData: Codable {
    //Properties
    let Header: InquireDepositorRequestHeader   //Header
    let Bncd: String    //은행코드
    let Acno: String    //계좌번호
}

struct InquireDepositorResponseHeader: Decodable {
    //Properties
    let Trtm: String?   //전송시각
    let Rsms: String?   //응답메세지
    let ApiNm: String?  //API명
    let IsTuno: String? //기관거래고유번호
    let Tsymd: String?  //전송일자
    let FintechApsno: String?   //핀테크 앱 일련번호
    let Iscd: String?   //기관코드
    let Rpcd: String?   //응답코드
    let ApiSvcCd: String?   //API서비스코드
}

struct InquireDepositorResponseData: Decodable {
    let Header: InquireDepositorResponseHeader? //Header
    let Bncd: String?   //은행코드
    let Dpnm: String?   //예금주명
    let Acno: String?   //계좌번호
}
