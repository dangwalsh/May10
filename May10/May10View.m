//
//  May10View.m
//  May10
//
//  Created by Daniel Walsh on 5/9/12.
//  Copyright (c) 2012 Walsh walsh Studio. All rights reserved.
//

#import "May10View.h"
#import "May10ViewController.h"
#import "Pearl.h"

@implementation May10View

- (id) initWithFrame: (CGRect) frame controller: (May10ViewController *) c
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor blackColor];
		n = 5;
        b = 0;
        delay = 0.0;
		float spacing = self.bounds.size.height / (n*2);
        
        a = [[NSMutableArray alloc] initWithCapacity: n];
        mainViewController = c;
        
		touchPoint = CGPointMake(
                                 self.bounds.size.width / 2,
                                 self.bounds.size.height / 2 -
                                 (spacing * n) / 2
                                 );
		
		for (NSUInteger i = 0; i < n; ++i) {
            
            touchPoint.y += spacing;
			[a addObject: [[Pearl alloc] initWithLocation: touchPoint 
                                                  andView: self
                                            andController: mainViewController]];
		}
        
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self 
                                             action: @selector(handleDouble:)
                                             ];
        doubleTap.numberOfTapsRequired = 2;
        
        [self addGestureRecognizer: doubleTap];
        
        
        UIFont *font = [UIFont systemFontOfSize: [UIFont buttonFontSize]];
        NSString *text = [NSString stringWithFormat: @"Double tap for settings"];
        
        CGSize sizeLabel = [text sizeWithFont: font];
        
        CGRect f = CGRectMake(
                              (self.bounds.origin.x + (self.bounds.size.width - sizeLabel.width) / 2) + 10,
                              self.bounds.origin.y + (sizeLabel.height/2),
                              sizeLabel.width+20,
                              sizeLabel.height
                              );
        
        label = [[UILabel alloc] initWithFrame: f];
        label.font = font;
        label.text = text;
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
        
        [self addSubview: label];
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect
{
	// Drawing code
    
	for (NSUInteger i = 0; i < a.count; ++i) {
        
        //[((Pearl *)[a objectAtIndex: i]) changeFriction: friction];
        
		CGPoint p = i == b ? touchPoint :
        ((Pearl *)[a objectAtIndex: i]).location;
        
		if (touched && i == b) { 
            [[a objectAtIndex: i] drag: p];            
        } else if (i == b){
            [[a objectAtIndex: i] drift: p];            
        } else {
            [[a objectAtIndex: i] still: p];
        }
	}
}

#pragma mark -
#pragma mark Class UIResponder

- (void) handleDouble: (UITapGestureRecognizer *) recognizer {
    
    [mainViewController presentModalViewController];
    label.hidden = YES;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    
    for (NSUInteger i = 0; i < a.count; ++i) {
        
        CGPoint l = ((Pearl *)[a objectAtIndex: i]).location;
        
        CGPoint p = [[touches anyObject] locationInView: self];
        
        if (l.x + 20 > p.x &&
            l.x - 20 < p.x &&
            l.y + 20 > p.y &&
            l.y - 20 < p.y) {
            
            touched = YES;
            touching = YES;
            b = i;
            touchPoint = [[touches anyObject] locationInView: self];
        }
    }
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touching) {
        touched = YES;
        touchPoint = [[touches anyObject] locationInView: self];
    }
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
    touched = NO;
    touching = NO;
    touchPoint = [[touches anyObject] locationInView: self]; 
}
- (void) changeFriction: (float) frictionValue {
    
    for (NSUInteger i = 0; i < a.count; ++i) {
        ((Pearl *)[a objectAtIndex: i]).friction = frictionValue;
    }
}

@end

