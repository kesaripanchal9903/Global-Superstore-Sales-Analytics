# Key Business Insights & Recommendations

## Project: Sales & Business Performance Analytics

This document presents the key business findings identified through SQL analysis of the Global Superstore dataset containing 51,290 records.

---

## 1. Overall Business Performance

### Key Metrics

| Metric | Result |
|---|---:|
| Total Sales | $12,642,905.00 |
| Total Profit | $1,467,457.29 |
| Profit Margin | 11.61% |
| Total Orders | 25,035 |
| Total Customers | 4,873 |
| Total Quantity Sold | 178,312 |

### Business Insight
The business generated approximately $12.64 million in sales and $1.47 million in profit, with an overall profit margin of 11.61%.

### Recommendation
Focus on improving profitability alongside sales growth by reviewing product performance, regional margins, discount strategies, and shipping costs.

---

## 2. Year-wise Business Performance

### Key Findings

| Year | Sales | Profit | Profit Margin | YoY Sales Growth | YoY Profit Growth |
|---|---:|---:|---:|---:|---:|
| 2011 | $2,259,511 | $248,940.81 | 11.02% | - | - |
| 2012 | $2,677,493 | $307,415.28 | 11.48% | 18.50% | 23.49% |
| 2013 | $3,405,860 | $406,935.23 | 11.95% | 27.20% | 32.37% |
| 2014 | $4,300,041 | $504,165.97 | 11.72% | 26.25% | 23.89% |

### Business Insight
Sales and profit increased every year. The strongest sales and profit growth occurred in 2013. 
In 2014, profit growth (23.89%) was lower than sales growth (26.25%), and profit margin declined from 11.95% to 11.72%.

### Recommendation
Investigate the 2014 profitability slowdown by analysing discounts, product-level margins, regional performance, and shipping costs.

---

## 3. Regional Business Performance

### Key Findings

| Region | Sales | Profit | Profit Margin |
|---|---:|---:|---:|
| Central | $2,822,399 | $311,403.98 | 11.03% |
| South | $1,600,960 | $140,355.77 | 8.77% |
| North | $1,248,192 | $194,597.95 | 15.59% |
| Oceania | $1,100,207 | $120,089.11 | 10.92% |
| Southeast Asia | $884,438 | $17,852.33 | 2.02% |
| North Asia | $848,349 | $165,578.42 | 19.52% |
| EMEA | $806,184 | $43,897.97 | 5.45% |
| Africa | $783,776 | $88,871.63 | 11.34% |
| Central Asia | $752,839 | $132,480.19 | 17.60% |
| West | $725,514 | $108,418.45 | 14.94% |
| East | $678,834 | $91,522.78 | 13.48% |
| Caribbean | $324,281 | $34,571.32 | 10.66% |
| Canada | $66,932 | $17,817.39 | 26.62% |

### Business Insight
Central recorded the highest sales and profit. 
Canada had the highest profit margin at 26.62%, although its sales contribution was relatively low. 
Southeast Asia had the lowest margin at 2.02%, followed by EMEA at 5.45%.

### Recommendation
Review discount policies, product mix, and shipping expenses in Southeast Asia and EMEA. 
Study the business practices of high-margin regions such as North Asia and Canada.

---

## 4. Category-wise Business Performance

### Key Findings

| Category | Sales | Profit | Profit Margin |
|---|---:|---:|---:|
| Technology | $4,744,691 | $663,778.73 | 13.99% |
| Furniture | $4,110,884 | $285,204.72 | 6.94% |
| Office Supplies | $3,787,330 | $518,473.83 | 13.69% |

### Business Insight
Technology generated the highest sales and profit. 
Office Supplies recorded the highest quantity sold, while Furniture had the lowest profit margin despite substantial sales.

### Recommendation
Maintain focus on Technology, investigate Furniture profitability, and explore cross-selling opportunities within Office Supplies.

---

## 5. Sub-Category Profitability

### Key Findings

| Sub-Category | Sales | Profit | Profit Margin |
|---|---:|---:|---:|
| Tables | $757,034 | -$64,083.39 | -8.47% |
| Copiers | $1,509,439 | $258,567.55 | 17.13% |
| Phones | $1,706,874 | $216,717.01 | 12.70% |
| Machines | $779,071 | $58,867.87 | 7.56% |
| Chairs | $1,501,682 | $140,396.27 | 9.35% |
| Storage | $1,127,124 | $108,461.49 | 9.62% |

### Business Insight
Tables was the only loss-making sub-category, generating a loss of $64,083.39. 
Copiers generated the highest profit, while Phones recorded the highest sales.

### Recommendation
Investigate pricing, discounting, and costs associated with Tables. 
Review the profitability of Machines, Chairs, and Storage, and study the performance drivers behind Copiers.

---

## 6. Impact of Discounts on Profitability

### Key Findings

| Discount | Sales | Profit | Profit Margin |
|---|---:|---:|---:|
| 0% | $6,992,734 | $1,770,695.27 | 25.32% |
| 10% | $1,579,618 | $259,064.18 | 16.40% |
| 20% | $1,203,855 | $117,715.87 | 9.78% |
| 30% | $188,913 | -$19,685.85 | -10.42% |
| 40% | $559,557 | -$143,748.46 | -25.69% |
| 50% | $324,145 | -$158,629.88 | -48.94% |
| 60% | $184,586 | -$163,954.69 | -88.82% |
| 70% | $139,770 | -$186,350.48 | -133.33% |

### Business Insight
Lower discount levels were associated with stronger profit margins. 
At a 30% discount, the aggregated profit margin was already negative. 
Higher discount levels showed substantial losses.

### Recommendation
Review discount policies, introduce minimum margin checks, and evaluate promotions based on profitability rather than sales volume alone.

Note: This analysis identifies an association between discount levels and profitability; it does not establish that discounts alone caused the losses.

---

## 7. Customer Segment Performance

### Key Findings

| Segment | Sales | Profit | Profit Margin |
|---|---:|---:|---:|
| Consumer | $6,508,141 | $749,239.78 | 11.51% |
| Corporate | $3,824,808 | $441,208.33 | 11.54% |
| Home Office | $2,309,956 | $277,009.18 | 11.99% |

### Business Insight
Consumer contributed approximately 51.5% of total sales and generated the highest profit. 
Home Office had the highest profit margin at 11.99%.

### Recommendation
Focus on Consumer customer retention, explore Home Office growth opportunities, and develop targeted strategies for Corporate customers.

---

## 8. Customer Profitability Analysis

### Key Findings

| Customer Status | Customers | Sales | Profit |
|---|---:|---:|---:|
| Profitable | 3,812 | $10,565,214 | $1,842,808.16 |
| Break-even | 3 | $181 | $0 |
| Loss-making | 1,058 | $2,077,510 | -$375,350.87 |

### Business Insight
Approximately 78.23% of customers were profitable, while 21.71% were loss-making. 
Loss-making customers generated substantial sales but collectively contributed a loss of $375,350.87.

### Recommendation
Identify products, discounts, and purchasing patterns associated with loss-making customers. 
Review pricing and promotional strategies while retaining profitable customers.

Note: Customer profitability is based on each customer's cumulative profit across all their orders.

---

## 9. Shipping Mode Performance

### Key Findings

| Shipping Mode | Orders | Sales | Profit | Avg. Shipping Days |
|---|---:|---:|---:|---:|
| Standard Class | 15,154 | $7,578,889 | $890,596.02 | 5.00 |
| Second Class | 5,119 | $2,565,747 | $292,583.53 | 3.23 |
| First Class | 3,821 | $1,831,067 | $208,104.68 | 2.18 |
| Same Day | 1,347 | $667,202 | $76,173.07 | 0.04 |

### Business Insight
Standard Class was the most frequently used shipping mode and generated the highest sales and profit. 
Same Day had the shortest average shipping duration.

### Recommendation
Review shipping expenses, retain Standard Class as a major delivery option, and evaluate whether customers are willing to pay more for faster delivery.

Note: Average shipping duration was calculated at the dataset row level, not after aggregating to one record per order.

---

## 10. Monthly Sales Trend

### Key Findings

| Month | Sales | Profit | Orders |
|---|---:|---:|---:|
| December | $1,580,816 | $170,718.13 | 3,166 |
| November | $1,551,319 | $175,449.48 | 3,145 |
| September | $1,437,432 | $170,438.18 | 3,021 |
| August | $1,293,852 | $151,854.11 | 2,500 |
| June | $1,269,751 | $147,079.42 | 2,662 |
| October | $1,168,220 | $157,269.36 | 2,290 |
| May | $904,061 | $104,509.78 | 1,897 |
| March | $770,519 | $94,087.52 | 1,555 |
| July | $749,423 | $78,070.09 | 1,561 |
| April | $698,603 | $73,513.63 | 1,506 |
| January | $675,141 | $73,535.38 | 1,271 |
| February | $543,768 | $70,932.20 | 1,104 |

### Business Insight
December recorded the highest aggregated monthly sales and order count, while November generated the highest profit. 
February recorded the lowest sales, profit, and order count.

### Recommendation
Plan inventory and logistics for the November–December peak period. 
Investigate November's stronger profitability and identify opportunities to improve February demand.

Note: Monthly figures are aggregated across all years. They show an overall monthly pattern, not proof of recurring year-by-year seasonality.

---

## Overall Conclusion

The analysis highlights strong overall sales growth, but also identifies opportunities to improve profitability through better discount management,
product-level cost control, regional performance monitoring, customer profitability analysis, and shipping cost optimisation.
