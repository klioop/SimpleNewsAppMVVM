//
//  ViewController.swift
//  NewsAppMVVM
//
//  Created by klioop on 2021/04/15.
//

import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    
    var viewMoel = ArticleListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        viewMoel.articleObservable
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "ArticleTableViewCell", cellType: ArticleTableViewCell.self)) {
                row, article, cell in
                cell.titleLabel.text = article.title
                cell.descriptionLabel.text = article.description
            }.disposed(by: disposeBag)
    }
}

