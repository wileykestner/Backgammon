import Foundation
@testable import Backgammon_BackgammonLibrary


extension Board {
    static func boardAfterOneTwo() -> Board {
        let ranks: TwentyFourBackgammonRanks = (
            .empty,
            .white(.one),
            .white(.one),
            .empty,
            .empty,
            .black(.five),
            .empty,
            .black(.three),
            .empty,
            .empty,
            .empty,
            .white(.five),
            .black(.five),
            .empty,
            .empty,
            .empty,
            .white(.three),
            .empty,
            .white(.five),
            .empty,
            .empty,
            .empty,
            .empty,
            .black(.two)

        )
        return Board(ranks: ranks,
                     nextTurn: .black,
                     blackJail: .empty,
                     whiteJail: .empty)
    }
}
