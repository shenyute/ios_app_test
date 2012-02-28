#import <Foundation/Foundation.h>
#import "PolygonShape.h"

void PrintPathInfo() {
	NSString *path = @"~";
	
	path = [path stringByStandardizingPath];
	NSLog(@"My folder is: %@", path);
	for(NSString *p in [path pathComponents]) {
		NSLog(@"%@", p);
	}
}

void PrintProcessInfo() {
	NSProcessInfo *info = [NSProcessInfo processInfo];
	
	NSLog(@"Process Name: %@ Process ID: %d", [info processName], [info processIdentifier]);
}

void PrintBookmarkInfo() {
	NSMutableDictionary *bookmarks = [NSMutableDictionary 
									  dictionaryWithObjectsAndKeys: 
									  [NSURL URLWithString:@"http://standford.edu"], @"Stanford University", 
									  [NSURL URLWithString:@"http://www.apple.com"], @"Apple",
									  [NSURL URLWithString:@"http://cs193p.stanford.edu"], @"CS193P",
									  [NSURL URLWithString:@"http://itunes.stanford.edu"], @"Stanford on iTunes U",
									  [NSURL URLWithString:@"http://stanfordshop.com"], @"Stanford Mall", nil];
									  
	for(NSString *key in bookmarks) {
		if ([key hasPrefix:@"Stanford"]) {
			NSLog(@"Key: %@ URL: %@", key, [bookmarks valueForKey:key]);

		}
	}
}

#define BOOLStr(flag) ((flag) ? @"YES" : @"NO")

void PrintIntrospectionInfo() {
	NSMutableArray *types_array = [NSMutableArray array];
								   
	[types_array addObject:@"Hello World"];
	[types_array addObject:[NSMutableString stringWithCapacity:10]];
	[types_array addObject:[NSURL URLWithString: @"www.google.com"]];
	[types_array addObject:[NSProcessInfo processInfo]];
	[types_array addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"value", @"key", nil]];
	[types_array addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"value", @"key", nil]];
	[types_array addObject:[NSArray arrayWithObjects:@"item1", nil]];
	[types_array addObject:[NSMutableArray arrayWithObjects:@"item1", nil]];
	
	for(id object in types_array) {
		SEL sel = @selector(lowercaseString);
		NSLog(@"Class name: %@", [object className]);
		NSLog(@"Is Member of NSString: %@", BOOLStr([object isMemberOfClass:[NSString class]]));
		NSLog(@"Is kind of class NSString: %@", BOOLStr([object isKindOfClass:[NSString class]]));
		NSLog(@"Responds to lowercaseString: %@", BOOLStr([object respondsToSelector:sel]));
		if([object respondsToSelector:sel]) {
			NSLog(@"lowercaseString is: %@", [object performSelector:sel]);
		}
		NSLog(@"=====================");
	}
}

void PrintPolygonInfo() {
	NSMutableArray *array = [[NSMutableArray alloc] init];
	PolygonShape *p1 = [[PolygonShape alloc] initWithNumberOfSides:4 minimumNumberOfSides:3 maximumNumberOfSides:7];
	PolygonShape *p2 = [[PolygonShape alloc] init];
	p2 = [p2 initWithNumberOfSides:6 minimumNumberOfSides:5 maximumNumberOfSides:9];
	PolygonShape *p3 = [[PolygonShape alloc] init];
	p3 = [p3 initWithNumberOfSides:12 minimumNumberOfSides:9 maximumNumberOfSides:12];
	
	[array addObject:p1]; 
	NSLog(@"%@", [p1 description]);
	[array addObject:p2];
	NSLog(@"%@", [p2 description]);
	[array addObject:p3]; 
	NSLog(@"%@", [p3 description]);
	
	for(PolygonShape *poly in array) {
		[poly setNumberOfSides:10];
	}
	[p1 release];
	[p2 release];
	[p3 release];
	[array release];
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Hello, World!");
	PrintPathInfo();
	PrintProcessInfo();
	PrintBookmarkInfo();
	PrintIntrospectionInfo();
	PrintPolygonInfo(); // assignment 2a
    [pool drain];
    return 0;
}
