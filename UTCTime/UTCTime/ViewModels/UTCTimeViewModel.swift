//
//  File.swift
//  UTCTime
//
//  Created by 이영재 on 2022/01/29.
//MARK: ViewModel : Service를 통해 Model을 가져와 View를 통해 화면에 보여질 Data로 변환

//MARK: - Frameworks
import UIKit

//MARK: - Types
class UTCTimeViewModel {
    //MARK: - Properties
    var onUpdated: () -> Void = {}
    
    var dateTimeString: String = "Loading..." {
        didSet {
            self.onUpdated()
        }
    }
    let utcTimeService: UTCTimeService = UTCTimeService()
    
    //MARK: - Methods
    func moveDay(day: Int) -> Void {
        self.utcTimeService.moveDay(day: day)
        self.dateTimeString = dateToString(date: self.utcTimeService.currentModel.currentDateTime)
    }
    
    func reload() -> Void {
        self.utcTimeService.fetchNow { [weak self] model in
            guard let self = self else { return }
            self.dateTimeString = self.dateToString(date: model.currentDateTime)
        }
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        
        return formatter.string(from: date)
    }
}
