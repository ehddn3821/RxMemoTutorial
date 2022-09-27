//
//  CoreDataStorage.swift
//  RxMemo
//
//  Created by 앱지 Appg on 2022/09/27.
//

import Foundation
import RxSwift
import RxCoreData
import CoreData

class CoreDataStorage: MemoStorageType {
    let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    @discardableResult
    func createMemo(content: String) -> RxSwift.Observable<Memo> {
        let memo = Memo(content: content)
        
        do {
            try mainContext.rx.update(memo)
            return Observable.just(memo)
        }
        catch {
            return Observable.error(error)
        }
    }
    
    @discardableResult
    func getMemoList() -> RxSwift.Observable<[MemoSectionModel]> {
        return mainContext.rx.entities(Memo.self, sortDescriptors: [NSSortDescriptor(key: "insertDate", ascending: false)])
            .map { results in [MemoSectionModel(model: 0, items: results)] }
    }
    
    @discardableResult
    func updateMemo(memo: Memo, content: String) -> RxSwift.Observable<Memo> {
        let updated = Memo(original: memo, updatedContent: content)
        
        do {
            try mainContext.rx.update(updated)
            return Observable.just(updated)
        }
        catch {
            return Observable.error(error)
        }
    }
    
    @discardableResult
    func deleteMemo(memo: Memo) -> RxSwift.Observable<Memo> {
        do {
            try mainContext.rx.delete(memo)
            return Observable.just(memo)
        }
        catch {
            return Observable.error(error)
        }
    }
}
