//
//  EventListVCTests.swift
//  EventChallengeTests
//
//  Created by Eduardo Herzer on 17/02/21.
//

import XCTest
@testable import EventChallenge

class EventListVCTests: XCTestCase {
    func testListSuccess() {
        let expectation = self.expectation(description: "List loaded")
        
        let mockVC = EventListVCMockSuccess()
        mockVC.expectation = expectation
        mockVC.presenter =  EventListPresenter(view: mockVC, service:  EventListServiceMock())
        mockVC.presenter?.loadEvents()
        
        wait(for: [expectation], timeout: 2)
    }

    
    func testListError() {
        let expectation = self.expectation(description: "List not loaded")
        
        let mockVC = EventListVCMockError()
        mockVC.expectation = expectation
        mockVC.presenter =  EventListPresenter(view: mockVC, service:  EventListServiceErrorMock())
        mockVC.presenter?.loadEvents()
        
        wait(for: [expectation], timeout: 2)
    }
}
