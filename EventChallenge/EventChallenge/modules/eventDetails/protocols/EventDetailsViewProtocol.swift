//
//  EventDetailsViewProtocol.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 16/02/21.
//

import Foundation

protocol EventDetailsViewProtocol: NSObjectProtocol {
    func eventLoaded(event: Event)
    func showError(message: String)
}
