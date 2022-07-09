//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by dwKang on 2022/07/01.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel {
    var memoList: Observable<[Memo]> {
        return storage.getMemoList()
    }
}
