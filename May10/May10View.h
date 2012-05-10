//
//  May10View.h
//  May10
//
//  Created by Daniel Walsh on 5/9/12.
//  Copyright (c) 2012 Walsh walsh Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Pearl;
@class May10ViewController;

@interface May10View: UIView {
    May10ViewController *mainViewController;
	NSUInteger n;	
    NSUInteger b;
	NSMutableArray *a;
	CGPoint touchPoint;
    //UITextView *textView;
    UILabel *label;
    NSTimeInterval delay;
    BOOL touched;
    BOOL touching;
    float friction;
}

- (id) initWithFrame:(CGRect)frame controller: (May10ViewController *) c;
- (void) changeFriction: (float) frictionValue;

@end
