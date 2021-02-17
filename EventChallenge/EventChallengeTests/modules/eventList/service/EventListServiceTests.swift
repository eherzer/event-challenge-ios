//
//  EventListServiceTests.swift
//  EventChallengeTests
//
//  Created by Eduardo Herzer on 17/02/21.
//

import XCTest
@testable import EventChallenge

class EventListServiceTests: XCTestCase {
    var service: EventListServiceProtocol?
    
    func prepareMockService(type: MockServiceType) {
        switch type {
        case .success:
            service = EventListServiceMock()
        default:
            service = EventListServiceErrorMock()
        }
    }
    
    func testLoadSuccess() {
        self.prepareMockService(type: .success)
        self.service?.getEvents(success: { (events) in
            XCTAssertNotNil(events)
        }, failure: { (errorMessage) in
            XCTAssertNil(errorMessage)
        })
    }
    
    func testLoadError() {
        self.prepareMockService(type: .failure)
        self.service?.getEvents(success: { (events) in
            XCTAssertNil(events)
        }, failure: { (errorMessage) in
            XCTAssertNotNil(errorMessage)
        })
    }
}
