import XCTest
@testable import Backgammon_BackgammonLibrary

class BoardTests: XCTestCase {

    func testInitialBoard() {
        let board = Board.getInitial()

        XCTAssertEqual(board.nextTurn, .undecided)
        XCTAssertEqual(board.blackJail, .empty)
        XCTAssertEqual(board.whiteJail, .empty)

        // Test some specific positions on the initial board
        XCTAssertEqual(board.ranks.0, .white(.two))
        XCTAssertEqual(board.ranks.5, .black(.five))
        XCTAssertEqual(board.ranks.11, .white(.five))
        XCTAssertEqual(board.ranks.23, .black(.two))
    }

    func testBoardEquality() {
        let board1 = Board.getInitial()
        let board2 = Board.getInitial()

        XCTAssertEqual(board1, board2)
    }

    func testGetUInt8FromRank() {
        XCTAssertEqual(getUInt8(rank: .white(.three)), 3)
        XCTAssertEqual(getUInt8(rank: .black(.five)), 5)
        XCTAssertEqual(getUInt8(rank: .empty), 0)
    }

    func testGetUInt8FromStoneCount() {
        XCTAssertEqual(getUInt8(stoneCount: .one), 1)
        XCTAssertEqual(getUInt8(stoneCount: .seven), 7)
        XCTAssertEqual(getUInt8(stoneCount: .fifteen), 15)
    }
}
