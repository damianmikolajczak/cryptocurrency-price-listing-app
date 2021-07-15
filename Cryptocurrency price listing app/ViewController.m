//
//  ViewController.m
//  Cryptocurrency price listing app
//
//  Created by Damian Mikołajczak on 15/07/2021.
//

#import "ViewController.h"

@interface ViewController ()
@property NSMutableArray *tickers;

@end

@implementation ViewController

@synthesize tickers;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self fetchDataFromApi];
    [_tickersTable setDataSource:self];
    [_tickersTable setDelegate:self];
}

- (void)fetchDataFromApi {
    NSURL *url = [NSURL URLWithString:@"https://api.coinlore.net/api/tickers/?start=0&limit=20"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        if (data == nil) { return; }
        
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        self.tickers = [result valueForKey:@"data"];
        NSLog(@"%@",self.tickers);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tickersTable reloadData];
        });
    }];
    
    [task resume];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSDictionary *ticker = [tickers objectAtIndex:indexPath.row];
    TickerTableViewCell *cell = [_tickersTable dequeueReusableCellWithIdentifier:@"TickerCell"
                                                                forIndexPath:indexPath];
    [cell.name setText: [ticker valueForKey:@"name"]];
    [cell.symbol setText: [ticker valueForKey:@"symbol"]];
    [cell.price setText: [NSString stringWithFormat:@"$%@",[ticker valueForKey:@"price_usd"]]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tickers count];
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TickerDetailViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"TICKER_DETAIL_VC"];
    NSDictionary *ticker = [tickers objectAtIndex:indexPath.row];
    
    [vc setTicker:ticker];
    [vc setModalPresentationStyle:UIModalPresentationPopover];
    [self presentViewController:vc animated:YES completion:NULL];
}


@end
