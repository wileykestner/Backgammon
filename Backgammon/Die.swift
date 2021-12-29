import Foundation


enum Die: CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six

    static func random<G: RandomNumberGenerator>(using generator: inout G) -> Die {
        return Die.allCases.randomElement(using: &generator)!
    }
}


