//
//  WAI_LocationDetailVC.m
//  WhereAmI12
//
//  Created by Terry Payne on 08/11/2012.
//  Copyright (c) 2012 Terry Payne. All rights reserved.
//

#import "WAI_LocationDetailVC.h"
#import "WAI_LocationAnnotation.h"

@interface WAI_LocationDetailVC ()

@end

@implementation WAI_LocationDetailVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[[self navigationBar] topItem] setTitle:@"Add Location"];
    [[[self navigationBar] topItem] setPrompt:@"Locations can be saved with a name for later"];
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance([[self location] coordinate],
                                                                       0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    MKCoordinateRegion adjustedRegion = [[self mapView] regionThatFits:viewRegion];
    [[self mapView] setRegion:adjustedRegion animated:YES];
    
    // Managing the reverse GeoCoder
    CLGeocoder *gcrev = [[CLGeocoder alloc] init];
    [gcrev reverseGeocodeLocation:[self location] completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark* revMark = [placemarks objectAtIndex:0];
        NSArray *addressLines = [[revMark addressDictionary] objectForKey:@"FormattedAddressLines"];
        NSString *revAddress = [addressLines componentsJoinedByString:@"\n"];
        
        [[self addressLabel] setText:revAddress];
        
        // Add any code that also wants to utilise this address here in the geocoder block
        
        WAI_LocationAnnotation *annotation = [[WAI_LocationAnnotation alloc]
                                              initWithCoordinate:[[self location] coordinate]
                                              title:@"Save Location?"
                                              subtitle:revAddress];
        [[self mapView] addAnnotation:annotation];
    }];
    

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAction:(id)sender {
    [[self delegate] newLocationEntryComplete:self wasCancelled:NO];
}

- (IBAction)cancelAction:(id)sender {
    [[self delegate] newLocationEntryComplete:self wasCancelled:YES];
}
@end
