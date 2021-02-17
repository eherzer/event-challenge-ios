//
//  EventDetailsVCMockSuccess.swift
//  EventChallengeTests
//
//  Created by Eduardo Herzer on 17/02/21.
//

import Foundation
@testable import EventChallenge
import XCTest

class EventDetailsVCMockSuccess: NSObject, EventDetailsViewProtocol {
    var presenter: EventDetailsPresenterProtocol?
    var expectation: XCTestExpectation?
    
    func eventLoaded(event: Event) {
        expectation?.fulfill()
    }
    
    func showError(message: String) {
        XCTFail()
    }
}
