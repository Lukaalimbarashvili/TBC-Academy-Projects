//
//  movies.swift
//  Homework 48
//
//  Created by Luka Alimbarashvili on 6/24/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

struct movie {
    let name        :String
    let image       :UIImage
    let description :String
}


let batman = movie(name: "Batman Begins", image: #imageLiteral(resourceName: "batman"), description: "The origins of the Caped Crusader of Gotham City are finally brought to the big screen in this new adaptation of the perennially popular comic-book series. The young Bruce Wayne (Gus Lewis) leads a privileged life as the son of wealthy, philanthropist parents.")


let inception = movie(name: "Inception", image: #imageLiteral(resourceName: "inception"), description: "Visionary filmmaker Christopher Nolan (Memento, The Dark Knight) writes and directs this psychological sci-fi action film about a thief who possesses the power to enter into the dreams of others. Dom Cobb (Leonardo DiCaprio) doesn't steal things, he steals ideas. By projecting himself deep into the subconscious of his targets, he can glean information that even the best computer hackers can't get to. In the world of corporate espionage, Cobb is the ultimate weapon. But even weapons have their weakness, and when Cobb loses everything, he's forced to embark on one final mission in a desperate quest for redemption.")


let fightclub = movie(name: "Fight Club", image: #imageLiteral(resourceName: "fightclub"), description: "In this darkly comic drama, Edward Norton stars as a depressed young man (named in the credits only as \"Narrator\") who has become a small cog in the world of big business. He doesn't like his work and gets no sense of reward from it, attempting instead to drown his sorrows by putting together the \"perfect\" apartment. He can't sleep and feels alienated from the world at large; he's become so desperate to relate to others that he's taken to visiting support groups for patients with terminal diseases so that he'll have people to talk to. One day on a business flight, he discovers Tyler Durden (Brad Pitt), a charming iconoclast who sells soap. Tyler doesn't put much stock in the materialistic world, and he believes that one can learn a great deal through pain, misfortune, and chaos. Tyler cheerfully challenges his new friend to a fight.")


let ironman = movie(name: "Iron Man", image: #imageLiteral(resourceName: "ironman"), description: "Billionaire industrialist and genius inventor Tony Stark is kidnapped and forced to build a devastating weapon. Instead, using his intelligence and ingenuity, Tony builds a high-tech suit of armor and escapes captivity. When he uncovers a nefarious plot with global implications, he dons his powerful armor and vows to protect the world as Iron Man.")


let allMovie = [batman,fightclub,inception,ironman]
