//
//  MemoDetailViewModel.swift
//  RxMemo
//
//  Created by dwKang on 2022/07/01.
//

import Foundation
import RxSwift
import RxCocoa
import Action

class MemoDetailViewModel: CommonViewModel {
    let memo: Memo
    
    private var formatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "ko_kr")
        f.dateStyle = .medium
        f.timeStyle = .medium
        return f
    }()
    
    var contents: BehaviorSubject<[String]>
    
    init(memo: Memo, title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType) {
        self.memo = memo
        
        contents = BehaviorSubject<[String]>(value: [
            memo.content,
            formatter.string(from: memo.insertDate)
        ])
        
        super.init(title: title, sceneCoordinator: sceneCoordinator, storage: storage)
    }
}
