//
//  EventDetailsServiceProtocol.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 16/02/21.
//

import Foundation

protocol EventDetailsServiceProtocol {
    func getEvent(id: String,
                  success: @escaping(_ event: Event) -> Void,
                  failure: @escaping(_ message: String) -> Void)
}
