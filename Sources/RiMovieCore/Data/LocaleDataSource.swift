//
//  File.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import Combine

public protocol LocaleDataSource {
  associatedtype Request
  associatedtype Response
  
  func list(request: Request?) -> AnyPublisher<[Response], Error>
  func add(entities: Response) -> AnyPublisher<Bool, Error>
  func get(id: Int) -> AnyPublisher<Response, Error>
  func update(id: Int) -> AnyPublisher<Response, Error>
}
