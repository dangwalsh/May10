//
//  May10ViewController.h
//  May10
//
//  Created by Daniel Walsh on 5/9/12.
//  Copyright (c) 2012 Walsh walsh Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>	//for CADisplayLink

@class May10View;

@interface May10ViewController: UIViewController  {
	CADisplayLink *displayLink;
    May10View *v;
}

- (void) presentModalViewController;
- (void) changeFriction: (float) frictionValue;
- (void) print;
- (float) getFriction;

@property (nonatomic, assign) float friction;
@property (nonatomic, assign) float mass;

@end
