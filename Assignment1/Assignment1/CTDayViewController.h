

#import <UIKit/UIKit.h>
#import "CTCollectionViewDataSource.h"
#import "CTDefinition.h"
#import "CTCourseInfo.h"

@interface CTDayViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (strong,nonatomic) CTCollectionViewDataSource *data;

//@property (strong,nonatomic) UIView *view;
@property (strong,nonatomic) UIScrollView *backgroundScrollView;
@property (strong,nonatomic) UIView *dayIndicator;
@property (strong,nonatomic) UIView *myView;

@property int currentIndex;
@property (nonatomic) BOOL isScrollingWeekday;

@end

@interface CTDayViewController(private)
- (CTCourseInfo*)dayCourseArray:(NSMutableArray  *(__strong *))dayCourseArray
courseArrayCellPosition:(NSInteger *)courseArrayCellPosition adCount:(NSInteger *)cnt;
@end