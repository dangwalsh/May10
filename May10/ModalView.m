//
//  ModalView.m
//  May10
//
//  Created by Daniel Walsh on 5/9/12.
//  Copyright (c) 2012 Walsh walsh Studio. All rights reserved.
//

#import "ModalView.h"
#import "ModalViewController.h"
#import "May10ViewController.h"

@implementation ModalView

/*
 - (id) initWithFrame: (CGRect) frame
 {
 self = [super initWithFrame: frame];
 if (self) {
 // Initialization code
 }
 return self;
 }
 */

- (id) initWithFrame: (CGRect) frame controller: (ModalViewController *) c superController:(May10ViewController *) vc{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
        modalViewController = c;
        viewController = vc;
        
		self.backgroundColor = [UIColor grayColor];
		self.textAlignment = UITextAlignmentCenter;
		self.userInteractionEnabled = YES;
        
        minimumValue = 1;	//freezing point of water in Fahrenheit
		maximumValue = 5;
        minimumMassValue = 2;	//freezing point of water in Fahrenheit
		maximumMassValue = 5;
        
		//Center the slider in the View.
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(50*(maximumValue - minimumValue), 16);
        
		CGRect f = CGRectMake(
                              b.origin.x + (b.size.width - s.width) / 2,
                              b.origin.y + (b.size.height - s.height) / 2,
                              s.width,
                              s.height
                              );
        
		slider = [[UISlider alloc] initWithFrame: f];
		slider.minimumValue = minimumValue;
		slider.maximumValue = maximumValue;
		slider.value = vc.friction;
		slider.continuous = YES;
        
		slider.backgroundColor = [UIColor grayColor];
        
        [slider addTarget: self
                   action: @selector(valueChanged:)
         forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: slider];
        
        CGRect fm = CGRectMake(
                               b.origin.x + (b.size.width - s.width) / 2,
                               b.origin.y + (b.size.height - s.height) / 2 + 100,
                               s.width,
                               s.height
                               );
        
        sliderMass = [[UISlider alloc] initWithFrame: fm];
        sliderMass.minimumValue = minimumMassValue;
        sliderMass.maximumValue = maximumMassValue;
        sliderMass.value = vc.mass;
        sliderMass.continuous = YES;
        sliderMass.backgroundColor = [UIColor grayColor];
        
        [sliderMass addTarget: self
                       action: @selector(valueMassChanged:)
             forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: sliderMass];
        
        UIFont *font = [UIFont fontWithName: @"Helvetica" size: 26];
		s = [@"this much space" sizeWithFont: font];
        
		f = CGRectMake(
                       b.origin.x + (b.size.width - s.width) / 2,
                       b.origin.y + (b.size.height - slider.frame.size.height) / 2 - s.height - 10,
                       s.width,
                       s.height
                       );
        
		label = [[UILabel alloc] initWithFrame: f];
		label.textAlignment = UITextAlignmentCenter;
		label.font = font;
        label.backgroundColor = [UIColor clearColor];
		[self valueChanged: slider];
		[self addSubview: label];
        
        fm = CGRectMake(
                        b.origin.x + (b.size.width - s.width) / 2,
                        b.origin.y + (b.size.height - sliderMass.frame.size.height) / 2 - s.height + 100,
                        s.width,
                        s.height
                        );
        
        labelMass = [[UILabel alloc] initWithFrame: fm];
        labelMass.textAlignment = UITextAlignmentCenter;
        labelMass.font = font;
        labelMass.backgroundColor = label.backgroundColor;
        [self valueMassChanged: sliderMass];
        [self addSubview: labelMass];
        
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                             initWithTarget: self 
                                             action: @selector(handleDouble:)
                                             ];
        doubleTap.numberOfTapsRequired = 2;
        
        [self addGestureRecognizer: doubleTap];
        
        UIFont *fontInst = [UIFont systemFontOfSize: [UIFont buttonFontSize]];
        NSString *text = [NSString stringWithFormat: @"User sliders to modify ball properties"];
        
        CGSize sizeLabel = [text sizeWithFont: fontInst];
        
        CGRect fInst = CGRectMake(
                              (self.bounds.origin.x + (self.bounds.size.width - sizeLabel.width) / 2),
                              self.bounds.origin.y + (sizeLabel.height/2) + 50,
                              sizeLabel.width,
                              sizeLabel.height
                            );
        labelInst = [[UILabel alloc] initWithFrame: fInst];
        labelInst.text = text;
        labelInst.font = fontInst;
        labelInst.textAlignment = UITextAlignmentCenter;
        labelInst.backgroundColor = [UIColor clearColor];
        labelInst.textColor = [UIColor blackColor];
        
        [self addSubview: labelInst];
	}
	return self;
}
- (void) done {
    [modalViewController dismissModalViewController];
}

- (void) handleDouble: (UITapGestureRecognizer *) recognizer {
    [modalViewController dismissModalViewController];
}

- (void) valueChanged: (id) sender {
    label.text = [NSString stringWithFormat: @"Friction: %5.2f",
                  slider.value];
    viewController.friction = slider.value;
}

- (void) valueMassChanged: (id) sender {
    labelMass.text = [NSString stringWithFormat: @"Mass: %5.2f",
                      sliderMass.value];
    viewController.mass = sliderMass.value;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */

@end

