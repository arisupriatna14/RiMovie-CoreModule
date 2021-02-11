//
//  File.swift
//  
//
//  Created by Ari Supriatna on 06/02/21.
//

import Foundation
import Combine

public protocol UseCase {
  associatedtype Request
  associatedtype Response
  
  func execute(request: Request?) -> AnyPublisher<Response, Error>
}
