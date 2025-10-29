import Foundation

/// A light pattern to keep this package independent of your Domain module.
/// Define DTOs that can map themselves to a Domain model type alias.
public protocol DomainMappable {
    associatedtype DomainModel
    var toDomain: DomainModel { get }
}
