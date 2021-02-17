//
//  EventListServiceMock.swift
//  EventChallengeTests
//
//  Created by Eduardo Herzer on 17/02/21.
//

import Foundation
@testable import EventChallenge

class EventListServiceMock: EventListServiceProtocol {
    func getEvents(success: @escaping ([Event]) -> Void, failure: @escaping (String) -> Void) {
        success(mockEvents())
    }
    
    private func mockEvents() -> [Event] {
        var events = [Event]()
        
        events.append(Event(id: "1", image: "image_url", title: "title", description: "description", date: 1534784400, price: 0.0, latitude: -30.0392981, longitude: -51.2146267))
        events.append(Event(id: "2", image: "image_url", title: "title", description: "description", date: 1534784400, price: 0.0, latitude: -30.0392981, longitude: -51.2146267))
        
        return events
    }
}
