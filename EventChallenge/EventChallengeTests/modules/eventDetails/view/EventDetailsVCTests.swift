//
//  EventDetailsVCTests.swift
//  EventChallengeTests
//
//  Created by Eduardo Herzer on 17/02/21.
//

import XCTest
@testable import EventChallenge

class EventDetailsVCTests: XCTestCase {
    func testLoadSuccess() {
        let expectation = self.expectation(description: "Event loaded")
        
        let mockVC = EventDetailsVCMockSuccess()
        mockVC.expectation = expectation
        mockVC.presenter =  EventDetailsPresenter(view: mockVC, service:  EventDetailsServiceMock())
        mockVC.presenter?.loadEvent(id: "1")
        
        wait(for: [expectation], timeout: 2)
    }

    
    func testLoadError() {
        let expectation = self.expectation(description: "Event not loaded")
        
        let mockVC = EventDetailsVCMockError()
        mockVC.expectation = expectation
        mockVC.presenter =  EventDetailsPresenter(view: mockVC, service:  EventDetailsServiceErrorMock())
        mockVC.presenter?.loadEvent(id: "1")
        
        wait(for: [expectation], timeout: 2)
    }
}
