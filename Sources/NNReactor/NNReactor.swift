//
//  NNReactor.swift
//  GoldRentalMachine
//
//  Created by Q Z on 2023/10/19.
//

import UIKit
import RxSwift
import RxCocoa
import FoundationEx
import NNToast

public extension Reactive where Base: Toast {
    
    var showError: Binder<String?> {
        return Binder(self.base) { component, error in
            component.showError(error)
        }
    }
    
    var showSuccess: Binder<String?> {
        return Binder(self.base) { component, success in
            component.showSuccess(success)
        }
    }
    
    var showWait: Binder<Bool> {
        return Binder(self.base) { component, waiting in
            if waiting {
                component.wait()
            } else {
                component.clear()
            }
        }
    }
    
    var showWarning: Binder<String?> {
        return Binder(self.base) { component, success in
            component.showWarning(success)
        }
    }
}

// MARK: - Event Channel
private var eventChannelKey: UInt8 = 0
extension NSObject: AssociatedObjectStore {

    fileprivate var eventChannel: PublishSubject<Any> {
        get { return associatedObject(forKey: &eventChannelKey, default: PublishSubject<Any>()) }
        set { setAssociatedObject(newValue, forKey: &eventChannelKey) }
    }
}

public extension Reactive where Base: NSObject {
    var eventChannel: PublishSubject<Any> {
        return base.eventChannel
    }
}
