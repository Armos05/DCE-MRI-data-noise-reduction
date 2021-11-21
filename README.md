# DCE-MRI-data-noise-reduction
![Python 3.7](https://img.shields.io/badge/python-3.7-green.svg)
![PyTorch 1.3](https://img.shields.io/badge/pytorch-1.3-green.svg)

While recording MR signals, due to the random fluctuations the signals get noisy. Some of the attributed reasons can be electric fluctiations, muscle movement etc. This is project on how to reduce those noise so as to keep the signals intact, which would then help in better parameter estimation.
This project utlizes semi-synthetic DCE-MRI time series signals, and test the state of the art deep learning denoising approaches on them.
Some of the Models trained are:

1. ### Deep Recurrent Neural Network
 (Antczak, K. (2018). Deep recurrent neural networks for ECG signal denoising, arXiv preprint arXiv:1807.11551)
- Model architecture
- ---
![image](https://user-images.githubusercontent.com/40626584/142758299-abeeda53-9029-4e1c-aa71-38df030622e0.png)


2. ### Denoising LSTM
(Implementation of LSTM approach presented in Deep Learning Models for Denoising ECG Signals Corneliu T.C. Arsene, Richard Hankins, Hujun Yi https://ieeexplore.ieee.org/document/8902833)
- Model architecture
![image](https://user-images.githubusercontent.com/40626584/142758312-638237ba-3bde-424a-a6f3-f280c8460301.png)


3. ### Denoising CNN
(Implementation of LSTM approach presented in Deep Learning Models for Denoising ECG Signals Corneliu T.C. Arsene, Richard Hankins, Hujun Yi https://ieeexplore.ieee.org/document/8902833)
- Model architecture
![image](https://user-images.githubusercontent.com/40626584/142758327-46beb5b6-9170-4128-9b95-c4f620147f16.png)


4. ### FCN-DAE
(Chiang, H. T., Hsieh, Y. Y., Fu, S. W., Hung, K. H., Tsao, Y., & Chien, S. Y. (2019) Noise reduction in ECG signals using fully convolutional denoising autoencoders IEEE Access, 7, 60806-60813)
- Model architecture
![image](https://user-images.githubusercontent.com/40626584/142758343-4b1862b5-4c29-4dd2-9861-85df5568ba7a.png)


5. ### End to End CNN encoder decoder
(End-to-End Trained CNN Encoder-Decoder Network for Fetal ECG Signal Denoising https://iopscience.iop.org/article/10.1088/1361-6579/ab69b9/meta)
- Model architecture
![image](https://user-images.githubusercontent.com/40626584/142758365-148f4782-3bbc-4394-8aeb-5b23730b491d.png)


6. ### Vanilla NL
(Deep Filter https://arxiv.org/pdf/2101.03423.pdf)
- Model architecture
![image](https://user-images.githubusercontent.com/40626584/142758375-2333b86f-bfe4-4751-8ecd-2afdaf6f72e1.png)

7. Res CNN
(A novel end-to-end 1D-ResCNN model to remove artifact from EEG signals https://www.sciencedirect.com/science/article/abs/pii/S0925231220305944)
- Model architecture
![image](https://user-images.githubusercontent.com/40626584/142758388-813ab8ed-543b-425c-8285-70c85ec0141c.png)


