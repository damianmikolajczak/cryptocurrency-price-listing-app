//
//  TickerDetailViewController.m
//  Cryptocurrency price listing app
//
//  Created by Damian Mikołajczak on 15/07/2021.
//

#import "TickerDetailViewController.h"

@interface TickerDetailViewController ()

@property NSMutableArray *markets;

@end

@implementation TickerDetailViewController
@synthesize ticker, markets;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self fetchDataFromApi];
    [_marketsTable setDelegate:self];
    [_marketsTable setDataSource:self];
    
    [[_violetRect layer] setCornerRadius:15.0];
    [[_blueRect layer] setCornerRadius:15.0];
    
    [_coinName setText:[NSString stringWithFormat:@"%@ (%@)",[ticker valueForKey:@"name"], [ticker valueForKey:@"symbol"]]];
    
    
    [_priceInUSD setText: [ticker valueForKey:@"price_usd"]];
    [_priceInBTC setText: [ticker valueForKey:@"price_btc"]];
    
    [_percentChangeLastHour setText: [NSString stringWithFormat:@"%@%%",[ticker valueForKey:@"percent_change_1h"]]];
    if (_percentChangeLastHour.text.doubleValue >= 0.0) { [_percentChangeLastHour setTextColor:UIColor.greenColor]; }
    
    [_percentChangeLastDay setText: [NSString stringWithFormat:@"%@%%",[ticker valueForKey:@"percent_change_24h"]]];
    if (_percentChangeLastDay.text.doubleValue >= 0.0) { [_percentChangeLastDay setTextColor:UIColor.greenColor]; }
    
    [_percentChangeLastWeek setText: [NSString stringWithFormat:@"%@%%",[ticker valueForKey:@"percent_change_7d"]]];
    if (_percentChangeLastWeek.text.doubleValue >= 0.0) { [_percentChangeLastWeek setTextColor:UIColor.greenColor]; }
}

- (void)fetchDataFromApi {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.coinlore.net/api/coin/markets/?id=%@", [ticker valueForKey:@"id"]]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        if (data == nil) { return; }
        
        self.markets = [NSJSONSerialization JSONObjectWithData:data
                                                          options:0
                                                            error:nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.marketsTable reloadData];
        });
        
    }];
    
    [task resume];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSDictionary *market = [markets objectAtIndex:indexPath.row];
    MarketsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MARKET_TABLE_CELL" forIndexPath:indexPath];
    
    NSLog(@"Name = %@",[market valueForKey:@"name"]);
    NSLog(@"Base = %@",[market valueForKey:@"base"]);
    NSLog(@"Price = %@",[market valueForKey:@"price"]);
    
    [cell.name setText: [NSString stringWithFormat:@"%@", [market valueForKey:@"name"]]];
    [cell.base setText: [NSString stringWithFormat:@"%@", [market valueForKey:@"base"]]];
    [cell.price setText: [NSString stringWithFormat:@"%@", [market valueForKey:@"price"]]];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.markets count];
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return YES;
}

@end
