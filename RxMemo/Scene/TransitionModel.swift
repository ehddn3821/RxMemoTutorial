//
//  TransitionModel.swift
//  RxMemo
//
//  Created by dwKang on 2022/07/09.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
