//
//  UTCTimeRepository.swift
//  UTCTime
//
//  Created by 이영재 on 2022/01/29.
//MARK: - Repository : Server 혹은 DataBase로 부터 Entity를 가져와 Service에게 전달함.

//MARK: - Frameworks
import UIKit

//MARK: - Types
class UTCTimeRepository {
    //MARK: - Methods
    func fetchNow(onCompleted: @escaping(UTCTimeEntity) -> Void) -> Void {
        let url = "http://worldclockapi.com/api/json/utc/now"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, _ in
            guard let data = data else { return }
            guard let entity = try? JSONDecoder().decode(UTCTimeEntity.self, from: data) else { return }
            
            onCompleted(entity)
        }.resume()
    }
}
