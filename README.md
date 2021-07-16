# Cryptocurrency price listing app
## Introduction
This is a cryptocurrency price list mobile app for iOS powered by the <a href="https://www.coinlore.com/cryptocurrency-data-api">CoinLore API</a> to deliver the newest information about cryptocurrencies to the user.
The user can see a table with the top 100 currencies with their name and price. Selecting one of the coins shows a detaild with more information like the rank, percent change over time, top 50 markets etc.

## Technologies
The cryptocurrency price listing mobile app was writen in Objective-C using the UIKit ans Foundation frameworks.
The views were made using storyboard files but some of the properties were added programatically in code - like the rounded edges on the background cards (see screenshots).
The data about each ticker is supplied by the <a href="https://www.coinlore.com/cryptocurrency-data-api">CoinLore API</a>!

## Screenshots
When a user enters the app a table view will apear.
The table view shows some basic information about the tickers like the name, symbol and price in USD.
Tapping a row shows a detailed view of the selected coin. Besides some exchange info like the rank, market capacity and volume, the user can see a price in USD and BTC.
On the bottom part of the view there is a table view with the top 50 markets, their base and current price of the cryptocurrency.
<img src="Cryptocurrency%20price%20listing%20app/Images/mainScreen.PNG" width="300"> <img src="Cryptocurrency%20price%20listing%20app/Images/detailViewScreen.PNG" width="300">
