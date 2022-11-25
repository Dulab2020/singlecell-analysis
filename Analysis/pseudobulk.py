# pseudobulk
import pandas as pd
data = pd.read_csv('./data.csv', index_col = 0)
## do aggregate
groups = ['patient_id', 'cluster']
pb = data.groupby(groups).mean()