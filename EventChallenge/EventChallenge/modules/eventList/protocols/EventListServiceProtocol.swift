//
//  EventListServiceProtocol.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 16/02/21.
//

import Foundation


protocol EventListServiceProtocol {
    func getEvents(success: @escaping(_ events: [Event]) -> Void,
                   failure: @escaping(_ message: String) -> Void)
}
