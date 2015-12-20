//
//  WAI_LocationDetailVC.h
//  WhereAmI12
//
//  Created by Terry Payne on 08/11/2012.
//  Copyright (c) 2012 Terry Payne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#define METERS_PER_MILE 1609.344

@protocol WAI_LocationDetailVCDelegate;

@interface WAI_LocationDetailVC : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UINavigationBar *navigationBar;

- (IBAction)saveAction:(id)sender;
- (IBAction)cancelAction:(id)sender;

@property (strong, nonatomic) id <WAI_LocationDetailVCDelegate> delegate;
@property (strong, nonatomic)  CLLocation *location;

@end

@protocol WAI_LocationDetailVCDelegate
- (void) newLocationEntryComplete:(WAI_LocationDetailVC *)controller wasCancelled:(BOOL)cancelled;
@end
