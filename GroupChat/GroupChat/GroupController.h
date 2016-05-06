
#ifndef GroupController_h
#define GroupController_h

#import<UIKit/UIKit.h>
#import "SearchView.h"
@interface GroupController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchResultsUpdating>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *datas;
@property (nonatomic,strong) NSMutableArray *searchDatas;
@property (nonatomic,strong) SearchView *search;
@property (nonatomic) BOOL searchflag;

@property (nonatomic,strong) UISearchController *searchController;

@end

#endif /* GroupController_h */
