//
//  EventDetailsServiceErrorMock.swift
//  EventChallengeTests
//
//  Created by Eduardo Herzer on 17/02/21.
//

import Foundation
@testable import EventChallenge

class EventDetailsServiceErrorMock: EventDetailsServiceProtocol {
    func getEvent(id: String, success: @escaping (Event) -> Void, failure: @escaping (String) -> Void) {
        failure("mock error")
    }
}
