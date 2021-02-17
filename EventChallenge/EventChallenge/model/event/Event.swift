//
//  Event.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 15/02/21.
//

import Foundation

struct Event: Decodable {
    var id: String
    var image: String
    var title: String
    var description: String
    var date: Int64
    var price: Double
    var latitude: Double
    var longitude: Double
}
