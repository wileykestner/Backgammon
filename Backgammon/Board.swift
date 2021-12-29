import Foundation
import UIKit

typealias TwentyFourBackgammonRanks = (
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank,
    Rank
)

enum StoneCount {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case eleven
    case twelve
    case thirteen
    case fourteen
    case fifteen
}

func getUInt8(rank: Rank) -> UInt8 {
    switch rank {
    case .white(let stoneCount):
        return getUInt8(stoneCount: stoneCount)
    case .black(let stoneCount):
        return getUInt8(stoneCount: stoneCount)
    case .empty:
        return 0
    }
}

func getUInt8(stoneCount: StoneCount) -> UInt8 {
    switch stoneCount {
    case .one:
        return 1
    case .two:
        return 2
    case .three:
        return 3
    case .four:
        return 4
    case .five:
        return 5
    case .six:
        return 6
    case .seven:
        return 7
    case .eight:
        return 8
    case .nine:
        return 9
    case .ten:
        return 10
    case .eleven:
        return 11
    case .twelve:
        return 12
    case .thirteen:
        return 13
    case .fourteen:
        return 14
    case .fifteen:
        return 15
    }
}

enum Rank
{
    case white(StoneCount)
    case black(StoneCount)
    case empty
}

enum NextTurn {
    case white
    case black
    case undecided
}

struct Board
{
    let ranks: TwentyFourBackgammonRanks
    let nextTurn: NextTurn
    let blackJail: Rank
    let whiteJail: Rank

    static func getInitial() -> Board {
        let initialRanks: TwentyFourBackgammonRanks = (
            .white(.seven),
            .empty,
            .empty,
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
            .black(.eight)
        )

        return Board(ranks: initialRanks, nextTurn: .undecided, blackJail: .empty, whiteJail: .empty)
    }
}

func render(board: Board) -> EnumeratedSequence<[Rank]> {
    let tupleMirror = Mirror(reflecting: board.ranks)
    let tupleElements = tupleMirror.children.map({ $0.value }) as? [Rank] ?? []

    return tupleElements.enumerated()

}

enum MoveState
{
    case valid
    case invalid
}

func turn(board: Board) -> (MoveState, Board)
{
    //    let origin = move.origin
    //    let destination = move.steps + origin
    //    let destinationRank = board[destination]
    //    let currentRank = board[origin]

    return (MoveState.invalid, board)
}
