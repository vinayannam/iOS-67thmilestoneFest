//
//  Model.swift
//  Fest_1
//
//  Created by A.S.D.Vinay on 01/02/17.
//  Copyright © 2017 A.S.D.Vinay. All rights reserved.
//

import UIKit



class FestCategory: NSObject{
    
    var name: String?
    var fests: [Fest]?
    
     static func sampleFestCategories()->[FestCategory]{
        
        var categories = [FestCategory]()
        
        
        let technicalFestCategory = FestCategory()
        technicalFestCategory.name = "Technical Events"
        var technicalFests = [Fest]()
        
        
        let robotskriegFest = Fest()
        
        robotskriegFest.name = "Robots Krieg"
        robotskriegFest.category = "Technical"
        robotskriegFest.imageName = "RobotsKrieg"
        
        technicalFests.append(robotskriegFest)
       
        
        let matlabQuestFest = Fest()
        
        matlabQuestFest.name = "Matlab Quest"
        matlabQuestFest.category = "Technical"
        matlabQuestFest.imageName = "MatlabQuest"
        
        technicalFests.append(matlabQuestFest)
        
        let linefollowerFest = Fest()
        
        linefollowerFest.name = "Line Follower"
        linefollowerFest.category = "Technical"
        linefollowerFest.imageName = "MazeSolver"
        
        technicalFests.append(linefollowerFest)
        
        let robosoccerFest = Fest()
        
        robosoccerFest.name = "Robo Soccer"
        robosoccerFest.category = "Technical"
        robosoccerFest.imageName = "RoboSoccer"
        technicalFests.append(robosoccerFest)
        
        let hackathonFest = Fest()
        
        hackathonFest.name = "Hackathon"
        hackathonFest.category = "Flagship & Technical"
        hackathonFest.imageName = "Hackathon"
        hackathonFest.festBannerImageName = "Hackathon-1"
        hackathonFest.desc = "Someone once said, if you give a toy to a hacker, the first thing he'll do is to take it apart. If you are one of them who think this way, Hackathon is the perfect event for you at 67th Milestone. This is a 48 hour event where you need to build a prototype of a product within 48 hours, involving any software and hardware requirements there may be. You may make a fully software based product or a fully hardware hased product or mix them up to your choice. More details will be available soon prior to the event."
        hackathonFest.rules = "Go and play"
        
        technicalFests.append(hackathonFest)
        
        let ecocartFest = Fest()
        
        ecocartFest.name = "EcoKart"
        ecocartFest.category = "Flagship & Technical"
        ecocartFest.imageName = "EcoKart"
        
        technicalFests.append(ecocartFest)
        
    
        let nerdparadiseFest = Fest()
        
        nerdparadiseFest.name = "Nerd Paradise"
        nerdparadiseFest.category = "Technical"
        nerdparadiseFest.imageName = "NerdParadise"
        
        technicalFests.append(nerdparadiseFest)
        
        let mechathingFest = Fest()
        
        mechathingFest.name = "MechaThing"
        mechathingFest.category = "Technical"
        mechathingFest.imageName = "MechaThing"
        
        technicalFests.append(mechathingFest)
        
        
        
        technicalFestCategory.fests = technicalFests
        
        let flagshipFestCategory = FestCategory()
        flagshipFestCategory.name = "Flagship Events"
        var flagshipFests = [Fest]()
        
        
        
        flagshipFests.append(hackathonFest)
        flagshipFests.append(ecocartFest)
        
        let voguecraveFest = Fest()
        
        voguecraveFest.name = "Vogue Crave"
        voguecraveFest.category = "Flagship"
        voguecraveFest.imageName = "FashionCompetition"
        voguecraveFest.festBannerImageName = "FashionCompetition-2"
        voguecraveFest.desc = "The Fashion Craze provides you with the chance to impress the audience with your style and confidence. Bring on the best dress and let your performance define the theme for its time to live your runaway dream.\n*Competition is open for both boys & girls."
        
        flagshipFests.append(voguecraveFest)
        
        let phantomonicaFest = Fest()
        
        phantomonicaFest.name = "The Theatre Phantamonica"
        phantomonicaFest.category = "Flagship"
        phantomonicaFest.imageName = "TheTheatrePhantamonica"
        
        flagshipFests.append(phantomonicaFest)
        
        let nitrosurge = Fest()
        
        nitrosurge.name = "Nitro Surge"
        nitrosurge.category = "Flagship"
        nitrosurge.imageName = "NitroSurge"
        
        flagshipFests.append(nitrosurge)
        
        let bmupitchersFest = Fest()
        
        bmupitchersFest.name = "BMU Pitchers"
        bmupitchersFest.category = "Flagship"
        bmupitchersFest.imageName = "BMUPitchers"
        
        flagshipFests.append(bmupitchersFest)
        
        let bandsFest = Fest()
        
        bandsFest.name = "Battle Of The Bands"
        bandsFest.category = "Flagship"
        bandsFest.imageName = "BattleOfTheBands"
        
        flagshipFests.append(bandsFest)
        
        let streetFest = Fest()
        
        streetFest.name = "Beat The Street"
        streetFest.category = "Flagship"
        streetFest.imageName = "BeatTheStreet"
        
        flagshipFests.append(streetFest)
        
        flagshipFestCategory.fests = flagshipFests
        
        let culturalFestCategory = FestCategory()
        culturalFestCategory.name = "Cultural Events"
        var culturalFests = [Fest]()
        
        let wallgraffitiFest = Fest()
        
        wallgraffitiFest.name = "Wall Graffiti"
        wallgraffitiFest.category = "Cultural"
        wallgraffitiFest.imageName = "WallGraffiti"
        
        culturalFests.append(wallgraffitiFest)
        
        
        let masterchefFest = Fest()
        
        masterchefFest.name = "MAsterchef@BMU"
        masterchefFest.category = "Cultural"
        masterchefFest.imageName = "Masterchef"
        
        
        culturalFests.append(masterchefFest)
        
        let womenFest = Fest()
        
        womenFest.name = "Women's Got Talent"
        womenFest.category = "Cultural"
        womenFest.imageName = "WomenGotTalent"
        
        
        culturalFests.append(womenFest)
        
        let grapplingFest = Fest()
        
        grapplingFest.name = "Grappling"
        grapplingFest.category = "Cultural"
        grapplingFest.imageName = "Grappling"
        
        culturalFests.append(grapplingFest)
        
        let gamingFest = Fest()
        
        gamingFest.name = "Gaming Arena"
        gamingFest.category = "Cultural"
        gamingFest.imageName = "GamingArena"
        
        culturalFests.append(gamingFest)
        
        let brainquestFest = Fest()
        
        brainquestFest.name = "Brain Quest"
        brainquestFest.category = "Cultural"
        brainquestFest.imageName = "BegBorrowSteal"
        
        culturalFests.append(brainquestFest)
        
        let photographyFest = Fest()
        
        photographyFest.name = "Silhouette Photography"
        photographyFest.category = "Cultural"
        photographyFest.imageName = "SilhouettePhotography"
        
        culturalFests.append(photographyFest)
        
        let nayavadaFest = Fest()
        
        nayavadaFest.name = "Nayavāda"
        nayavadaFest.category = "Cultural"
        nayavadaFest.imageName = "DebatingEvents"
        
        culturalFests.append(nayavadaFest)
        
        let tictactoeFest = Fest()
        
        tictactoeFest.name = "Live Tic Tac Toe"
        tictactoeFest.category = "Cultural"
        tictactoeFest.imageName = "LiveTicTacToe"
        
        culturalFests.append(tictactoeFest)
        
        let tresureFest = Fest()
        
        tresureFest.name = "Night Treasure Hunt"
        tresureFest.category = "Cultural"
        tresureFest.imageName = "NightTreasureHunt"
        
        culturalFests.append(tresureFest)
        
        culturalFestCategory.fests = culturalFests
        
        let managementFestCategory = FestCategory()
        managementFestCategory.name = "Management Events"
        var managementFests = [Fest]()
        
        let marketmadnessFest = Fest()
        
        marketmadnessFest.name = "Market Madness"
        marketmadnessFest.category = "Management"
        marketmadnessFest.imageName = "MarketMadness"
        
        managementFests.append(marketmadnessFest)
        
        let stockMarketFest = Fest()
        
        stockMarketFest.name = "Virtual Stock Market"
        stockMarketFest.category = "Management"
        stockMarketFest.imageName = "VirtualStockMarket"
        
        managementFests.append(stockMarketFest)
        
        let junkFest = Fest()
        
        junkFest.name = "Create From Junk"
        junkFest.category = "Management"
        junkFest.imageName = "CreateFromJunk"
        
        managementFests.append(junkFest)
        
        let quizingFest = Fest()
        
        quizingFest.name = "Quizzing Events"
        quizingFest.category = "Management"
        quizingFest.imageName = "QuizzingEvents"
        
        
        managementFests.append(quizingFest)
        
        let masterOfDeductionFest = Fest()
        
        masterOfDeductionFest.name = "Master Of Deduction"
        masterOfDeductionFest.category = "Management"
        masterOfDeductionFest.imageName = "MasterOfDeduction"
        
        managementFests.append(masterOfDeductionFest)
        
        let admadFest = Fest()
        
        admadFest.name = "Ad Mad"
        admadFest.category = "Management"
        admadFest.imageName = "AdMad"
        
        managementFests.append(admadFest)
        managementFestCategory.fests = managementFests
        
        categories.append(flagshipFestCategory)
        categories.append(technicalFestCategory)
        categories.append(culturalFestCategory)
        categories.append(managementFestCategory)
        
        
        return categories
    }
    static func sampleBannerCategories()->[FestCategory]{
        
        var categories = [FestCategory]()
        
        
        let technicalFestCategory = FestCategory()
        var technicalFests = [Fest]()
        
        let bml1 = Fest()
        bml1.imageName = "bml"
        
        technicalFests.append(bml1)
        
        let bml2 = Fest()
        bml2.imageName = "07"
        technicalFests.append(bml2)
        
        let bml3 = Fest()
        bml3.imageName = "05"
        technicalFests.append(bml3)
        
        let bml4 = Fest()
        bml4.imageName = "03"
        technicalFests.append(bml4)
        
        let bml5 = Fest()
        bml5.imageName = "03-2"
        technicalFests.append(bml5)
        technicalFestCategory.fests = technicalFests
        
        
        categories.append(technicalFestCategory)
        
        
        
        return categories
    }
    static func sampleFestBannerCategories(FestImageName:String)->[FestCategory]{
        
        var categories = [FestCategory]()
        
        
        let technicalFestCategory = FestCategory()
        var technicalFests = [Fest]()
        
        let bml1 = Fest()
        bml1.imageName = FestImageName
        
        technicalFests.append(bml1)
        
        technicalFestCategory.fests = technicalFests
        
        
        categories.append(technicalFestCategory)
        
        
        
        return categories
    }


}
class Fest: NSObject{
    var name: String?
    var festID: NSNumber?
    var category: String?
    var imageName: String?
    var festBannerImageName:String?
    var desc:String?
    var rules:String?
}
