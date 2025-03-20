//
//  AnyIdentifiable.swift
//  LeoUI
//
//  Created by Leo Marcotte on 28/10/2024.
//

public class AnyIdentifiable: Identifiable {

    public let destination: any Identifiable

    public init(destination: any Identifiable) {
        self.destination = destination
    }
}
