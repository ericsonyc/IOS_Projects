
#import <Foundation/Foundation.h>
#import "InputView.h"
@implementation InputView

-(void)setup:(NSString *)date like:(BOOL)like{
    self.dateLabel.text=date;
    self.text.text=@"Like";
    if (like) {
        [self.likeornot setOn:YES];
    }else{
        [self.likeornot setOn:NO];
    }
    
}

@end