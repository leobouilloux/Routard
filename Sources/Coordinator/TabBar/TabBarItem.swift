//
//  TabBarItem.swift
//  Routard
//
//  Created by Leo Marcotte on 19/03/2025.
//

public struct TabBarItem: Identifiable {

    public let id: Int
    public let title: String
    public let destination: Destination
    public let systemImage: String

    public init(id: Int, title: String, destination: Destination, systemImage: String) {
        self.id = id
        self.title = title
        self.destination = destination
        self.systemImage = systemImage
    }
}
