//
//  GetListPresenter.swift
//  
//
//  Created by Ari Supriatna on 06/02/21.
//

import SwiftUI
import Combine

public class GetListPresenter<Request, Response, Interactor: UseCase>: ObservableObject where
  Interactor.Request == Request, Interactor.Response == [Response] {
  
  private var cancellables: Set<AnyCancellable> = []
  private let _useCase: Interactor
  
  @Published public var list: [Response]?
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false
  
  public init(useCase: Interactor) {
    _useCase = useCase
  }
  
  public func getList(request: Request?) {
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
      } receiveValue: { (list) in
        self.list = list
      }
      .store(in: &cancellables)
  }
  
}
