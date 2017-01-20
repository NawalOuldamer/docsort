
# -*- coding: utf8 -*-

# USAGE:
# python text-cleaning-mongo.py

# preliminaries
from pymongo import MongoClient
import pandas as pd
import time
data_root = "/Users/`whoami`/Code/data_word2vec/"

n_lim = 1800000

# grab data from database and convert to pandas dataframe
client = MongoClient()
db = client.scrapping  # access target database
collection = db.job_offers  # access target collection within the target database

start = time.time()

data = pd.DataFrame(list(collection.find().limit(n_lim)))  # 500000 each row is one document; the raw text of the document should be in the 'text_data' column
data = data['jobDescription']


# http://docs.python.org/howto/unicode.html    p.agent_info = u' '.join((agent_contact, agent_telno)).encode('utf-8').strip()

with open(data_root+"out1m8.txt", 'w') as wrf:
    for ind in range(n_lim): wrf.write(data[ind].encode('utf-8')+"\n")

end = time.time()
print end - start
