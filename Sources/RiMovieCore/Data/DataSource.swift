//
//  DataSource.swift
//  
//
//  Created by Ari Supriatna on 06/02/21.
//

import Foundation
import Combine

public protocol DataSource {
  associatedtype Request
  associatedtype Response
  
  func execute(request: Request?) -> AnyPublisher<Response, Error>
}
