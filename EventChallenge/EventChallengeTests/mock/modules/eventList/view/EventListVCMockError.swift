//
//  EventListVCMockError.swift
//  EventChallengeTests
//
//  Created by Eduardo Herzer on 17/02/21.
//

import Foundation
@testable import EventChallenge
import XCTest

class EventListVCMockError: NSObject, EventListViewProtocol {
    var presenter: EventListPresenterProtocol?
    var expectation: XCTestExpectation?
    
    func listLoaded(events: [Event]) {
        XCTFail()
    }
    
    func showError(message: String) {
        expectation?.fulfill()
    }
}
