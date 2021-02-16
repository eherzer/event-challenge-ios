//
//  EventListPresenter.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 16/02/21.
//

import Foundation

class EventListPresenter: EventListPresenterProtocol {
    weak private var view: EventListViewProtocol?
    private var service: EventListServiceProtocol
    
    init(view: EventListViewProtocol, service: EventListServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func loadEvents() {
        service.getEvents { (events) in
            self.view?.listLoaded(events: events)
        } failure: { (errorMessage) in
            self.view?.showError(message: errorMessage)
        }
    }
}
