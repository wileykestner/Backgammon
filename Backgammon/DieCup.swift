import Foundation

class DieCup {

    private var _randomNumberGenerator: SystemRandomNumberGenerator

    init(randomNumberGenerator: SystemRandomNumberGenerator) {
        _randomNumberGenerator = randomNumberGenerator
    }

    func roll() -> Die {
        return Die.random(using: &_randomNumberGenerator)
    }
}
