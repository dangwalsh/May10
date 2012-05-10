//
//  Pearl.m
//  May10
//
//  Created by Daniel Walsh on 5/9/12.
//  Copyright (c) 2012 Walsh walsh Studio. All rights reserved.
//

#import "Pearl.h"
#import "May10View.h"
#import "May10ViewController.h"

@implementation Pearl

@synthesize location;
@synthesize friction;

- (id) initWithLocation: (CGPoint) p andView: (May10View *) v andController: (May10ViewController *) c
{
	self = [super init];
	if (self) {
		location = p;
		velocity = CGPointZero;
        view = v;
        mainViewController = c;
	}
	return self;
}

//Drag the Pearl towards point p.

- (void) drag: (CGPoint) p {
    
	static const float stiffness = .2;
	static const float damping = .8;
	static const float radius = 20;	//in pixels
    
	CGPoint force = CGPointMake(
                                (p.x - location.x) * stiffness / mainViewController.friction ,
                                (p.y - location.y) * stiffness / mainViewController.friction 
                                );
    
	//F = ma
	CGPoint acceleration = CGPointMake(
                                       force.x / mainViewController.mass,
                                       force.y / mainViewController.mass
                                       );
    
	velocity = CGPointMake(
                           damping * (velocity.x + acceleration.x),
                           damping * (velocity.y + acceleration.y)
                           );
    
	location = CGPointMake(       
                           location.x + velocity.x,
                           location.y + velocity.y
                           );
    
	CGRect rect = CGRectMake(
                             location.x - radius,
                             location.y - radius,
                             2 * radius,
                             2 * radius
                             );
    
	CGContextRef c = UIGraphicsGetCurrentContext();
    
	CGContextBeginPath(c);
	CGContextAddEllipseInRect(c, rect);
	CGContextSetRGBFillColor(c, 1, 1, 1, 1);	//white, opaque
	CGContextFillPath(c);
    
}

- (void) drift: (CGPoint) p {
    static const float stiffness = .2;
	static const float damping = .8;
	static const float radius = 20;	//in pixels
    
	//F = ma
	CGPoint acceleration = CGPointMake(
                                       momentum.x / mainViewController.friction / mainViewController.mass,
                                       momentum.y / mainViewController.friction / mainViewController.mass
                                       );
    
	velocity = CGPointMake(
                           damping * (velocity.x + acceleration.x),
                           damping * (velocity.y + acceleration.y)
                           );
    
    
	location = CGPointMake(       
                           location.x + velocity.x,
                           location.y + velocity.y
                           );
    
    //p = mv
    momentum = CGPointMake(
                           mainViewController.mass * velocity.x * stiffness,
                           mainViewController.mass * velocity.y * stiffness
                           );
    
    p.x += momentum.x;
    p.y += momentum.y; 
    
    CGRect rect = CGRectMake(
                             location.x - radius,
                             location.y - radius,
                             2 * radius,
                             2 * radius
                             );
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    
	CGContextBeginPath(c);
	CGContextAddEllipseInRect(c, rect);
	CGContextSetRGBFillColor(c, 1, 1, 1, 1);	//white, opaque
	CGContextFillPath(c);
}

-(void) still: (CGPoint) p {
    static const float radius = 20;	//in pixels
    
    CGRect rect = CGRectMake(
                             p.x - radius,
                             p.y - radius,
                             2 * radius,
                             2 * radius
                             );
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    
	CGContextBeginPath(c);
	CGContextAddEllipseInRect(c, rect);
	CGContextSetRGBFillColor(c, 1, 1, 1, 1);	//white, opaque
	CGContextFillPath(c);
}


@end

