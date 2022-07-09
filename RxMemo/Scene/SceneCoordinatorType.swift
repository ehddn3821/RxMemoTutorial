//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by dwKang on 2022/07/09.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
}

