//
//  WAI_MapVC.h
//  WhereAmI12
//
//  Created by Terry Payne on 07/11/2012.
//  Copyright (c) 2012 Terry Payne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "WAI_LocationDetailVC.h"
#import "x4ql_CommunicateDelegate.h"
#import "x4ql_CoffeeDelegate.h"

#define METERS_PER_MILE 1609.344

@interface WAI_MapVC : UIViewController <CommunicateDelegate,CLLocationManagerDelegate,WAI_LocationDetailVCDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;

@property (nonatomic,assign) id<CoffeeDelegate> coffeedelegate;

@property (nonatomic) CLLocationCoordinate2D newUserLocation;

//@property (strong, nonatomic) IBOutlet UILabel *latitudeLabel;
//@property (strong, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (strong, nonatomic) IBOutlet UIButton *addButton;


- (IBAction)touchEvent:(id)sender;

- (IBAction)addAction:(id)sender;

- (void)clearAnnotations;

- (void)getCurPosition;
@end
