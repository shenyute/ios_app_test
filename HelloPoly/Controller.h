//
//  Controller.h
//
//  Created by 張翊新 on 2012/3/4.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolyView.h"

@interface Controller :NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
    IBOutlet UILabel *polygonLabel;
	IBOutlet PolygonShape *polygon;
	IBOutlet PolyView *polyView;
}
- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;
@end
