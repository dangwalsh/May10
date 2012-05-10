//
//  ModalView.h
//  May10
//
//  Created by Daniel Walsh on 5/9/12.
//  Copyright (c) 2012 Walsh walsh Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModalViewController;
@class May10ViewController;

@interface ModalView: UILabel {
	ModalViewController *modalViewController;
    May10ViewController *viewController;
    UISlider *slider;
    UISlider *sliderMass;
	UILabel *label;
    UILabel *labelMass;
    UILabel *labelInst;
    float minimumValue;
    float maximumValue;
    float minimumMassValue;
    float maximumMassValue;
}

- (id) initWithFrame: (CGRect) frame controller: (ModalViewController *) c superController: (May10ViewController *) vc;
- (void) done;
@end
