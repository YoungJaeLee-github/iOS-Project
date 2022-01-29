//
//  UTCTimeService.swift
//  UTCTime
//
//  Created by 이영재 on 2022/01/29.
//MARK: - Service : Business Logic을 수행하며, Model을 ViewModel에게 전달함

//MARK: - Frameworks
import UIKit

//MARK: - Types
class UTCTimeService {
    //MARK: - Properties
    let utcTimeRepository: UTCTimeRepository = UTCTimeRepository()
    var currentModel: UTCTimeModel = UTCTimeModel(currentDateTime: Date())
    
    //MARK: - Methods
    func fetchNow(onCompleted: @escaping(UTCTimeModel) -> Void) -> Void {
        utcTimeRepository.fetchNow { [weak self] entity in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
            
            guard let now = formatter.date(from: entity.currentDateTime) else { return }
            let model = UTCTimeModel(currentDateTime: now)
            self?.currentModel = model
            
            onCompleted(model)
        }
    }
    
    func moveDay(day: Int) -> Void {
        guard let movedDay = Calendar.current.date(byAdding: .day, value: day, to: self.currentModel.currentDateTime) else {
            return
        }
        
        self.currentModel.currentDateTime = movedDay  
    }
    
    func reload() -> Void {
        
    }
}
