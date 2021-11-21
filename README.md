# DCE-MRI-data-noise-reduction
![Python 3.7](https://img.shields.io/badge/python-3.7-green.svg)
![PyTorch 1.3](https://img.shields.io/badge/pytorch-1.3-green.svg)

While recording MR signals, due to the random fluctuations the signals get noisy. Some of the attributed reasons can be electric fluctiations, muscle movement etc. This is project on how to reduce those noise so as to keep the signals intact, which would then help in better parameter estimation.
This project utlizes semi-synthetic DCE-MRI time series signals, and test the state of the art deep learning denoising approaches on them.
Some of the Models trained are:

1. ### Deep Recurrent Neural Network
 (Antczak, K. (2018). Deep recurrent neural networks for ECG signal denoising, arXiv preprint arXiv:1807.11551)
![image](https://user-images.githubusercontent.com/40626584/142757997-3928049f-03f0-4fec-9798-9cbcb3f32c8a.png)

2. ### Denoising LSTM
(Implementation of LSTM approach presented in Deep Learning Models for Denoising ECG Signals Corneliu T.C. Arsene, Richard Hankins, Hujun Yi https://ieeexplore.ieee.org/document/8902833)
- Model architecture
![image](https://user-images.githubusercontent.com/40626584/142758026-7e08c62a-507d-41d4-96c0-84e801d16d06.png)

3. ### Denoising CNN
(Implementation of LSTM approach presented in Deep Learning Models for Denoising ECG Signals Corneliu T.C. Arsene, Richard Hankins, Hujun Yi https://ieeexplore.ieee.org/document/8902833)
- Model architecture
![image](https://user-images.githubusercontent.com/40626584/142758042-8fc69a71-e533-4918-9ee4-e452b10686f1.png)

4. ### FCN-DAE
(Chiang, H. T., Hsieh, Y. Y., Fu, S. W., Hung, K. H., Tsao, Y., & Chien, S. Y. (2019) Noise reduction in ECG signals using fully convolutional denoising autoencoders IEEE Access, 7, 60806-60813)
- Model architecture
![image](https://user-images.githubusercontent.com/40626584/142758065-2f76981b-2e1d-44e6-b8fc-cf6828001cc4.png)

5. ### End to End CNN encoder decoder
(End-to-End Trained CNN Encoder-Decoder Network for Fetal ECG Signal Denoising https://iopscience.iop.org/article/10.1088/1361-6579/ab69b9/meta)
- Model architecture
![image](https://user-images.githubusercontent.com/40626584/142758114-17ebcd40-daec-444b-be9a-fdcf82313dfe.png)

6. ### Vanilla NL
(Deep Filter https://arxiv.org/pdf/2101.03423.pdf)
- Model architecture
![image](https://user-images.githubusercontent.com/40626584/142758153-d80e52e5-d90e-4910-b401-b750739e998b.png)

7. Res CNN
(A novel end-to-end 1D-ResCNN model to remove artifact from EEG signals https://www.sciencedirect.com/science/article/abs/pii/S0925231220305944)
- Model architecture
![image](https://user-images.githubusercontent.com/40626584/142758168-e5ba36b5-0483-40ed-9af7-86efa741aacf.png)

