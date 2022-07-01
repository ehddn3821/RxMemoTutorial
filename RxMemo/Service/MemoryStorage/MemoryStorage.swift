//
//  MemoryStorage.swift
//  RxMemo
//
//  Created by dwKang on 2022/07/01.
//

import Foundation
import RxSwift

class MemoryStorage: MemoStorageType {
    private var list = [
        Memo(content: "Hello, Swift", insertDate: Date().addingTimeInterval(-10)),
        Memo(content: "Hello, Xcode", insertDate: Date().addingTimeInterval(-20))
    ]
    
    private lazy var store = BehaviorSubject<[Memo]>(value: list)
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content: content)
        list.insert(memo, at: 0)
        
        store.onNext(list)
        
        return Observable.just(memo)
    }
    
    @discardableResult
    func getMemoList() -> Observable<[Memo]> {
        return store
    }
    
    @discardableResult
    func updateMemo(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updatedContent: content)
        
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
            list.insert(updated, at: index)
        }
        
        store.onNext(list)
        
        return Observable.just(updated)
    }
    
    @discardableResult
    func deleteMemo(memo: Memo) -> Observable<Memo> {
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
        }
        
        store.onNext(list)
        
        return Observable.just(memo)
    }
}
