//
//  InjectionKey.swift
//  ShinyCardsLibraries
//
//  Created by Leo Marcotte on 02/09/2024.
//

public protocol InjectionKey {

    /// The associated type representing the type of the dependency injection key's value.
    associatedtype Value

    /// The default value for the dependency injection key.
    static var currentValue: Self.Value { get set }
}
