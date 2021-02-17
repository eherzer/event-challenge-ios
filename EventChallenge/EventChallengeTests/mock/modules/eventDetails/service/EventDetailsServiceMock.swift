//
//  EventDetailsServiceMock.swift
//  EventChallengeTests
//
//  Created by Eduardo Herzer on 17/02/21.
//

import Foundation
@testable import EventChallenge

class EventDetailsServiceMock: EventDetailsServiceProtocol {
    func getEvent(id: String, success: @escaping (Event) -> Void, failure: @escaping (String) -> Void) {
        success(mockEvent())
    }
    
    private func mockEvent() -> Event {
        return Event(id: "1", image: "image_url", title: "title", description: "description", date: 1534784400, price: 0.0, latitude: -30.0392981, longitude: -51.2146267)
    }
}
