//
//  GetItemPresenter.swift
//  
//
//  Created by Ari Supriatna on 06/02/21.
//

import SwiftUI
import Combine

public class GetItemPresenter<Request, Response, Interactor: UseCase>: ObservableObject where
  Interactor.Request == Request, Interactor.Response == Response {
  
  private var cancellables: Set<AnyCancellable> = []
  private let _useCase: Interactor
  
  @Published public var item: Response?
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false
  
  public init(useCase: Interactor) {
    _useCase = useCase
  }
  
  public func getItem(request: Request?) {
    isLoading = true
    
    _useCase.execute(request: request)
      .receive(on: RunLoop.main)
      .sink { (completion) in
        switch completion {
        case .failure(let error):
          self.isError = true
          self.errorMessage = error.localizedDescription
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      } receiveValue: { (item) in
        self.item = item
      }
      .store(in: &cancellables)
  }
  
}
