//
//  Model.swift
//  C2 HomeWork 10
//
//  Created by Вадим on 17/10/2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import Foundation

class Hero: Decodable {
    let superhero: String?
    let publisher: String?
    let alterEgo: String?
    let firstAppearance: String?
    let characters: String?
}

class HeroesData: Decodable {
    let heroes: [Hero]?
}

