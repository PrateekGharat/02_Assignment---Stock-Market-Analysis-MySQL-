# 02_Assignment-Stock-Market-Analysis-MySQL

# Problem Introduction
Two of India's biggest stock exchanges BSE and NSE, collectively clear trades combining to greater than 40,000 crores every day. As you might already be aware, a lot of trading happens on the basis of technical and fundamental analysis.

# Data Set
The dataset provided here has been extracted from the NSE website. The Stock price data provided is from 1-Jan-2015 to 31-July-2018 for six stocks Eicher Motors, Hero, Bajaj Auto, TVS Motors, Infosys and TCS.

Please note that for the days where it is not possible to calculate the required Moving Averages, it is better to ignore these rows rather than trying to deal with NULL by filling it with average value as that would make no practical sense.

Create a new schema named 'Assignment'

Import the CSV files in MySQL, naming the tables as the name of the stocks. 

# Results Expected
1. Create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA. (This has to be done for all 6 stocks)

2. Create a master table containing the date and close price of all the six stocks. (Column header for the price is the name of the stock)

3. Use the table created in Part(1) to generate buy and sell signal. Store this in another table named 'bajaj2'. Perform this operation for all stocks.

4. Create a User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock.

5. Write a brief summary of the results obtained and what inferences you can draw from the analysis performed. (Less than 250 words to be submitted in a pdf file)
