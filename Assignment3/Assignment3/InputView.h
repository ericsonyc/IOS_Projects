
#ifndef InputView_h
#define InputView_h

#import <UIKit/UIKit.h>
@interface InputView : UIView

@property (nonatomic,strong) IBOutlet UITextField *textView;
@property (nonatomic,strong) IBOutlet UILabel *dateLabel;
@property (nonatomic,strong) IBOutlet UILabel *text;
@property (nonatomic,strong) IBOutlet UISwitch *likeornot;

-(void)setup:(NSString *)date like:(BOOL)like;

@end

#endif /* InputView_h */
