//
//  UIView+Rx.swift
//  qpyf
//
//  Created by wmkj on 2023/3/17.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UICollectionReusableView {
    // 提供给外界重用序列
    public var prepareForReuse: RxSwift.Observable<Void> {
        var prepareForReuseKey: Int8 = 0
        if let prepareForReuseOB = objc_getAssociatedObject(base, &prepareForReuseKey) as? Observable<Void> {
            return prepareForReuseOB
        }
        let prepareForReuseOB = Observable.of(
            sentMessage(#selector(Base.prepareForReuse)).map { _ in }
            , deallocated)
            .merge()
        objc_setAssociatedObject(base, &prepareForReuseKey, prepareForReuseOB, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)

        return prepareForReuseOB
    }
    // 提供一个重用垃圾回收袋
    public var reuseBag: DisposeBag {
        MainScheduler.ensureExecutingOnScheduler()
        var prepareForReuseBag: Int16 = 00
        if let bag = objc_getAssociatedObject(base, &prepareForReuseBag) as? DisposeBag {
            return bag
        }
        
        let bag = DisposeBag()
        objc_setAssociatedObject(base, &prepareForReuseBag, bag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        
        _ = sentMessage(#selector(Base.prepareForReuse))
            .subscribe(onNext: { [weak base] _ in
                let newBag = DisposeBag()
                guard let base = base else {return}
                objc_setAssociatedObject(base, &prepareForReuseBag, newBag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            })
        return bag
    }
}

extension Reactive where Base: UICollectionViewCell {
    // 提供给外界重用序列
    public var prepareForReuse: RxSwift.Observable<Void> {
        var prepareForReuseKey: Int8 = 0
        if let prepareForReuseOB = objc_getAssociatedObject(base, &prepareForReuseKey) as? Observable<Void> {
            return prepareForReuseOB
        }
        let prepareForReuseOB = Observable.of(
            sentMessage(#selector(Base.prepareForReuse)).map { _ in }
            , deallocated)
            .merge()
        objc_setAssociatedObject(base, &prepareForReuseKey, prepareForReuseOB, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)

        return prepareForReuseOB
    }
    // 提供一个重用垃圾回收袋
    public var reuseBag: DisposeBag {
        MainScheduler.ensureExecutingOnScheduler()
        var prepareForReuseBag: Int8 = 0
        if let bag = objc_getAssociatedObject(base, &prepareForReuseBag) as? DisposeBag {
            return bag
        }
        
        let bag = DisposeBag()
        objc_setAssociatedObject(base, &prepareForReuseBag, bag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        
        _ = sentMessage(#selector(Base.prepareForReuse))
            .subscribe(onNext: { [weak base] _ in
                let newBag = DisposeBag()
                guard let base = base else {return}
                objc_setAssociatedObject(base, &prepareForReuseBag, newBag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            })
        return bag
    }
}

extension Reactive where Base: UITableViewHeaderFooterView {
    // 提供给外界重用序列
    public var prepareForReuse: RxSwift.Observable<Void> {
        var prepareForReuseKey: Int8 = 0
        if let prepareForReuseOB = objc_getAssociatedObject(base, &prepareForReuseKey) as? Observable<Void> {
            return prepareForReuseOB
        }
        let prepareForReuseOB = Observable.of(
            sentMessage(#selector(Base.prepareForReuse)).map { _ in }
            , deallocated)
            .merge()
        objc_setAssociatedObject(base, &prepareForReuseKey, prepareForReuseOB, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)

        return prepareForReuseOB
    }
    // 提供一个重用垃圾回收袋
    public var reuseBag: DisposeBag {
        MainScheduler.ensureExecutingOnScheduler()
        var prepareForReuseBag: Int8 = 0
        if let bag = objc_getAssociatedObject(base, &prepareForReuseBag) as? DisposeBag {
            return bag
        }
        
        let bag = DisposeBag()
        objc_setAssociatedObject(base, &prepareForReuseBag, bag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        
        _ = sentMessage(#selector(Base.prepareForReuse))
            .subscribe(onNext: { [weak base] _ in
                let newBag = DisposeBag()
                guard let base = base else {return}
                objc_setAssociatedObject(base, &prepareForReuseBag, newBag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            })
        return bag
    }
}

extension Reactive where Base: UITableViewCell {
    // 提供给外界重用序列
    public var prepareForReuse: RxSwift.Observable<Void> {
        var prepareForReuseKey: Int8 = 0
        if let prepareForReuseOB = objc_getAssociatedObject(base, &prepareForReuseKey) as? Observable<Void> {
            return prepareForReuseOB
        }
        let prepareForReuseOB = Observable.of(
            sentMessage(#selector(Base.prepareForReuse)).map { _ in }
            , deallocated)
            .merge()
        objc_setAssociatedObject(base, &prepareForReuseKey, prepareForReuseOB, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)

        return prepareForReuseOB
    }
    // 提供一个重用垃圾回收袋
    public var reuseBag: DisposeBag {
        MainScheduler.ensureExecutingOnScheduler()
        var prepareForReuseBag: Int8 = 0
        if let bag = objc_getAssociatedObject(base, &prepareForReuseBag) as? DisposeBag {
            return bag
        }
        
        let bag = DisposeBag()
        objc_setAssociatedObject(base, &prepareForReuseBag, bag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        
        _ = sentMessage(#selector(Base.prepareForReuse))
            .subscribe(onNext: { [weak base] _ in
                let newBag = DisposeBag()
                guard let base = base else {return}
                objc_setAssociatedObject(base, &prepareForReuseBag, newBag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            })
        return bag
    }
}
