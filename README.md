
# 📊 Superstore Sales Analysis

---

## 1. Background Overview

This project analyzes the **Superstore Dataset** ([Kaggle link](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)), which contains order-level information such as sales, profit, category, region, and customer details.

The main objectives are to uncover:

* What are the sales trends across years?
* Which categories and regions contribute the most?
* Where are the growth opportunities?
* How can profitability be improved?

**Workflow:**

* **SQL** → inspection, cleaning, and business queries (`all_queries.sql`, results in `/queries_results/`)
* **Excel** → pivot tables & charts (`/excel/superstore_analysis.xlsx`)
* **Power BI** → interactive dashboard (`/powerbi/superstore_dashboard.pbix`)

---

## 2. Data Structure Overview

The dataset includes:

* **Dates**: Order Date, Ship Date
* **Numerical**: Sales, Quantity, Profit, Discount
* **Categorical**: Category, Sub-Category, Region, Country, Customer

A **Date Table** was created in Power BI to support accurate time-series analysis.

---

## 3. Executive Summary

* **Total Sales (2014–2017):** \~\$2.29M
* **Annual Sales:**

  * 2014 → \$484K
  * 2015 → \$470K
  * 2016 → \$609K
  * 2017 → \$733K (📈 +55% vs. 2015)
* **Top Category:** Technology → \~\$836K (36% of total sales)
* **Top Region:** West → \~\$725K (32% of total sales)
* **2014 Quantity Sold:** 7,581 units

---

## 4. Insights Deep Dive

### Category Performance

* **Technology** dominates with **36% of total sales**, indicating it is the main revenue driver.
* **Furniture (32%)** and **Office Supplies (31%)** are nearly equal but slightly lagging behind Technology.
* Strategy: Technology is the “star” category, but Furniture and Office Supplies still represent solid opportunities.

### Regional Performance

* **West (32%)** and **East (30%)** are the strongest regions.
* **South (17%)** is the weakest, underperforming compared to others.
* Focused regional campaigns could improve South’s contribution.

### Trends & Growth

* Sales showed steady growth across the years, peaking in **2017 with \$733K**, a **+55% increase from 2015**.
* Seasonal peaks are visible in **Q4 (October–December)**, with December consistently showing high revenues.

### Quantity & Volume

* In 2014, **7,581 units** were sold.
* Quantity trends align with sales, spiking toward the year-end (holiday season effect).

---

## 5. Recommendations

* **Expand Technology Product Lines:** Since Technology generates the highest revenue share, introducing complementary items (e.g., accessories, bundles) could boost sales further.
* **Boost South Region Sales:** Consider targeted discounts, localized promotions, or distribution improvements to raise performance.
* **Leverage Q4 Peaks:** Run holiday promotions and loyalty campaigns before Q4 to maximize already strong seasonal sales.
* **Diversify Product Mix:** Reduce over-reliance on Technology by strengthening Furniture and Office Supplies offerings.
* **Optimize Discounts:** Monitor discount strategies, especially in Furniture, to protect profitability margins.
* **Customer Retention Programs:** Introduce loyalty incentives for repeat buyers to stabilize long-term sales.


