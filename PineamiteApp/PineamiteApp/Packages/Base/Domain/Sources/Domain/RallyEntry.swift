//
//  RallyEntry.swift
//  Domain
//
//  Created by Nouman Gul Junejo on 02/08/2025.
//

import Foundation

public struct RallyEntry: Identifiable {
    public let id = UUID()
    public let driver: String?
    public let coDriver: String?
    public let car: String?
    public let team: String?
    public let entryNumber: Int?
}

@MainActor
public extension RallyEntry {
    static let mockEntries: [RallyEntry] = [
        RallyEntry(driver: "Oliver Grant", coDriver: "Sophie Adams", car: "Ford Fiesta Rally3", team: "Thunder Rally", entryNumber: 101),
        RallyEntry(driver: "Ethan James", coDriver: "Grace Walker", car: "Hyundai i20 N Rally2", team: "Speed Apex", entryNumber: 102),
        RallyEntry(driver: nil, coDriver: nil, car: nil, team: nil, entryNumber: nil), // TBD
        
        RallyEntry(driver: "Lucas Carter", coDriver: "Emma Brooks", car: "Skoda Fabia RS Rally2", team: "DustStorm Racing", entryNumber: 103),
        RallyEntry(driver: "Henry Clarke", coDriver: "Chloe Harris", car: "Peugeot 208 Rally4", team: "Nitro Racing", entryNumber: 104),
        RallyEntry(driver: nil, coDriver: nil, car: nil, team: nil, entryNumber: nil), // TBD
        
        RallyEntry(driver: "Noah Bennett", coDriver: "Lily Evans", car: "Citroen C3 Rally2", team: "Trail Blazers", entryNumber: 105),
        RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),
        RallyEntry(driver: nil, coDriver: nil, car: nil, team: nil, entryNumber: nil) ,
        RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),
        RallyEntry(driver: nil, coDriver: nil, car: nil, team: nil, entryNumber: nil) ,
        RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),
        RallyEntry(driver: nil, coDriver: nil, car: nil, team: nil, entryNumber: nil) ,
        RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),
        RallyEntry(driver: nil, coDriver: nil, car: nil, team: nil, entryNumber: nil) ,
        RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),
        RallyEntry(driver: nil, coDriver: nil, car: nil, team: nil, entryNumber: nil) ,
        RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),
        RallyEntry(driver: nil, coDriver: nil, car: nil, team: nil, entryNumber: nil) ,
        RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),RallyEntry(driver: "Jack Mitchell", coDriver: "Ella Scott", car: "Volkswagen Polo GTI R5", team: "RallyPro Motors", entryNumber: 106),
        RallyEntry(driver: nil, coDriver: nil, car: nil, team: nil, entryNumber: nil) // TBD
    ]
}

