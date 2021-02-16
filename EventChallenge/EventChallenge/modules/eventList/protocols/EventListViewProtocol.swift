//
//  EventListViewProtocol.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 16/02/21.
//

import Foundation

protocol EventListViewProtocol: NSObjectProtocol {
    func listLoaded(events: [Event])
    func showError(message: String)
}
