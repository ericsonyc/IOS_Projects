//
//  TableViewController2.m
//  CoffeeShop15
//
//  Created by jie liu on 13/12/2015.
//  Copyright © 2015 ericson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "x4ql_TableViewController2.h"
#import "x4ql_Coffees.h"
#import "WAI_MapVC.h"

@interface TableViewController2 ()

@end


@implementation TableViewController2

@synthesize enterBtn;
@synthesize array;
@synthesize backBtn;
@synthesize navigator;
@synthesize mytableview;
@synthesize data;

NSUInteger totalrow;
BOOL show=YES;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *arrayValue=[[NSMutableArray alloc]init];
    [arrayValue addObject:@"Liverpool Coffee Houses"];
    [arrayValue addObject:@"Cupertino Coffee Houses"];
    self.array=arrayValue;
    mytableview.dataSource=self;
    mytableview.delegate=self;
    backBtn.hidden=YES;
    
    
    
}

- (void)viewDidUnload{
    [super viewDidUnload];
    self.array=nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (show==YES) {
        static NSString *TableSampleIndentifier=@"TableSampleIdentifier";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:TableSampleIndentifier];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:TableSampleIndentifier];
        }
        NSUInteger row=[indexPath row];
        cell.textLabel.text=[self.array objectAtIndex:row];
        cell.detailTextLabel.text=nil;
        
        /*enterBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        enterBtn.frame=CGRectMake(0, 0, 100, 25);
        [enterBtn setTitle:@"enter" forState:UIControlStateNormal];
        [enterBtn addTarget:self action:@selector(touchEvent:) forControlEvents:UIControlEventTouchUpInside];*/
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        totalrow=row;
        /*if (indexPath!=nil) {
            [self tableView:mytableview accessoryButtonTappedForRowWithIndexPath:indexPath];
        }*/
        
        return cell;
    }else{
        static NSString *TableSampleIdentifier=@"TableSampleIdentifier";
        UITableViewCell *cell=[mytableview dequeueReusableCellWithIdentifier:TableSampleIdentifier];
        if(cell==nil){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:TableSampleIdentifier];
        }else{
            cell.accessoryType=UITableViewCellAccessoryNone;
            /*while ([cell.contentView.subviews lastObject]!=nil) {
                [(UIView *)[cell.contentView.subviews lastObject]removeFromSuperview];
            }*/
           
            
        }
        //NSUInteger row=[indexPath row];
        NSDictionary *dict=[array objectAtIndex:[indexPath row]];
        
        //cell.textLabel.text=@"hello";
        //cell.detailTextLabel.text=@"world";
        cell.detailTextLabel.text=[dict objectForKey:@"comments"];
        cell.textLabel.text=[dict objectForKey:@"name"];
        
        return cell;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (show==YES && indexPath!=nil) {
        [self tableView:mytableview accessoryButtonTappedForRowWithIndexPath:indexPath];
        //[navigator.backBarButtonItem setEnabled:YES];
    }else{
        NSDictionary *dict=[array objectAtIndex:[indexPath row]];
        [_mydelegate selectCoffeeShop:CLLocationCoordinate2DMake([[dict objectForKey:@"latitude"]doubleValue], [[dict objectForKey:@"longitude"]doubleValue])];
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    backBtn.hidden=NO;
    show=NO;
    navigator.title=[array objectAtIndex:[indexPath row]];
    
    //NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"CityCycleRideLocations" ofType:@"plist"];
    //NSMutableArray *anArray=[[NSMutableArray alloc]initWithContentsOfFile:plistPath];
    
    //data=[NSArray arrayWithArray:anArray];
    data=[Coffees getArrayCoffees];
    //self.currentUserLocation=[_mydelegate getLocation];
    //float longitude=self.currentUserLocation.longitude;
    //float latitude=self.currentUserLocation.latitude;
    array=[data objectAtIndex:[indexPath row]];
    [self sortCafes];
    
    [_mydelegate showAllPins:array];
    //[mytableview reloadData];
}

//- (IBAction)touchEvent:(id)sender {
//    backBtn.hidden=NO;
//    navigator.title=[array objectAtIndex:totalrow];
//    
//    //NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"CityCycleRideLocations" ofType:@"plist"];
//    //NSMutableArray *anArray=[[NSMutableArray alloc]initWithContentsOfFile:plistPath];
//    
//    //data=[NSArray arrayWithArray:anArray];
//    
//    array=[data objectAtIndex:totalrow];
//    show=NO;
//    [mytableview reloadData];
//}

- (IBAction)backEvent:(id)sender {
    backBtn.hidden=YES;
    NSMutableArray *arrayValue=[[NSMutableArray alloc]init];
    [arrayValue addObject:@"Liverpool Coffee Houses"];
    [arrayValue addObject:@"Cupertino Coffee Houses"];
    array=arrayValue;
    show=YES;
    //clear pins
    [_mydelegate clearPins];
    
    [mytableview reloadData];
}

- (void)sortCafes{
    self.currentUserLocation=[_mydelegate getLocation];
    NSLog(@"%f",self.currentUserLocation.latitude);
    NSLog(@"%f",self.currentUserLocation.longitude);
    NSInteger count=[array count];
    if (show==NO) {
        NSMutableArray *mutable=[array mutableCopy];
        double longitude=self.currentUserLocation.longitude;
        double lantitude=self.currentUserLocation.latitude;
        NSDictionary *dict1;
        NSDictionary *dict2;
        for (int i=0;i<count;i++) {
            for (int j=0; j<count-i-1; j++) {
                dict1=[mutable objectAtIndex:j];
                dict2=[mutable objectAtIndex:j+1];
                double longitude2=[[dict1 objectForKey:@"longitude"]doubleValue];
                double latitude2=[[dict1 objectForKey:@"latitude"]doubleValue];
                double distance1=[self DistanceLongitude1:longitude Lantitude1:lantitude Longitude2:longitude2 Lantitude2:latitude2];
                double distance2=[self DistanceLongitude1:longitude Lantitude1:lantitude Longitude2:[[dict2 objectForKey:@"longitude"]doubleValue] Lantitude2:[[dict2 objectForKey:@"latitude"]doubleValue]];
                if (distance1>distance2) {
                    [mutable exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                }
            }
        }
        array=[mutable copy];
        [mytableview reloadData];
    }
}


- (double)DistanceLongitude1:(double)longitude1 Lantitude1:(double)lantitude1 Longitude2:(double)longtitude2 Lantitude2:(double)lantitude2{
//    double er=6378137;
//    double radlat1=PI*lantitude1/180.0f;
//    double radlat2=PI*lantitude2/180.0f;
//    double radlong1=PI*longitude1/180.0f;
//    double radlong2=PI*longtitude2/180.0f;
//    
//    if(radlat1<0)
//        radlat1=PI/2+fabs(radlat1);
//    if (radlat1>0) {
//        radlat1=PI/2-fabs(radlat1);
//    }
//    if (radlong1<0) {
//        radlong1=PI*2-fabs(radlong1);
//    }
//    if (radlat2<0) {
//        radlat2=PI/2+fabs(radlat2);
//    }
//    if (radlat2>0) {
//        radlat2=PI/2-fabs(radlat2);
//    }
//    if (radlong2<0) {
//        radlong2=PI*2-fabs(radlong2);
//    }
//    double x1=er*cos(radlong1)*sin(radlat1);
//    double y1=er*sin(radlong1)*sin(radlat1);
//    double z1=er*cos(radlat1);
//    
//    double x2=er*cos(radlong2)*sin(radlat2);
//    double y2=er*sin(radlong2);
//    double z2=er*cos(radlat2);
//    
//    double d=sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)+(z1-z2)*(z1-z2));
//    double theta=acos((er*er+er*er-d*d)/(2*er*er));
//    double dist=theta*er;
    double dist=0;
    CLLocation *location1=[[CLLocation alloc]initWithLatitude:lantitude1 longitude:longitude1];
    CLLocation *location2=[[CLLocation alloc]initWithLatitude:lantitude2 longitude:longtitude2];
    dist=[location1 distanceFromLocation:location2]/1000;
    return dist;
}

@end