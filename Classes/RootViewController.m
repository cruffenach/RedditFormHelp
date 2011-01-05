//
//  RootViewController.m
//  RedditFormHelp
//
//  Created by Collin Ruffenach on 1/5/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithRed:.1 green:.1 blue:.1 alpha:1];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


#pragma mark -
#pragma mark Table view data source

- (void) configureCell:(UITableViewCell*)_cell atIndexPath:(NSIndexPath*)_indexPath {

	if(_indexPath.section == 0) {
	
		if(_indexPath.row == 0 || _indexPath.row == 1) {
			UISwitch *_switch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 5, 25, 20)];
			_cell.accessoryView = _switch;
			[_switch release];
			_cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
			_cell.textLabel.textColor = [UIColor colorWithRed:.8 green:.8 blue:.8 alpha:1];
			_cell.contentView.backgroundColor = [UIColor clearColor];
			_cell.backgroundColor = [UIColor grayColor];
			
			if(_indexPath.row == 0) {
			
				_cell.textLabel.text = @"Reset to zero daily:";
			}
			
			else {
				_cell.textLabel.text = @"Consolidate by day:";
			}
		}
		
		else {
			_cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
			_cell.textLabel.textColor = [UIColor colorWithRed:.8 green:.8 blue:.8 alpha:1];
			_cell.contentView.backgroundColor = [UIColor clearColor];
			_cell.textLabel.text = @"Goal:\t\t\t100";
			_cell.backgroundColor = [UIColor grayColor];
		}
	}
	
	else {
		
		if(_indexPath.row == 0) {
			
			UISwitch *_switch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 5, 25, 20)];
			_cell.accessoryView = _switch;
			[_switch release];
			_cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
			_cell.textLabel.textColor = [UIColor colorWithRed:.8 green:.8 blue:.8 alpha:1];
			_cell.textLabel.text = @"Tweet data points:";
			_cell.contentView.backgroundColor = [UIColor clearColor];
			_cell.backgroundColor = [UIColor grayColor];
		}
		
		else {
			
			_cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
			_cell.textLabel.textColor = [UIColor colorWithRed:.8 green:.8 blue:.8 alpha:1];
			_cell.textLabel.text = @"Tweet String:";
			_cell.contentView.backgroundColor = [UIColor clearColor];
			_cell.backgroundColor = [UIColor grayColor];
		}
	}
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	if(section == 0) {
	
		return 3;
	}
	
	else {
	
		return 2;
	}
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	[self configureCell:cell atIndexPath:indexPath];

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

	if(section == 1) {
		UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 320, 50)];
		[headerLabel setBackgroundColor:[UIColor colorWithRed:.1 green:.1 blue:.1 alpha:1]];
		[headerLabel setText:@"      Twitter Options:"];
		[headerLabel setTextColor:[UIColor colorWithRed:.8 green:.8 blue:.8 alpha:1]];
		[headerLabel setFont:[UIFont boldSystemFontOfSize:14]];
		
		return [headerLabel autorelease];	
	}

	return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	
	if(section == 1) {
		return 50;	
	}
	
	else {
		return 0;	
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

