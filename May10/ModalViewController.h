//
//  ModalViewController.h
//  May10
//
//  Created by Daniel Walsh on 5/9/12.
//  Copyright (c) 2012 Walsh walsh Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class May10ViewController;

@interface ModalViewController : UIViewController {
    
    May10ViewController *viewController;
    float friction;
    
}

- (void) dismissModalViewController;
- (void) changeFriction: (float) frictionValue;
- (float) getFriction;
- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil controller: (May10ViewController *) c;
@end
