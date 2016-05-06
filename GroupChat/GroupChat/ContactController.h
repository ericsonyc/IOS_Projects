
#ifndef ContactController_h
#define ContactController_h

#import<UIKit/UIKit.h>
@interface ContactController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchResultsUpdating>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *datas;
@property (nonatomic,strong) NSMutableArray *searchDatas;

@property (nonatomic,strong) UISearchController *searchController;

@end

#endif /* ContactController_h */
