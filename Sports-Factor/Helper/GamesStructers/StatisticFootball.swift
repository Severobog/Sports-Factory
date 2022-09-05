//
//  Statistic.swift
//  Sports-Factor
//
//  Created by Демид Стариков on 04.09.2022.
//

import Foundation

// MARK: - Statistic
struct soccerStat: Codable {
    let results: [StatPre]

    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct StatPre: Codable {
    let stats: Stat
    
    enum CodingKeys: String, CodingKey {
        case stats
    }
}

struct Stat: Codable {
    let attacks, corners, dangerousAttacks, penalties, possessionRt, substitutions, redcards, yellowcards, goals: [String]?
    
    enum CodingKeys: String, CodingKey {
        case attacks //Атаки по воротам - Blows
        case corners //Угловые - corner
        case goals //Голы
        case dangerousAttacks = "dangerous_attacks" //Опасные атаки?)
        case penalties //Пенальти - fouls
        case possessionRt = "possession_rt" //Владение мячом в процентах
        case redcards //Красные карточки
        case substitutions //Замены
        case yellowcards //Желтые карточки
    }
}

