//
//  Pearl.h
//  May10
//
//  Created by Daniel Walsh on 5/9/12.
//  Copyright (c) 2012 Walsh walsh Studio. All rights reserved.
//

@class May10View;
@class May10ViewController;

@interface Pearl: UIView {
	CGPoint location;
	CGPoint velocity;
    CGPoint momentum;
    CGRect frame;
    May10View *view;
    May10ViewController *mainViewController;
    UITextView *textView;
}

- (id) initWithLocation: (CGPoint) p andView: (May10View *) v andController: (May10ViewController *)c;
- (void) drag: (CGPoint) p;
- (void) drift: (CGPoint) p;
- (void) still: (CGPoint) p;
- (void) changeFriction: (float) frictionValue;

@property (nonatomic, assign) CGPoint location;
@property (nonatomic, assign) float friction;

@end
