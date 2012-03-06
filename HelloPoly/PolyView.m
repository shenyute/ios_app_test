//
//  PolyView.m
//  HelloPoly
//
//  Created by 張翊新 on 2012/3/6.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "PolyView.h"


@implementation PolyView

- (void) awakeFromNib {
	[self repaint];
}

- (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides {
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
	float radius = 0.9 * center.x;
	NSMutableArray *result = [NSMutableArray array];
	float angle = (2.0 * M_PI) / numberOfSides;
	float exteriorAngel = M_PI - angle;
	float rotationDelta = angle - (0.5 * exteriorAngel);
	
	for(int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) {
		float newAngle = (angle * currentAngle) - rotationDelta;
		float curX = cos(newAngle) * radius;
		float curY = sin(newAngle) * radius;
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, center.y + curY)]];
	}
	return result;
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	CGContextRef c = UIGraphicsGetCurrentContext();
		CGRect bounds = [self bounds];
	int sides = polygon.numberOfSides;
	NSArray *array = [self pointsForPolygonInRect:bounds numberOfSides:sides];
	BOOL first = YES;
	
	[[UIColor grayColor] set];
	UIRectFill(bounds);
	CGContextSetRGBStrokeColor(c, 0, 0, 0, 1.0);
	CGContextSetRGBFillColor(c, 0.5, 0.5, 1, 1);
	CGContextSetLineWidth(c, 5);
	CGContextBeginPath(c);
	for(NSValue *theValue in array) {
		CGPoint thePoint = [theValue CGPointValue];
		if (first) {
			CGContextMoveToPoint(c, thePoint.x, thePoint.y);
			first = NO;
		} else {
			CGContextAddLineToPoint(c, thePoint.x, thePoint.y);
		}
	}
	CGContextClosePath(c);
	CGContextDrawPath(c, kCGPathFillStroke);
}

- (void)repaint {
	[self setNeedsDisplay];
}

- (void)dealloc {
    [super dealloc];
}


@end
