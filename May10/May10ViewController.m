//
//  May10ViewController.m
//  May10
//
//  Created by Daniel Walsh on 5/9/12.
//  Copyright (c) 2012 Walsh walsh Studio. All rights reserved.
//

#import "May10ViewController.h"
#import "May10View.h"
#import "ModalViewController.h"

@implementation May10ViewController

@synthesize  friction;
@synthesize mass;

- (void) didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
    
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView
{
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	v = [[May10View alloc] initWithFrame: frame controller: self];
    self.view = v;
    self.friction = 1;
    self.mass = 2;
}

- (void) presentModalViewController {
    ModalViewController *modalViewController =
    [[ModalViewController alloc] initWithNibName: nil bundle: nil controller: self];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: modalViewController];
    
    navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
	[self presentModalViewController: navigationController animated: YES];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void) viewDidLoad
{
	[super viewDidLoad];
    
	displayLink = [CADisplayLink displayLinkWithTarget: self.view
                                              selector: @selector(setNeedsDisplay)
                   ];
	
	displayLink.frameInterval = 1;
	
	[displayLink addToRunLoop: [NSRunLoop currentRunLoop]
                      forMode: NSDefaultRunLoopMode
     ];
    
}


- (void) viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
{
	// Return YES for supported orientations
	//return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}

@end
