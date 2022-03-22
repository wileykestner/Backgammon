import XCTest
@testable import Backgammon

class BoardTests: XCTestCase {

    func testInitialBoardsEqual() throws {
        let board1 = Board.getInitial()
        let board2 = Board.getInitial()

        XCTAssertEqual(board1, board2)
    }

    func testBoardsUnequal() throws {
        let board1 = Board.getInitial()
    }
}
