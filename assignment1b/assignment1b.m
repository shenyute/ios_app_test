#import <Foundation/Foundation.h>

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

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Hello, World!");
	PrintPathInfo();
	PrintProcessInfo();
	PrintBookmarkInfo();
	PrintIntrospectionInfo();
    [pool drain];
    return 0;
}
