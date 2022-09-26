//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by dwKang on 2022/07/01.
//

import Foundation
import RxSwift

protocol MemoStorageType {
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func getMemoList() -> Observable<[MemoSectionModel]>
    
    @discardableResult
    func updateMemo(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func deleteMemo(memo: Memo) -> Observable<Memo>
}
