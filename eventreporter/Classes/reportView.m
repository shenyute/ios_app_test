//
//  reportView.m
//  eventreporter
//
//  Created by 張翊新 on 2012/4/15.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "reportView.h"


@implementation reportView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[self.nextResponder manageTouches:touches];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[self.nextResponder manageTouches:touches];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event { 
	[self.nextResponder manageTouches:touches];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
