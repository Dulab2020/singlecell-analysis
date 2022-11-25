# cell percent
import pandas as pd
data = pd.read_csv('./meta.csv')
## cal cell percent for each cluster
### total cell num of each sample
total_sample = data.groupby('pid').count().iloc[:, 0]

### each cell percent of each sample
all_percent = pd.DataFrame()
for i in set(data['cluster']):
  x = data[data['cluster'] == i]
  cur_cluster = x.groupby('pid').count().iloc[:, 0]
  cur_percent = pd.DataFrame((cur_cluster / total_sample)).fillna(0)
  cur_percent.columns = [i]
  all_percent = pd.concat([all_percent, cur_percent], axis=1)