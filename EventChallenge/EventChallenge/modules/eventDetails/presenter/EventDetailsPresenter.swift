//
//  EventDetailsPresenter.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 16/02/21.
//

import Foundation

class EventDetailsPresenter: EventDetailsPresenterProtocol {
    weak private var view: EventDetailsViewProtocol?
    private var service: EventDetailsServiceProtocol
    
    init(view: EventDetailsViewProtocol, service: EventDetailsServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func loadEvent(id: String) {
        service.getEvent(id: id) { (event) in
            self.view?.eventLoaded(event: event)
        } failure: { (errorMessage) in
            self.view?.showError(message: errorMessage)
        }
    }
}
