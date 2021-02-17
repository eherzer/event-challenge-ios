//
//  EventDetailsVCMockError.swift
//  EventChallengeTests
//
//  Created by Eduardo Herzer on 17/02/21.
//

import Foundation
@testable import EventChallenge
import XCTest

class EventDetailsVCMockError: NSObject, EventDetailsViewProtocol {
    var presenter: EventDetailsPresenterProtocol?
    var expectation: XCTestExpectation?
    
    func eventLoaded(event: Event) {
        XCTFail()
    }
    
    func showError(message: String) {
        expectation?.fulfill()
    }
}
