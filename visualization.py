import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import csv


#with open('results_combined.csv', 'r') as csvfile:
#    data = csv.reader(csvfile, delimiter = ';')

df_nohead = pd.read_csv('results_combined.csv', sep = ';', header = None)
  
# adding header 
headerList = ['Time', 'Threads', 'seqlen', 'dbsize', 'type'] 
  
# converting data frame to csv 
df_nohead.to_csv('results_combined2.csv', header=headerList, index=False) 

df = pd.read_csv('results_combined2.csv') 

print(df.head())
#print(df['Time'].head())




df.plot.scatter(x='dbsize', y='Time', c='seqlen', cmap='viridis', s=df['type'])
plt.xlabel('dbsize')
plt.ylabel('Time')
plt.title('test')
plt.legend()
plt.show()
