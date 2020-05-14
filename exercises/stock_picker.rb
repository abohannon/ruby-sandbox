def stock_picker(prices)
  profit = 0
  low_price = 0
  high_price = 0
  # Run two loops where the outer loop represents the current day and the inner loop represents the future prices.
  # Subtract the current day from the future price and compare this sum to the current profit.
  # If the sum is larger, replace the previous profit with the new profit. If a new profit is found, also store the low and high values.
  prices.each_with_index do |price, index|
    for i in index..prices.length - 1
      if (prices[i] - prices[index]) > profit
        profit = prices[i] - prices[index]
        low_price = prices[index]
        high_price = prices[i]
      end
    end
  end

  puts "You should buy at $#{low_price} and sell at $#{high_price} for the highest return of $#{profit}."
  puts "Wow, the market is bad!" if low_price == high_price
end

stock_picker([17,3,6,9,15,16,6,30,10])
stock_picker([0,3,6,9,1,16,6,30,0])
stock_picker([15,4])