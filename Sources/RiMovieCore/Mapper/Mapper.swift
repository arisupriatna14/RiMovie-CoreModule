//
//  Mapper.swift
//  
//
//  Created by Ari Supriatna on 06/02/21.
//

import Foundation

public protocol Mapper {
  associatedtype Response
  associatedtype Domain
  associatedtype Entity
  associatedtype Presentation
  
  func transformResponseToDomain(response: Response) -> Domain
  func transformEntityToDomain(entity: Entity) -> Domain
  func transformDomainToEntity(domain: Domain) -> Entity
  func transformDomainToPresentation(domain: Domain) -> Presentation
  func transformPresentationToDomain(presentation: Presentation) -> Domain
}
