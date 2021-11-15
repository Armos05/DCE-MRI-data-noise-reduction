

import pandas as pd

TrainX = pd.read_csv('drive/MyDrive/TrainXn.csv', header = None)
TrainY = pd.read_csv('drive/MyDrive/TrainY.csv', header = None)
TestX = pd.read_csv('drive/MyDrive/TestXn.csv', header = None)
TestY = pd.read_csv('drive/MyDrive/TestY.csv', header = None)

# Data Shape: TrainX.shape, TrainY.shape, TestX.shape, TestY.shape   ((512, 72002), (512, 72002), (512, 13316), (512, 13316))

Train_x = TrainX.T.to_numpy()
Train_y = TrainY.T.to_numpy()
Test_x = TestX.T.to_numpy()
Test_y = TestY.T.to_numpy()

# Data Shape: Train_x.shape, Train_y.shape, Test_x.shape, Test_y.shape ((72002, 512), (72002, 512), (13316, 512), (13316, 512)) ndarray

from numpy import zeros, newaxis

# a[:, :, newaxis]
X_Train = Train_x[:,:,newaxis]
y_Train = Train_y[:,:,newaxis]
X_Test = Test_x[:,:,newaxis]
y_Test = Test_y[:,:,newaxis]

# Data shape: X_Train.shape, y_Train.shape, X_Test.shape, y_Test.shape ((72002, 512, 1), (72002, 512, 1), (13316, 512, 1), (13316, 512, 1))
 
