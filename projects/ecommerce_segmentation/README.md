
# E-commerce Customer Segmentation

**Goal**: Identify customer groups using RFM features and KMeans clustering.

**Process**:
- Built RFM features (Recency, Frequency, Monetary) from transactions
- Standardized features and applied KMeans clustering
- Selected best k using silhouette score
- Profiled segments by average recency, frequency, and monetary value

**Findings (example run)**:
- Segment 0: High spend, frequent buyers → VIP customers
- Segment 1: Medium activity, declining recency → At-risk customers
- Segment 2: Low frequency, low spend → One-time buyers

**Deliverables**:
- `01_ecommerce_rfm_kmeans.ipynb` (code and charts)
- `customer_segments.csv` (results)
