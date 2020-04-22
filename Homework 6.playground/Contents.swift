import UIKit

class Company {
    var companyName: String
    var establishedIn: Int
    var headOffice: String
    var founders: [String]
    let date = Date()
    let calendar = Calendar.current
    var year: Int
    
    init(companyName: String,establishedIn: Int,headOffice: String,founders: [String],year: Int) {
        self.companyName = companyName
        self.establishedIn = establishedIn
        self.headOffice = headOffice
        self.founders = founders
        self.year = calendar.component(.year, from: date)
        
    }
}
//APPLE
class Apple: Company {
    var systemUsing: String = "IOS"
    
    init() {
        super.init(companyName: "Apple", establishedIn: 1976, headOffice: "California", founders: ["steve jobs", "Steve Wozniak","Ronald Wayne"], year : 0)
    }

    
    func Info() {
        print("CompanyName: \(companyName) \nEstablishedIn: \(establishedIn) \nHeadpffice: \(headOffice) \nManufacturer: \(founders[0]), \(founders[1]), \(founders[2]) \nSystemUsing: \(systemUsing) \nAge: \(year - establishedIn)")
    }
    
}
//GOOGLE
class Google: Company {
    var systemUsing: String = "Android"

    init() {
        super.init(companyName: "Google", establishedIn: 1998, headOffice: "California", founders: ["Larry Page", "sergey Brin"],year: 0)
    }

    func Info() {
        print("CompanyName: \(companyName) \nEstablishedIn: \(establishedIn) \nHeadpffice: \(headOffice) \nManufacturer: \(founders[0]), \(founders[1]) \nSystemUsing: \(systemUsing) \nAge: \(year - establishedIn)")
    }

}

//FACEBOOK
class Facebook: Company {
    init() {
        super.init(companyName: "Fcebook", establishedIn: 2004, headOffice: "California", founders: ["Mark Zuckerberg", "Dustin Moskovitz"],year: 0)
    }

    func Info() {
        print("CompanyName: \(companyName) \nEstablishedIn: \(establishedIn) \nHeadpffice: \(headOffice) \nManufacturer: \(founders[0]), \(founders[1]) \nAge: \(year - establishedIn)")
    }

}



let apple = Apple()
let google = Google()
let facebook = Facebook()

apple.Info()

print("------")
google.Info()
print("------")
facebook.Info()


