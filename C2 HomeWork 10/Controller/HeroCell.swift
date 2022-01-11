//
//  HeroCell.swift
//  C2 HomeWork 10
//
//  Created by Вадим on 21/10/2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import UIKit

class HeroCell: UITableViewCell {
    
    
    @IBOutlet var heroNameLabel: UILabel!
    @IBOutlet var universeNameLabel: UILabel!
    @IBOutlet var heroIcon: ImageView!
    
    func configure(with hero: Hero, and iconUrl: String?) {
        heroNameLabel?.text = "\(hero.superhero ?? "superhero")"
        universeNameLabel?.text = "\(hero.publisher ?? "universe")"
        
        self.heroIcon.fetchImage(with: iconUrl)
    }
    
}
