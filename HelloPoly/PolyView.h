//
//  PolyView.h
//  HelloPoly
//
//  Created by 張翊新 on 2012/3/6.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolygonShape.h"


@interface PolyView : UIView {
	IBOutlet PolygonShape *polygon;
}

- (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;
- (void)repaint;

@end
