//
//  EventDetailsServiceTests.swift
//  EventChallengeTests
//
//  Created by Eduardo Herzer on 17/02/21.
//

import XCTest
@testable import EventChallenge

class EventDetailsServiceTests: XCTestCase {
    var service: EventDetailsServiceProtocol?
    
    func prepareMockService(type: MockServiceType) {
        switch type {
        case .success:
            service = EventDetailsServiceMock()
        default:
            service = EventDetailsServiceErrorMock()
        }
    }
    
    func testLoadSuccess() {
        self.prepareMockService(type: .success)
        self.service?.getEvent(id: "1",
                               success: { (events) in
                                XCTAssertNotNil(events)
                               }, failure: { (errorMessage) in
                                XCTAssertNil(errorMessage)
                               })
    }
    
    func testLoadError() {
        self.prepareMockService(type: .failure)
        self.service?.getEvent(id: "1",
                               success: { (events) in
                                XCTAssertNil(events)
                               }, failure: { (errorMessage) in
                                XCTAssertNotNil(errorMessage)
                               })
    }
}
