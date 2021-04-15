//
//  ArticleViewModel.swift
//  NewsAppMVVM
//
//  Created by klioop on 2021/04/15.
//

import RxSwift
import RxCocoa

// DataStream

class ArticleListViewModel{
    
    let disposeBag = DisposeBag()
    
    lazy var articleObservable = BehaviorSubject<[Article]>(value: [])
    
    init() {
        populateNews()
    }
    
    private func populateNews() {
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=35a5128d8222488eb79b83febe143e67") else { return }
        
        let resource = Resource<ArticlesList>(url: url)
        
        URLRequest.load(resouce: resource) // Observable<ArticlesList>
            .subscribe(onNext: { articleList in
                self.articleObservable.onNext(articleList.articles)
            })
            .disposed(by: disposeBag)
    }
}



//struct ArticleListViewModel {
//    let articlesVM: [ArticleViewModel]
//}
//
//extension ArticleListViewModel {
//
//    init(_ articles: [Article]) {
//        self.articlesVM = articles.compactMap(ArticleViewModel.init) // nil 제거
//    }
//
//    func articleAt(_ index: Int) -> ArticleViewModel {
//        return self.articlesVM[index]
//    }
//
//}
//
//struct ArticleViewModel  {
//    let article: Article
//
//    init(_ article: Article) {
//        self.article = article
//    }
//}
//
//extension ArticleViewModel {
//
//    var title: Observable<String> {
//        return Observable.just(article.title)
//    }
//
//    var description: Observable<String> {
//        return Observable.just(article.description ?? "")
//    }
//}


