# scFEA result analysis
import pandas as pd

## get data
data = pd.read_csv('./scFEA_res.csv')
meta = pd.read_csv("./meta.csv")
data['cluster'] = meta['cell_type']
data['pid'] = meta['pid']

## mean expression for each celltype
cluster_mean = data.groupby('cluster').mean()
cluster_mean.to_csv('./cluster_mean.csv')

## mean expression for (celltype, patient)
bulk_mean = data.groupby(['pid', 'cluster']).mean()
bulk_mean.to_csv("./bulk_mean.csv")


