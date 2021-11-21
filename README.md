# DCE-MRI-data-noise-reduction
![Python 3.7](https://img.shields.io/badge/python-3.7-green.svg)
![PyTorch 1.3](https://img.shields.io/badge/pytorch-1.3-green.svg)


While recording MR signals, due to the random fluctuations the signals get noisy. Some of the attributed reasons can be electric fluctiations, muscle movement etc. This is project on how to reduce those noise so as to keep the signals intact, which would then help in better parameter estimation.
This project utlizes semi-synthetic DCE-MRI time series signals, and test the state of the art deep learning denoising approaches on them.
Some of the Models trained are:

### 1. Deep Recurrent Neural Network
 (Antczak, K. (2018). Deep recurrent neural networks for ECG signal denoising, arXiv preprint arXiv:1807.11551)
- Model architecture
- ---
![image](https://user-images.githubusercontent.com/40626584/142758299-abeeda53-9029-4e1c-aa71-38df030622e0.png)


### 2. Denoising LSTM
(Implementation of LSTM approach presented in Deep Learning Models for Denoising ECG Signals Corneliu T.C. Arsene, Richard Hankins, Hujun Yi https://ieeexplore.ieee.org/document/8902833)
- Model architecture
- ---
![image](https://user-images.githubusercontent.com/40626584/142758312-638237ba-3bde-424a-a6f3-f280c8460301.png)


### 3. Denoising CNN
(Implementation of LSTM approach presented in Deep Learning Models for Denoising ECG Signals Corneliu T.C. Arsene, Richard Hankins, Hujun Yi https://ieeexplore.ieee.org/document/8902833)
- Model architecture
- ---
![image](https://user-images.githubusercontent.com/40626584/142758327-46beb5b6-9170-4128-9b95-c4f620147f16.png)


### 4. FCN-DAE
(Chiang, H. T., Hsieh, Y. Y., Fu, S. W., Hung, K. H., Tsao, Y., & Chien, S. Y. (2019) Noise reduction in ECG signals using fully convolutional denoising autoencoders IEEE Access, 7, 60806-60813)
- Model architecture
- ---
![image](https://user-images.githubusercontent.com/40626584/142758343-4b1862b5-4c29-4dd2-9861-85df5568ba7a.png)


### 5. End to End CNN encoder decoder
(End-to-End Trained CNN Encoder-Decoder Network for Fetal ECG Signal Denoising https://iopscience.iop.org/article/10.1088/1361-6579/ab69b9/meta)
- Model architecture
- ---
![image](https://user-images.githubusercontent.com/40626584/142758365-148f4782-3bbc-4394-8aeb-5b23730b491d.png)


### 6. Vanilla NL
(Deep Filter https://arxiv.org/pdf/2101.03423.pdf)
- Model architecture
- ---
![image](https://user-images.githubusercontent.com/40626584/142758375-2333b86f-bfe4-4751-8ecd-2afdaf6f72e1.png)

### 7. Res CNN
(A novel end-to-end 1D-ResCNN model to remove artifact from EEG signals https://www.sciencedirect.com/science/article/abs/pii/S0925231220305944)
- Model architecture
- ---
![image](https://user-images.githubusercontent.com/40626584/142758388-813ab8ed-543b-425c-8285-70c85ec0141c.png)

# Denoised Signals
1. DRNN
---
![image](https://user-images.githubusercontent.com/40626584/142758723-b946d541-de96-4072-82b7-d145b904c5e4.png)

2. LSTM
---
![image](https://user-images.githubusercontent.com/40626584/142758707-4ea3da42-b9a9-4514-819c-af916ffa6897.png)

3. Denoising CNN
---
![image](https://user-images.githubusercontent.com/40626584/142758697-cd331fb8-e022-4a71-801d-e48aff17b46a.png)

4. FCN DAE
---
![image](https://user-images.githubusercontent.com/40626584/142758693-bf13b5b9-e228-4e9b-af63-f4631cba9d14.png)

5. Vanilla Nl
---
![image](https://user-images.githubusercontent.com/40626584/142758679-bc066dd0-112e-478d-8d43-084000e186cf.png)


6. DEEP Filter
---
![image](https://user-images.githubusercontent.com/40626584/142758668-68ba21f0-06f5-4e88-abb7-33de983d4994.png)

7. Res CNN
---
![image](https://user-images.githubusercontent.com/40626584/142758658-016f0f3b-46ca-42b2-b36c-a5d92cae0e20.png)

# Training Time
```
in secs
```
![image](https://user-images.githubusercontent.com/40626584/142758746-a9a84e26-e38d-4321-8d3c-c09070d341f6.png)

# Tabular Summary
```
SSD is Sum of Square Errors
MAD is Mean Absolute Difference
PRD is Percent Roor Mean Square Difference
COS SIM is the cosine similarity
```
![image](https://user-images.githubusercontent.com/40626584/142758732-3f517252-75e5-48a8-af8f-cb9ade47627c.png)

## Box-plot distribution of errors
### SSD
![image](https://user-images.githubusercontent.com/40626584/142758812-33199a39-3c7c-40a6-8128-b60c6fef476b.png)
### MAD
![image](https://user-images.githubusercontent.com/40626584/142758821-158bea5c-64ea-4f6e-9cd2-0c263fcb3c55.png)
### PRD
![image](https://user-images.githubusercontent.com/40626584/142758838-e0db5cc9-5ec3-4168-9524-08b35b44d62a.png)
### COS SIM
![image](https://user-images.githubusercontent.com/40626584/142758849-2994ddaa-9a49-4ca6-9a3d-86b1c84ffeec.png)

stay tuned!!

