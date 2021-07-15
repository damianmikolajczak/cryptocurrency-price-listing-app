//
//  TickerDetailViewController.m
//  Cryptocurrency price listing app
//
//  Created by Damian Mikołajczak on 15/07/2021.
//

#import "TickerDetailViewController.h"

@interface TickerDetailViewController ()

@end

@implementation TickerDetailViewController
@synthesize ticker;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[_violetRect layer] setCornerRadius:20.0];
    [[_blueRect layer] setCornerRadius:20.0];
    
    [_priceInUSD setText: [ticker valueForKey:@"price_usd"]];
    [_priceInBTC setText: [ticker valueForKey:@"price_btc"]];
    
    [_percentChangeLastHour setText: [NSString stringWithFormat:@"%@%%",[ticker valueForKey:@"percent_change_1h"]]];
    if (_percentChangeLastHour.text.doubleValue >= 0.0) { [_percentChangeLastHour setTextColor:UIColor.greenColor]; }
    
    [_percentChangeLastDay setText: [NSString stringWithFormat:@"%@%%",[ticker valueForKey:@"percent_change_24h"]]];
    if (_percentChangeLastDay.text.doubleValue >= 0.0) { [_percentChangeLastDay setTextColor:UIColor.greenColor]; }
    
    [_percentChangeLastWeek setText: [NSString stringWithFormat:@"%@%%",[ticker valueForKey:@"percent_change_7d"]]];
    if (_percentChangeLastWeek.text.doubleValue >= 0.0) { [_percentChangeLastWeek setTextColor:UIColor.greenColor]; }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
