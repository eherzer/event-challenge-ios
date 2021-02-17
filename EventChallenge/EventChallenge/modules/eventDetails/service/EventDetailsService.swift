//
//  EventDetailsService.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 16/02/21.
//

import Foundation

class EventDetailsService: BaseService, EventDetailsServiceProtocol {
    func getEvent(id: String, success: @escaping (Event) -> Void, failure: @escaping (String) -> Void) {
        let endpoint = "/events/\(id)"
        
        request(endpoint: endpoint, method: .get) { (jsonResponse) in
            if let jsonResponse = jsonResponse,
               let event = try? JSONDecoder().decode(Event.self, from: jsonResponse.rawData()) {
                success(event)
            } else {
                failure("Não recebeu o evento")
            }
        } failure: { (errorMessage) in
            failure(errorMessage ?? "Não foi possível carregar o evento")
        }
    }
}
