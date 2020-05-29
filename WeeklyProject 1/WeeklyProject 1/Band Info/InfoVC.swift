//
//  InfoVC.swift
//  WeeklyProject 1
//
//  Created by Luka Alimbarashvili on 5/26/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import SafariServices

class InfoVC: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var youtubeButton: UIButton!
    
    var tempInfo = ""
    var tempBand :String?
    
    let LedZeppelin      = URL(string: "https://www.youtube.com/watch?v=kEGuHdKn0Lc&list=PLZKgz45z8N33pvyfu5RmtRSQG5TMo3RC-")
    let TheBeatles       = URL(string: "https://www.youtube.com/watch?v=2Q_ZzBGPdqE&list=PL5uLaJGLPi3zJJYrcnoBSDdhHVsgVnNQ3")
    let PinkFloyd        = URL(string: "https://www.youtube.com/watch?v=_FrOQC-zEog&list=PL1tiBqitg38_Rsqb2qiTvm3hKX2Y2qUgg")
    let Queen            = URL(string: "https://www.youtube.com/watch?v=-tJYN-eG1zk&list=PL718D16542AE44430")
    let Metallica        = URL(string: "https://www.youtube.com/watch?v=6Pwf3vYNSsk&list=PLfqlpuz-LWL28EHinbSqNhj2nFZS-WQ-I&index=4")
    let ACDC             = URL(string: "https://www.youtube.com/watch?v=v2AC41dglnM&list=PLQlc99hV-nkGWDaG-gJxwOfqp8jxyHaaQ")
    let TheRollingStones = URL(string: "https://www.youtube.com/watch?v=O4irXQhgMqg&list=PLP02sRgldWRb9LjuQgJ4AfxCd4cxygDrA")
    let GunsNRoses       = URL(string: "https://www.youtube.com/watch?v=o1tj2zJ2Wvg&list=PLA8ACC4996D23A2D1")
    let Nirvana          = URL(string: "https://www.youtube.com/watch?v=hTWKbfoikeg&list=PLF1D793B61571DD4A")
    let TheWho           = URL(string: "https://www.youtube.com/watch?v=x2KRpRMSu4g&list=PLB2359E68D19BA3C0")
    let BlackSabbath     = URL(string: "https://www.youtube.com/watch?v=uk_wUT1CvWM&list=PLQjNsI6Dpg10hTiMVtuHsPw_4CFM-i828")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = tempInfo
        youtubeButton.layer.cornerRadius = 10
    }
    
    @IBAction func goToYoutubeLink(_ sender: Any) {
        
        switch tempBand {
            
        case "Led Zeppelin":
            let safari = SFSafariViewController(url: LedZeppelin!)
            present(safari, animated: true)
        case "The Beatles":
            let safari = SFSafariViewController(url: TheBeatles!)
            present(safari, animated: true)
        case "Pink Floyd":
            let safari = SFSafariViewController(url: PinkFloyd!)
            present(safari, animated: true)
        case "Queen":
            let safari = SFSafariViewController(url: Queen!)
            present(safari, animated: true)
        case "Metallica":
            let safari = SFSafariViewController(url: Metallica!)
            present(safari, animated: true)
        case "AC/DC":
            let safari = SFSafariViewController(url: ACDC!)
            present(safari, animated: true)
        case "TheRollingStones":
            let safari = SFSafariViewController(url: TheRollingStones!)
            present(safari, animated: true)
        case "GunsNRoses":
            let safari = SFSafariViewController(url: GunsNRoses!)
            present(safari, animated: true)
        case "Nirvana":
            let safari = SFSafariViewController(url: Nirvana!)
            present(safari, animated: true)
        case "TheWho":
            let safari = SFSafariViewController(url: TheWho!)
            present(safari, animated: true)
        case "BlackSabbath":
            let safari = SFSafariViewController(url: BlackSabbath!)
            present(safari, animated: true)
        default:
            print("ERROR !")
        }
       
    }
}
