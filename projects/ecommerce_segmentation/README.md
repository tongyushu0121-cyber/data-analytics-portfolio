# Project: E-commerce Customer Segmentation (SQL + Python)

**Goal**: Build RFM features from transaction logs with SQL, then perform customer segmentation using KMeans in Python.

## Data
- Use the UCI Online Retail dataset or any ecommerce transactions with columns like:
  - `InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country`

## Steps
1. Load CSV → SQLite (or your DB).  
2. SQL to aggregate RFM features per `CustomerID`.  
3. Export the features → Python for scaling and KMeans.  
4. Evaluate with silhouette score and profile each cluster.  
5. Save a final `customer_segments.csv` + short write-up.

## Deliverables
- `notebooks/01_ecommerce_rfm_kmeans.ipynb`
- `sql/queries.sql`
- `customer_segments.csv` (generated)
- 2–3 charts (RFM distributions, cluster profiles)

## How to run
- Python 3.10+; `pip install pandas numpy scikit-learn matplotlib sqlalchemy`  
- Open the notebook and follow the cells. The notebook can also **generate a small synthetic dataset** if you don't have one yet.