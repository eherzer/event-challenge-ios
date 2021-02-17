//
//  EventListService.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 16/02/21.
//

import Foundation

class EventListService: BaseService, EventListServiceProtocol {
    func getEvents(success: @escaping ([Event]) -> Void, failure: @escaping (String) -> Void) {
        let endpoint = "/events"
        
        request(endpoint: endpoint, method: .get) { (jsonResponse) in
            if let jsonArray = jsonResponse,
               let events = try? JSONDecoder().decode([Event].self, from: jsonArray.rawData()) {
                success(events)
            } else {
                failure("Não recebeu a lista")
            }
        } failure: { (errorMessage) in
            failure(errorMessage ?? "Não foi possível carregar a lista de eventos")
        }
    }
}
