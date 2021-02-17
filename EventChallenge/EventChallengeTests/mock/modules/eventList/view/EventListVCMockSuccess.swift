//
//  EventListVCMockSuccess.swift
//  EventChallengeTests
//
//  Created by Eduardo Herzer on 17/02/21.
//

import Foundation
@testable import EventChallenge
import XCTest

class EventListVCMockSuccess: NSObject, EventListViewProtocol {
    var presenter: EventListPresenterProtocol?
    var expectation: XCTestExpectation?
    
    func listLoaded(events: [Event]) {
        expectation?.fulfill()
    }
    
    func showError(message: String) {
        XCTFail()
    }
}
