import _pickle as pickle
from datetime import datetime
import numpy as np


dl_experiments = ['CNN IEEE']  #Replace the name of the model here


train_time_list = []
test_time_list = []

for experiment in range(len(dl_experiments)):
    start_train = datetime.now()
    train_dl(Dataset, dl_experiments[experiment])
    end_train = datetime.now()
    train_time_list.append(end_train - start_train)

    start_test = datetime.now()
    [X_test, y_test, y_pred] = test_dl(Dataset, dl_experiments[experiment])
    end_test = datetime.now()
    test_time_list.append(end_test - start_test)

    test_results = [X_test, y_test, y_pred]

    # Save Results
    with open('test_results_' + dl_experiments[experiment] + '.pkl', 'wb') as output:  # Overwrites any existing file.
        pickle.dump(test_results, output)
    print('Results from experiment ' + dl_experiments[experiment] + ' saved')
