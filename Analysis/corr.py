# corr
import pandas as pd
from scipy.stats import spearmanr

data = read.csv('./meta.csv')
## corr for two collumns
corr_res = spearmanr(data['A'], data['B'])
corr_val = corr_res[0]
corr_pval = corr_res[1]

## corr for an dataset and select the pval > 0.05 items
score = data.corr('spearman')

for i in score.index:
    for j in score.columns:
        if spearmanr(data[i].values, data[j].values)[1] > 0.05:
            score.loc[i, j] = 0