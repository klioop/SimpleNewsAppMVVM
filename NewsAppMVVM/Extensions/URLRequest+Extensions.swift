//
//  URLRequest+Extensions.swift
//  NewsAppMVVM
//
//  Created by klioop on 2021/04/15.
//

import RxSwift
import RxCocoa

struct Resource<T: Decodable> {
    let url: URL
}

extension URLRequest {
    
    static func load<T>(resouce: Resource<T>) -> Observable<T> {
        return Observable.just(resouce.url)
            .flatMap { url -> Observable<Data> in
                return URLSession.shared.rx.data(request: URLRequest(url: url))
            }
            .map { data -> T in
                return try JSONDecoder().decode(T.self, from: data)
            }.asObservable()
    }
}
