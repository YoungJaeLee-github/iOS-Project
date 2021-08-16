//
//  InquireDepositorViewModel.swift
//  NHBankFundManagemnet
//
//  Created by 이영재 on 2021/08/16.
//

//MARK: - 예금주 조회 ViewModel
struct InquireDepositorViewModel {
    //Properties
    private let inquireDepositorResponseData: InquireDepositorResponseData
}

extension InquireDepositorViewModel {
    //Initializer
    init(_ inquireDepositorResponseData: InquireDepositorResponseData) {
        self.inquireDepositorResponseData = inquireDepositorResponseData
    }
}

extension InquireDepositorViewModel {
    //Read-Only Computed Properties
    //응답헤더
    var header: InquireDepositorResponseHeader? {
        return self.inquireDepositorResponseData.Header
    }
    //은행코드
    var bncd: String? {
        return self.inquireDepositorResponseData.Bncd
    }
    //예금주명
    var dpnm: String? {
        return self.inquireDepositorResponseData.Dpnm
    }
    //계좌번호
    var acno: String? {
        return self.inquireDepositorResponseData.Acno
    }
}
