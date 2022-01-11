//
//  TableViewController.swift
//  C2 HomeWork 10
//
//  Created by Вадим on 18/10/2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    private var heroes: [Hero] = []
    
    private let heroesURL = "https://gist.githubusercontent.com/mariodev12/a923f2b651a005ca3ca7f851141efcbc/raw/39b06a32e4a58fc1fe63c7478a97edccd21138f1/superheroes.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return heroes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroCell", for: indexPath) as! HeroCell
        
        let hero = heroes[indexPath.row]
        guard let heroName = hero.superhero else { return cell }
        
        cell.configure(with: hero, and: iconsUrl[heroName])
        
        return cell
    }
    
    func fetchData() {
        guard let url = URL(string: heroesURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.heroes = try decoder.decode([Hero].self, from: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("ERROR", error)
            }
            }.resume()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let HeroVC = segue.destination as! HeroViewController
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        HeroVC.hero = heroes[indexPath.row]
    }
    
    let iconsUrl = ["Batman": "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRLMTUUoqhIPr-PzPAUyIlJT00gA1SFGEjjfg&usqp=CAU",
                    "Superman": "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRVV_nTvPaHUIQT4Vp_UQliATwmDPe0BFvWsw&usqp=CAU",
        "Flash": "https://cdn0.iconfinder.com/data/icons/famous-character-vol-1-colored/48/JD-18-512.png",
        "Green Lantern": "https://cdn0.iconfinder.com/data/icons/movies-11/32/green_lantern_superhero_character_movie_avatar_comics-512.png",
        "Green Arrow": "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS9CHd7ytS7JAsG0Mg5r-W98N2AyKHfdbirmw&usqp=CAU",
                    
        "Wonder Woman": "https://cdn2.iconfinder.com/data/icons/famous-characters/24/wonder-woman-512.png",
        "Martian Manhunter": "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRfvo1GzRKD9i9l7SWhTuNCZwFNGEOn78jHog&usqp=CAU",
        "Robin/Nightwing": "https://cdn1.iconfinder.com/data/icons/user-pop-culture/512/Robin-256.png",
        "Blue Beetle": "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQaQeidyW1DMM7EOudUxHhhUc4f0dRqM5mxRQ&usqp=CAU",
        "Black Canary": "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTNEWMy5a54jUeAalCZLvUMul_7_7cjO7xy_w&usqp=CAU",
                    
        "Spider Man": "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTTEAmPUO3H6gfKsF3iY_X-gAT0cLt5brQNKA&usqp=CAU",
        "Captain America": "https://cdn1.iconfinder.com/data/icons/user-pop-culture/512/Cap-256.png",
        "Iron Man": "https://cdn0.iconfinder.com/data/icons/superhero-2/256/Ironman-256.png",
        "Thor": "https://cdn0.iconfinder.com/data/icons/famous-character-vol-1-colored/48/JD-20-512.png",
        "Hulk": "https://cdn4.iconfinder.com/data/icons/movies-2-flat/60/068_-_Hulk-256.png",
                    
        "Wolverine": "https://cdn1.iconfinder.com/data/icons/people-avatars-23/24/people_avatar_head_wolverine_logan_xman_marvel-256.png",
        "Daredevil": "https://cdn0.iconfinder.com/data/icons/famous-character-vol-1-colored/48/JD-11-256.png",
        "Hawkeye": "https://cdn0.iconfinder.com/data/icons/famous-character-vol-1-colored/48/JD-08-256.png",
        "Cyclops": "https://cdn0.iconfinder.com/data/icons/famous-character-vol-1-colored/48/JD-28-256.png",
        "Silver Surfer": "https://cdn1.iconfinder.com/data/icons/UltraBuuf/256/Silver_Surfer.png"]
    
}
