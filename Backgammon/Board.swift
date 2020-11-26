import Foundation


enum Stone
{
    case white
    case black
    case empty
}


struct Rank
{
    let stone: Stone
    let count: Int
}


struct Move
{
    let stone: Stone
    let origin: Int
    let steps: Int
}


typealias Ranks = [Rank]


struct Board
{
    let ranks: Ranks
    let whitePrisoners: Int
    let blackPrisoners: Int
    let whiteHeaven: Int
    let blackHeaven: Int
}


func initialBoard() -> Board
{
    return Board(ranks: initialRanks(),
                 whitePrisoners: 0,
                 blackPrisoners: 0,
                 whiteHeaven: 0,
                 blackHeaven: 0)
}


func initialRanks() -> Ranks
{
    let white2 = Rank(stone: .white, count: 2)
    let white3 = Rank(stone: .white, count: 3)
    let white5 = Rank(stone: .white, count: 5)
    let black2 = Rank(stone: .black, count: 2)
    let black3 = Rank(stone: .black, count: 3)
    let black5 = Rank(stone: .black, count: 5)
    let empty0 = Rank(stone: .empty, count: 0)

    return [
        white2, empty0, empty0, empty0, empty0, black5,
        empty0, black3, empty0, empty0, empty0, white5,
        black5, empty0, empty0, empty0, white3, empty0,
        white5, empty0, empty0, empty0, empty0, black2,
    ]
}

enum MoveState
{
    case valid
    case invalid
}

func turn(board: Board, move: Move) -> (MoveState, Board)
{
    //    let origin = move.origin
    //    let destination = move.steps + origin
    //    let destinationRank = board[destination]
    //    let currentRank = board[origin]

    return (MoveState.invalid, board)
}
