//
//  ViewController.swift
//  SnapBehaviorAnmiation
//
//  Created by mrahmiao on 4/1/15.
//  Copyright (c) 2015 Code4Blues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var animator: UIDynamicAnimator!
  var snapBehavior: UISnapBehavior!

  @IBOutlet weak var imageView: UIImageView! {
    didSet {
      imageView.userInteractionEnabled = true
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    animator = UIDynamicAnimator(referenceView: view)
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTapGesture:")
    imageView.addGestureRecognizer(tapGestureRecognizer)
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  func handleTapGesture(sender: UITapGestureRecognizer) {
    NSLog("Handle Tap Gesture")
    if snapBehavior != nil {
      animator.removeBehavior(snapBehavior)
    }
    
    let snapPoint = CGPoint(x: CGRectGetMidX(imageView.frame), y: CGRectGetMidY(imageView.frame))
    
    snapBehavior = UISnapBehavior(item: imageView, snapToPoint: snapPoint)
    snapBehavior.damping = 1
    
    // Scale down
    let scaleFactor: CGFloat = 0.8
    UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
        self.imageView.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor)
      }) { finished in
        NSLog("Finished")
    }
    
    animator.addBehavior(snapBehavior)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

