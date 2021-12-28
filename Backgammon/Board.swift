import Foundation

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

func getUInt(rank: Rank) -> UInt8 {
    switch rank {
    case .white(let stoneCount):
        return getUInt(stoneCount: stoneCount)
    case .black(let stoneCount):
        return getUInt(stoneCount: stoneCount)
    case .empty:
        return 0
    }
}

func getUInt(stoneCount: StoneCount) -> UInt8 {
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

enum NextPlayer {
    case white
    case black
    case undecided
}

struct Board
{
    let rank0: Rank
    let rank1: Rank
    let rank2: Rank
    let rank3: Rank
    let rank4: Rank
    let rank5: Rank

    let rank6: Rank
    let rank7: Rank
    let rank8: Rank
    let rank9: Rank
    let rank10: Rank
    let rank11: Rank

    let rank12: Rank
    let rank13: Rank
    let rank14: Rank
    let rank15: Rank
    let rank16: Rank
    let rank17: Rank

    let rank18: Rank
    let rank19: Rank
    let rank20: Rank
    let rank21: Rank
    let rank22: Rank
    let rank23: Rank

    let nextPlayer: NextPlayer
    let blackJail: Rank
    let whiteJail: Rank
}

func render(board: Board) -> [(Int, Rank)] {

    return [
        (0, board.rank0),
        (1, board.rank1),
        (2, board.rank2),
        (3, board.rank3),
        (4, board.rank4),
        (5, board.rank5),
        (6, board.rank6),
        (7, board.rank7),
        (8, board.rank8),
        (9, board.rank9),
        (10, board.rank10),
        (11, board.rank11),
        (12, board.rank12),
        (13, board.rank13),
        (14, board.rank14),
        (15, board.rank15),
        (16, board.rank16),
        (17, board.rank17),
        (18, board.rank18),
        (19, board.rank19),
        (20, board.rank20),
        (21, board.rank21),
        (22, board.rank22),
        (23, board.rank23),
    ]
}

func initialBoard() -> Board
{
    return Board(rank0: .white(.two),
                 rank1: .empty,
                 rank2: .empty,
                 rank3: .empty,
                 rank4: .empty,
                 rank5: .black(.five),
                 rank6: .empty,
                 rank7: .black(.three),
                 rank8: .empty,
                 rank9: .empty,
                 rank10: .empty,
                 rank11: .white(.five),
                 rank12: .black(.five),
                 rank13: .empty,
                 rank14: .empty,
                 rank15: .empty,
                 rank16: .white(.three), //
                 rank17: .empty,
                 rank18: .white(.five),
                 rank19: .empty,
                 rank20: .empty,
                 rank21: .empty,
                 rank22: .empty,
                 rank23: .white(.two),
                 nextPlayer: .undecided,
                 blackJail: .empty,
                 whiteJail: .empty)
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
