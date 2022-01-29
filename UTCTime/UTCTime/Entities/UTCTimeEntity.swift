//
//  UTCTimeEntity.swift
//  UTCTime
//
//  Created by 이영재 on 2022/01/29.
//MARK: - Entity : Server 혹은 DataBase의 원천 Data

//MARK: - Frameworks
import UIKit

//MARK: - Types
struct UTCTimeEntity: Codable {
    //MARK: - Properties
    let id: String
    let currentDateTime: String
    let utcOffset: String
    let isDayLightSavingsTime: Bool
    let dayOfTheWeek: String
    let timeZoneName: String
    let currentFileTime: Int
    let ordinalDate: String
    let serviceResponse: String?
    
    //MARK: - Nested Types
    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case currentDateTime
        case utcOffset
        case isDayLightSavingsTime
        case dayOfTheWeek
        case timeZoneName
        case currentFileTime
        case ordinalDate
        case serviceResponse
    }
}
