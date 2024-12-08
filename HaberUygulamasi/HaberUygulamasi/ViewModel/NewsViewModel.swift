//
//  NewsViewModel.swift
//  HaberUygulamasi
//
//  Created by Samet on 25.10.2024.
//

import Foundation

struct NewsTableViewModel{
    let NewsList : [News]
    
    func numberOfRows() -> Int {
        return self.NewsList.count
        
    }
    
    func newsAtIndexPath(index : Int) -> NewsViewModel {
        let News = self.NewsList[index]
        return NewsViewModel(News:News)
    }
}



struct NewsViewModel {
    let News : News
    
    var title : String {
        return self.News.title
    }
    var story : String {
        return self.News.stroy
    }
}
