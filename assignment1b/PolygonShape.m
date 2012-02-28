//
//  PolygonShape.m
//  assignment1b
//
//  Created by 張翊新 on 2012/2/28.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

- (void)setNumberOfSides:(int)sides {
	if (sides <= maximumNumberOfSides && sides >= minimumNumberOfSides) {
		numberOfSides = sides;
	}
	else {
		NSLog(@"Invalid number of sides: %d is not between %d ~ %d", sides, minimumNumberOfSides, maximumNumberOfSides);
	}
}

- (void)setMinimumNumberOfSides:(int)minSides {
	if (minSides > 2) {
		minimumNumberOfSides = minSides;
	} else {
		minimumNumberOfSides = 3;
		NSLog(@"Invalid number of sides: %d is smaller than the minimum of %d allowed", minSides, 3);
	}

}

- (void)setMaximumNumberOfSides:(int)maxSides {
	if (maxSides <= 12) {
		maximumNumberOfSides = maxSides;
	} else {
		maximumNumberOfSides = 12;
		NSLog(@"Invalid number of sides: %d is larger than the maximum of %d allowed", maxSides, 12);
	}
}

- (id) initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
	if (self = [super init]) {
		[self setMinimumNumberOfSides:min];
		[self setMaximumNumberOfSides:max];
		[self setNumberOfSides:sides];
	}
	return self;
}

- (id) init {
	return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
}

- (NSString *) name {
	if (numberOfSides == 3) {
		return @"Triangle";
	} else if (numberOfSides == 4) {
		return @"Square";
	} else {
		return [NSString stringWithFormat:@"%d-sided polygon", numberOfSides];
	}
}

- (float) angleInDegrees {
	//NSLog(@"180 * (%d - 2) / %d", numberOfSides, numberOfSides);
	return 180 * (numberOfSides - 2) / numberOfSides;
}

- (float) angleInRadians {
	return M_PI * (numberOfSides - 2) / numberOfSides;
}

- (void) dealloc {
	NSLog(@"%@ is dealloc", [self name]);
	[super dealloc];
}

- (NSString *) description {
	return [NSString stringWithFormat: @"Hello I am a %@ with angles of %f degrees (%f radians)",
				 [self name], [self angleInDegrees], [self angleInRadians]];
	
}

@end
