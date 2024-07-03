//
//  NodeTests.swift
//  BestConnLigthningTests
//
//  Created by Ramon Santos on 03/07/24.
//

import XCTest
import Foundation
@testable import BestConnLigthning

final class NodeTests: XCTestCase {

    private var sut: Node!

    override func setUpWithError() throws {
        sut = makeNode(capacity: 0)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_Node_bitcoin_conversion_when_success() {
        sut = makeNode(capacity: Cryptocurrencies.bitcoin)
        let expectedBitcoin: Double = 1.0
        XCTAssertEqual(sut.bitcoin, expectedBitcoin, "Conversion to Bitcoin is successful")
    }

    func test_Node_bitcoin_conversion_when_fail() {
        sut = makeNode(capacity: 100000001)
        let expectedBitcoin: Double = 1.0
        XCTAssertNotEqual(sut.bitcoin, expectedBitcoin, "Conversion to Bitcoin is incorrect")
    }

    func test_Node_bitcoinDescription_when_success() {
        sut = makeNode(capacity: 100000000)
        let expectedBitcoinDescription = "1,00000000 BTC"
        XCTAssertEqual(sut.bitcoinDescription, expectedBitcoinDescription, "Bitcoin format is correct")
    }

    func test_Node_bitcoinDescription_when_fail() {
        sut = makeNode(capacity: 1000)
        let expectedBitcoinDescription = "1,00000000 BTC"
        XCTAssertNotEqual(sut.bitcoinDescription, expectedBitcoinDescription, "Bitcoin description is incorrect")
    }
}

// MARK: - Mock

extension NodeTests {
    func makeNode(capacity: Double) -> Node {
        return Node(
            publicKey: "xyzXYZxyzXyz",
            alias: "TestAlias",
            channels: 12345,
            capacity: capacity,
            firstSeen: Date(),
            updatedAt: Date(),
            city: "Rio",
            country: "Brazil",
            isoCode: "US",
            subdivision: "whateverString"
        )
    }
}
