//
//  UpcomingGames.swift
//  Soccer stream
//
//  Created by Usman Qamar on 8/16/22.
//

import Foundation

// MARK: - Upcoming
struct UpcomingGames: Codable {
    let timeRequest: Double
    let capacityRequests, remainRequests, lastTimeYourKey, dateGames: String
    let gamesPre: [GamesPre]

    enum CodingKeys: String, CodingKey {
        case timeRequest = "time_request"
        case capacityRequests = "capacity_requests"
        case remainRequests = "remain_requests"
        case lastTimeYourKey = "last_time_your_key"
        case dateGames = "date_games"
        case gamesPre = "games_pre"
    }
}

// MARK: - GamesPre
struct GamesPre: Codable {
    let gameID, time, timeStatus: String
    let league, home, away: PreAway

    enum CodingKeys: String, CodingKey {
        case gameID = "game_id"
        case time
        case timeStatus = "time_status"
        case league, home, away
    }
}

// MARK: - Away
struct PreAway: Codable {
    let name, id: String
    let imageID: String?
    let cc: String

    enum CodingKeys: String, CodingKey {
        case name, id
        case imageID = "image_id"
        case cc
    }
}
