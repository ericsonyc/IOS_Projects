//
//  WAI_MapVC.m
//  WhereAmI12
//
//  Created by Terry Payne on 07/11/2012.
//  Copyright (c) 2012 Terry Payne. All rights reserved.
//

#import "WAI_MapVC.h"
#import "x4ql_CoffeeAnnotation.h"


@interface WAI_MapVC ()

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSMutableArray *locationArray;
@property (nonatomic, strong) NSString *locationsFileName;

@end

@implementation WAI_MapVC

@synthesize mapView;
@synthesize newUserLocation;

// ==================================================================
// Lazy instantiation of location Array and filename
// ==================================================================

- (NSString *) locationsFileName {
    if (_locationsFileName == nil) {
        // Find the locations.plist file in the user's Documents Directory
        NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [paths objectAtIndex:0];
        
        // <Application Home>/Documents/locations.plist
        _locationsFileName = [documentsPath stringByAppendingPathComponent:@"locations.plist"];

    }
    return _locationsFileName;
}

- (NSMutableArray *) locationArray {
    if (_locationArray == nil) {
        // Load the data into the Array
        if((_locationArray = [[NSMutableArray alloc] initWithContentsOfFile:[self locationsFileName]]) == nil) {
            // Failed to find file - probably doesn't exist.  Just create an empty array
            _locationArray = [[NSMutableArray alloc] init];
        }
    }
    return _locationArray;
}

- (void) syncLocationArray {
    [[self locationArray] writeToFile:[self locationsFileName] atomically:YES];
}
// =================================================
#pragma mark - Core Location Methods

- (CLLocationManager *)locationManager {
    if (_locationManager == nil) {
        _locationManager = [CLLocationManager new];
        [_locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
        [_locationManager setDistanceFilter:10];
        [_locationManager setDelegate:self];
        if ([UIDevice currentDevice].systemVersion.floatValue>=8.0) {
            [_locationManager requestWhenInUseAuthorization];
            [_locationManager requestAlwaysAuthorization];
        }
    }
    _locationManager.delegate=self;
    [_locationManager startUpdatingLocation];
    return _locationManager;
}
    
// =================================================
#pragma mark - Core Location Delegate Methods

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    [[self addButton] setEnabled:YES];
    
    CLLocation *currLocation=[locations lastObject];
    //CLLocation *oldLocation=[locations firstObject];
    
    // Ensure that if we do something here, it is because we *are* in a different location
    //if (([currLocation coordinate].latitude == [oldLocation coordinate].latitude) &&
        //([currLocation coordinate].longitude == [oldLocation coordinate].longitude))
        //return;
    
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance([currLocation coordinate],
                                                                       0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    MKCoordinateRegion adjustedRegion = [[self mapView] regionThatFits:viewRegion];
    [[self mapView] setRegion:adjustedRegion animated:YES];
    
    newUserLocation=currLocation.coordinate;
    
    [_locationManager stopUpdatingLocation];
    //[[self latitudeLabel] setText:[NSString stringWithFormat:@"%+.6f", [newLocation coordinate].latitude]];
    //[[self longitudeLabel] setText:[NSString stringWithFormat:@"%+.6f", [newLocation coordinate].longitude]];
    
    
    //    NSLog(@"WAI_MapVC new location: latitude %+.6f, longitude %+.6f\n",
    //          [newLocation coordinate].latitude,
    //          [newLocation coordinate].longitude);

}

- (void) locationManager:(CLLocationManager *)manager
     didUpdateToLocation:(CLLocation *)newLocation
            fromLocation:(CLLocation *)oldLocation {
    
    [[self addButton] setEnabled:YES];

    // Ensure that if we do something here, it is because we *are* in a different location
    if (([newLocation coordinate].latitude == [oldLocation coordinate].latitude) &&
        ([newLocation coordinate].longitude == [oldLocation coordinate].longitude))
        return;
    
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance([newLocation coordinate],
                                                                       0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    MKCoordinateRegion adjustedRegion = [[self mapView] regionThatFits:viewRegion];
    [[self mapView] setRegion:adjustedRegion animated:YES];
    
    newUserLocation=newLocation.coordinate;
    //[[self latitudeLabel] setText:[NSString stringWithFormat:@"%+.6f", [newLocation coordinate].latitude]];
    //[[self longitudeLabel] setText:[NSString stringWithFormat:@"%+.6f", [newLocation coordinate].longitude]];

    
//    NSLog(@"WAI_MapVC new location: latitude %+.6f, longitude %+.6f\n",
//          [newLocation coordinate].latitude,
//          [newLocation coordinate].longitude);
}
    
- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    // For now, do nothing other than report to the log
    NSLog(@"Unable to get location events");
    [[self addButton] setEnabled:NO];
}

// =================================================
#pragma mark - Delegate Methods

- (void) newLocationEntryComplete:(WAI_LocationDetailVC *)controller wasCancelled:(BOOL)cancelled {
    
    NSLog(@"The %@ button was pressed", (cancelled==NO?@"Done":@"Cancel"));
    if (cancelled == NO) {
        // We want to create a new entry in our locations array
        // each entry will be stored as a dictionary
        // First retrieve the data from the child controller
        NSString *locationName = [[controller nameTextField] text];
        CLLocation *newLocation = [controller location];
        
        // Create the entry.  Note that we need to construct NSNumber objects for the latitude and longitude doubles.
        NSDictionary *entryDict = @{@"label":locationName,
                                    @"latitude":[NSNumber numberWithDouble:[newLocation coordinate].latitude],
                                    @"longitude":[NSNumber numberWithDouble:[newLocation coordinate].longitude]};
        
        // Finally, add the object to the array and synchronise (save) to the file
        [[self locationArray] addObject:entryDict];
        [self syncLocationArray];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

// =================================================
#pragma mark - IBActions

- (void)getCurPosition{
    if(_locationManager==nil){
        _locationManager = [[CLLocationManager alloc] init];
        [_locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
        [_locationManager setDistanceFilter:10];
        [_locationManager setDelegate:self];
        [_locationManager requestAlwaysAuthorization];
        _locationManager.delegate=self;
    }
    if ([CLLocationManager locationServicesEnabled]) {
        //_locationManager = [[CLLocationManager alloc] init];
        
        [_locationManager startUpdatingLocation];
        
    }
}

- (IBAction)touchEvent:(id)sender {
    //[self getCurPosition];
    [self.coffeedelegate sortCafes];
}

- (IBAction)addAction:(id)sender {
    
    // Get current location
    CLLocation *location = [[self locationManager] location];
    if (location == nil) {
        return;
    }
    
    WAI_LocationDetailVC *myVC = [[WAI_LocationDetailVC alloc]
                                  initWithNibName:@"WAI_LocationDetailVC" bundle:nil];
    [myVC setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [myVC setDelegate:self];
    
    [myVC setLocation:location];
    
    [self presentViewController:myVC animated:YES completion:nil];
}

// =================================================
#pragma mark - Lifecycle Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Map" image:[UIImage imageNamed:@"103-map.png"] tag:0]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[self addButton] setEnabled:NO];
    mapView.showsUserLocation=YES;
    mapView.userTrackingMode=MKUserTrackingModeFollow;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"WAI_MapVC about to appear");
    
    [[self locationManager] startUpdatingLocation];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"WAI_MapVC about to disappear");
    [[self locationManager] stopUpdatingLocation];
    [self setLocationArray:nil];
}


//clean all the annotations, also update current location
- (void)clearAnnotations{

    for (id<MKAnnotation> annotation in [self.mapView annotations]) {
        [self.mapView removeAnnotation:annotation];
    }
    [_locationManager startUpdatingLocation];

}

//select coffee shop to show detail annotation
- (void)selectCoffeeShop:(CLLocationCoordinate2D)loc{
    for(id<MKAnnotation> annotation in [[self mapView]annotations]){
        if (([annotation coordinate].latitude==loc.latitude)&&([annotation coordinate].longitude==loc.longitude)) {
            [[self mapView]selectAnnotation:annotation animated:YES];
        }
    }
}


//clear all the pins, a delegate method
- (void)clearPins{
    [self clearAnnotations];
    [_locationManager startUpdatingLocation];
}

//get the current locations to deliver to the left table view delegate
- (CLLocationCoordinate2D)getLocation{
    [self getCurPosition];
    return newUserLocation;
}

//this function is to show all the pins
- (void)showAllPins:(NSArray *)array{
    NSLog(@"hello");
    NSInteger count=[array count];
    for (int i=0; i<count; i++) {
        NSDictionary *dict=[array objectAtIndex:i];
        CLLocationCoordinate2D location;
        location.latitude=[[dict objectForKey:@"latitude"]doubleValue];
        location.longitude=[[dict objectForKey:@"longitude"]doubleValue];
        MKCoordinateRegion kaos_digital;
        kaos_digital.center=location;
        kaos_digital.span.latitudeDelta=0.05;
        kaos_digital.span.longitudeDelta=0.05;
        CoffeeAnnotation *coffee=[[CoffeeAnnotation alloc]initWithCoordinate:location];
        coffee.title=[dict objectForKey:@"name"];
        coffee.subtitle=[dict objectForKey:@"comments"];
        [mapView setRegion:kaos_digital];
        [mapView addAnnotation:coffee];
    }
    //[super viewDidAppear:YES];
}

@end
