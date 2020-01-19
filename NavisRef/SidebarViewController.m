//
//  SidebarViewController.m
//  NavisRef
//
//  Created by KEVIN PHILLIPS on 9/8/13.
//  Copyright (c) 2013 KP Phillips. All rights reserved.
//

#import "SidebarViewController.h"
#import "SWRevealViewController.h"
#import "InterfaceViewController.h"
#import "SelectViewController.h"
#import "ProductsIAHelper.h"


@interface SidebarViewController ()
@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation SidebarViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"com.kpphillips.NavisRef.essentials1"]){
        NSLog(@"essential menu items");
        [self.tableView reloadData];
    }

    [super viewWillAppear:animated];
}





- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView setContentInset:UIEdgeInsetsMake(20, self.tableView.contentInset.left, self.tableView.contentInset.bottom, self.tableView.contentInset.right)];
    

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
   // self.view.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
   // self.tableView.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
   // self.tableView.separatorColor = [UIColor colorWithWhite:0.15f alpha:0.2f];
    
    
    _menuItems = @[@"main", @"User Interface", @"append", @"Saving Files", @"visibility", @"navigation", @"select", @"properties", @"find", @"sets" ,@"appProf", @"viewpoints", @"viewanim", @"sections", @"measurments", @"markups", @"timeliner", @"timelinerOptions", @"clashDetection"];
    
    
    //may need to use NSMutableArray to add and remove upgrade cell
    //use this to reload if used
    //[self.tableView reloadData];

    
    
}


- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[_menuItems objectAtIndex:indexPath.row] capitalizedString];
    
    NSLog(@"row pressed %ld", (long)indexPath.row);
    //destViewController.delegate = self;
    //SWRevealViewController *customViewController = segue.destinationViewController;
    //customViewController.delegate = segue.destinationViewController;
    
    // Set the photo if it navigates to the PhotoView
//    if ([segue.identifier isEqualToString:@"showPhoto"]) {
//        InterfaceViewController *photoController = (InterfaceViewController*)segue.destinationViewController;
//        NSString *photoFilename = [NSString stringWithFormat:@"%@_photo.jpg", [_menuItems objectAtIndex:indexPath.row]];
//        photoController.photoFilename = photoFilename;
//    }
    
    //place new seque puch here
    //if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
    //    SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
    //
    //    swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
    //
    //        UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
    //        [navController setViewControllers: @[dvc] animated: NO ];
    //        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
    //    };
    //    
    //}
    
    
}


//old SW file Segue implementation
//if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
//    SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
//    
//    swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
//        
//        UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
//        [navController setViewControllers: @[dvc] animated: NO ];
//        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
//    };
//    
//}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //return 0;

    //    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:transaction.payment.productIdentifier];

    //[[NSUserDefaults standardUserDefaults] boolForKey:@"com.kpphillips.NavisRef.essentials1"];
    
   

    if([[NSUserDefaults standardUserDefaults] boolForKey:@"com.kpphillips.NavisRef.essentials1"]){
        return [self.menuItems count];

        
    } else {
        
        return [self.menuItems count];

        //return 6;

    }
    
    //return [self.menuItems count];
   // return 6;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 //   static NSString *CellIdentifier = @"Cell";
 //   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    

    NSString *CellIdentifier = [self.menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    //Check the size of the cells here. Seems to be a bug in ios8
    if (tableView.rowHeight < 0) {
        tableView.rowHeight = 44;
    }
    //NSLog(@"Cell Height is @%f ", tableView.rowHeight);
    
    //this works to change background color
    //cell.contentView.superview.backgroundColor = [UIColor grayColor];
    
    cell.textLabel.backgroundColor = [UIColor redColor];
    
    //cell.textLabel.textColor = [UIColor blackColor];
    // Configure the cell...
    
    
    return cell;
}
//
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    
//    
//    NSString *cellString = @"string test";
//    return cellString;
//}


//// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    
    
}

@end
