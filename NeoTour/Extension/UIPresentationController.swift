//
//  UIPresentationController.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 24.02.2024.
//

import UIKit

class PartialSizePresentationController: UIPresentationController {
    
    private lazy var dimmingView: UIView = {
        let view = UIView(frame: containerView?.bounds ?? CGRect.zero)
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        view.alpha = 0.0 // начать с полностью прозрачного
        return view
    }()
    

    
    override func dismissalTransitionWillBegin() {
        // Связать анимацию осветления с транзицией контроллера
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 0.0 // сделать прозрачным при скрытии
            }, completion: nil)
        } else {
            dimmingView.alpha = 0.0
        }
    }
    var presentedHeight: CGFloat = 300 // Высота, которую ты хочешь
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else {
            return .zero
        }
        
        var frame: CGRect = .zero
        frame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerView.bounds.size)
        
        frame.origin.y = containerView.frame.height - presentedHeight
        return frame
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width, height: presentedHeight)
    }
    
    private var panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer()
       private var initialFrame: CGRect = .zero
       
       override func presentationTransitionWillBegin() {
           super.presentationTransitionWillBegin()
           panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(gesture:)))
           containerView?.addGestureRecognizer(panGestureRecognizer)
           
           guard let containerView = containerView else { return }
           
           dimmingView.frame = containerView.bounds
           containerView.insertSubview(dimmingView, at: 0)
           
           // Связать анимацию затемнения с транзицией контроллера
           if let coordinator = presentedViewController.transitionCoordinator {
               coordinator.animate(alongsideTransition: { _ in
                   self.dimmingView.alpha = 1.0 // сделать полностью непрозрачным при показе
               }, completion: nil)
           } else {
               dimmingView.alpha = 1.0
           }
       }
       
       @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
           guard let containerView = containerView, let presentedView = presentedView else { return }
           
           switch gesture.state {
           case .began:
               initialFrame = presentedView.frame
           case .changed:
               let translation = gesture.translation(in: presentedView)
               presentedView.frame.origin.y = initialFrame.origin.y + translation.y
           case .ended:
               if gesture.velocity(in: presentedView).y > 0 {
                   // Если скорость движения вверх, закрыть контроллер
                   presentedViewController.dismiss(animated: true, completion: nil)
               } else {
                   // Вернуть на место
                   UIView.animate(withDuration: 0.2) {
                       presentedView.frame = self.initialFrame
                   }
               }
           default:
               break
           }
       }
       
       override func dismissalTransitionDidEnd(_ completed: Bool) {
           if completed {
               panGestureRecognizer.removeTarget(self, action: #selector(handlePanGesture(gesture:)))
           }
       }
}
