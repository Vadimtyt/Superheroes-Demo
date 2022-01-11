//
//  ViewController.swift
//  C2 HomeWork 10
//
//  Created by Вадим on 17/10/2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import UIKit

class HeroViewController: UIViewController {

    var hero: Hero!
    
    @IBOutlet var imageHero: ImageView!
    @IBOutlet var unverseLabel: UILabel!
    @IBOutlet var alteEgoLabel: UILabel!
    @IBOutlet var firstAppearenceLabel: UILabel!
    @IBOutlet var charactersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitles()
        setImage()
    }

    func setTitles() {
        title = hero.superhero
        unverseLabel.text?.append(contentsOf: hero.publisher ?? "publisher")
        alteEgoLabel.text?.append(contentsOf: hero.alterEgo ?? "alter ego")
        firstAppearenceLabel.text?.append(contentsOf: hero.firstAppearance ?? "first appearence")
        charactersLabel.text?.append(contentsOf: hero.characters ?? "characters")
        
    }
    
    func setImage() {
        guard let heroName = hero.superhero else { return }
        guard let heroImageURL = picturesUrl[heroName] else { return }
        imageHero.fetchImage(with: heroImageURL)
    }
    
    let picturesUrl = ["Batman": "https://avatarfiles.alphacoders.com/210/210640.jpg",
                    "Superman": "https://lh3.googleusercontent.com/proxy/yS-XEeCKB7tSHwWzRkjA1OGi4YazVIBZVpWWUIa1opahlOXYfOyBEUYbTM-GQ4tPLYkFDEcfnSwyhK62986Ef-IU35m-cmIzPRjizajYf3yXHwCW0f_yj_Tp-SopMi4W6buF1sUbrK_tVtVZlW2sXxp55pqgSM2G97NrgAJdfGYAjc1aBUG87CZaxdV_GlJ3E6U",
                    "Flash": "https://www.coverwhiz.com/uploads/tv/The-Flash-Season-1.jpg",
                    "Green Lantern": "https://i.pinimg.com/originals/d7/4b/59/d74b5993ec9f0fa66f496d2272a0e6ce.jpg",
                    "Green Arrow": "https://images.thenile.io/r1000/0696198760804.jpg",
                    
                    "Wonder Woman": "https://images6.fanpop.com/image/photos/39900000/Gal-Gadot-as-Diana-Prince-in-Wonder-Woman-gal-gadot-39987709-1000-1000.jpg",
                    "Martian Manhunter": "https://www.sideshow.com/storage/product-images/906409/martian-manhunter_dc-comics_gallery_5ebaecbdc378f.jpg",
                    "Robin/Nightwing": "https://ae01.alicdn.com/kf/HTB1OVy1h97PL1JjSZFHq6AciXXaZ.jpg?size=103768&height=1000&width=1000&hash=e0a0d30ac9e47009f07099c565a06be2",
                    "Blue Beetle": "https://i.pinimg.com/originals/19/88/06/19880620dc398bcdc99d365272344e1f.jpg",
                    "Black Canary": "https://cdna.artstation.com/p/assets/images/images/028/241/640/large/supear-cartoonizer-blackcanary.jpg?1593888198",
                    
                    "Spider Man": "https://avatarfiles.alphacoders.com/215/215808.png",
                    "Captain America": "https://unicun.com/wp-content/uploads/2019/12/Captain-America-Premium-Format-Figure.jpg",
                    "Iron Man": "https://marveltoynews.com/wp-content/uploads/2019/08/Iron-Studios-Avengers-Endgame-I-Am-Iron-Man-BDS-Statue.jpg",
                    "Thor": "https://images.gmanews.tv/v3/webpics/v3/2013/09/2013_09_27_20_07_43.jpg",
                    "Hulk": "https://i.pinimg.com/originals/87/ec/aa/87ecaab15173be74ba8f14c5f7f869e4.jpg",
                    
                    "Wolverine": "https://www.kindpng.com/picc/m/116-1162734_clipart-resolution-15001000-x-men-origins-wolverine-png.png",
                    "Daredevil": "https://images.squarespace-cdn.com/content/v1/5c255eb7266c07c02ba1310d/1552870628484-KUMIFUF4QWDT4X13L8DX/ke17ZwdGBToddI8pDm48kPJXHKy2-mnvrsdpGQjlhod7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmihaE5rlzFBImxTetd_yW5btdZx37rH5fuWDtePBPDaHF5LxdCVHkNEqSYPsUQCdT/daredevil.jpg",
                    "Hawkeye": "https://i.pinimg.com/originals/ee/73/0f/ee730ff7e7b0e6dc0cae45ac3781f81f.png",
                    "Cyclops": "https://i.pinimg.com/originals/c0/e8/ab/c0e8ab9890476c80d0da26c016497e35.png",
                    "Silver Surfer": "https://i.redd.it/qszwjydl3dk41.jpg"]
}
