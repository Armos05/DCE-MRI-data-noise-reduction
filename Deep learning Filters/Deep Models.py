import keras
from keras.models import Sequential, Model
from keras.layers import Dense, Conv1D, Flatten, Dropout, BatchNormalization, concatenate, Activation, Add, Input, Conv2DTranspose, Lambda, LSTM, Reshape, Embedding, AvgPool1D, LeakyReLU
from keras.initializers import glorot_uniform
import keras.backend as K

def Conv1DTranspose(input_tensor, filters, kernel_size, strides=2, activation='relu', padding='same'):
    """
        https://stackoverflow.com/a/45788699

        input_tensor: tensor, with the shape (batch_size, time_steps, dims)
        filters: int, output dimension, i.e. the output tensor will have the shape of (batch_size, time_steps, filters)
        kernel_size: int, size of the convolution kernel
        strides: int, convolution step size
        padding: 'same' | 'valid'
    """
    x = Lambda(lambda x: K.expand_dims(x, axis=2))(input_tensor)
    x = Conv2DTranspose(filters=filters,
                        kernel_size=(kernel_size, 1),
                        activation=activation,
                        strides=(strides, 1),
                        padding=padding)(x)
    x = Lambda(lambda x: K.squeeze(x, axis=2))(x)
    return x

##########################################################################

###### MODULES #######

def LFilter_module(x, layers):
    LB0 = Conv1D(filters=int(layers / 4),
                 kernel_size=3,
                 activation='linear',
                 strides=1,
                 padding='same')(x)
    LB1 = Conv1D(filters=int(layers / 4),
                kernel_size=5,
                activation='linear',
                strides=1,
                padding='same')(x)
    LB2 = Conv1D(filters=int(layers / 4),
                kernel_size=9,
                activation='linear',
                strides=1,
                padding='same')(x)
    LB3 = Conv1D(filters=int(layers / 4),
                kernel_size=15,
                activation='linear',
                strides=1,
                padding='same')(x)


    x = concatenate([LB0, LB1, LB2, LB3])

    return x


def NLFilter_module(x, layers):

    NLB0 = Conv1D(filters=int(layers / 4),
                  kernel_size=3,
                  activation='relu',
                  strides=1,
                  padding='same')(x)
    NLB1 = Conv1D(filters=int(layers / 4),
                kernel_size=5,
                activation='relu',
                strides=1,
                padding='same')(x)
    NLB2 = Conv1D(filters=int(layers / 4),
                kernel_size=9,
                activation='relu',
                strides=1,
                padding='same')(x)
    NLB3 = Conv1D(filters=int(layers / 4),
                kernel_size=15,
                activation='relu',
                strides=1,
                padding='same')(x)


    x = concatenate([NLB0, NLB1, NLB2, NLB3])

    return x


def LANLFilter_module(x, layers):
    LB0 = Conv1D(filters=int(layers / 8),
                 kernel_size=3,
                 activation='linear',
                 strides=1,
                 padding='same')(x)
    LB1 = Conv1D(filters=int(layers / 8),
                kernel_size=5,
                activation='linear',
                strides=1,
                padding='same')(x)
    LB2 = Conv1D(filters=int(layers / 8),
                kernel_size=9,
                activation='linear',
                strides=1,
                padding='same')(x)
    LB3 = Conv1D(filters=int(layers / 8),
                kernel_size=15,
                activation='linear',
                strides=1,
                padding='same')(x)

    NLB0 = Conv1D(filters=int(layers / 8),
                  kernel_size=3,
                  activation='relu',
                  strides=1,
                  padding='same')(x)
    NLB1 = Conv1D(filters=int(layers / 8),
                 kernel_size=5,
                 activation='relu',
                 strides=1,
                 padding='same')(x)
    NLB2 = Conv1D(filters=int(layers / 8),
                 kernel_size=9,
                 activation='relu',
                 strides=1,
                 padding='same')(x)
    NLB3 = Conv1D(filters=int(layers / 8),
                 kernel_size=15,
                 activation='relu',
                 strides=1,
                 padding='same')(x)

    x = concatenate([LB0, LB1, LB2, LB3, NLB0, NLB1, NLB2, NLB3])

    return x


def LANLFilter_module_dilated(x, layers):
    LB1 = Conv1D(filters=int(layers / 6),
                kernel_size=5,
                activation='linear',
                dilation_rate=3,
                padding='same')(x)
    LB2 = Conv1D(filters=int(layers / 6),
                kernel_size=9,
                activation='linear',
                dilation_rate=3,
                padding='same')(x)
    LB3 = Conv1D(filters=int(layers / 6),
                kernel_size=15,
                dilation_rate=3,
                activation='linear',
                padding='same')(x)

    NLB1 = Conv1D(filters=int(layers / 6),
                 kernel_size=5,
                 activation='relu',
                 dilation_rate=3,
                 padding='same')(x)
    NLB2 = Conv1D(filters=int(layers / 6),
                 kernel_size=9,
                 activation='relu',
                 dilation_rate=3,
                 padding='same')(x)
    NLB3 = Conv1D(filters=int(layers / 6),
                 kernel_size=15,
                 dilation_rate=3,
                 activation='relu',
                 padding='same')(x)

    x = concatenate([LB1, LB2, LB3, NLB1, NLB2, NLB3])
    # x = BatchNormalization()(x)

    return x


###### MODELS #######

def deep_filter_vanilla_linear():

    model = Sequential()

    model.add(Conv1D(filters=64,
                     kernel_size=9,
                     activation='linear',
                     input_shape=(512, 1),
                     strides=1,
                     padding='same'))
    model.add(Conv1D(filters=64,
                     kernel_size=9,
                     activation='linear',
                     strides=1,
                     padding='same'))


    model.add(Conv1D(filters=32,
                     kernel_size=9,
                     activation='linear',
                     strides=1,
                     padding='same'))
    model.add(Conv1D(filters=32,
                     kernel_size=9,
                     activation='linear',
                     strides=1,
                     padding='same'))


    model.add(Conv1D(filters=16,
                     kernel_size=9,
                     activation='linear',
                     strides=1,
                     padding='same'))
    model.add(Conv1D(filters=16,
                     kernel_size=9,
                     activation='linear',
                     strides=1,
                     padding='same'))


    model.add(Conv1D(filters=1,
                     kernel_size=9,
                     activation='linear',
                     strides=1,
                     padding='same'))
    return model


def deep_filter_vanilla_Nlinear():
    model = Sequential()

    model.add(Conv1D(filters=64,
                     kernel_size=9,
                     activation='relu',
                     input_shape=(512, 1),
                     strides=1,
                     padding='same'))
    model.add(Conv1D(filters=64,
                     kernel_size=9,
                     activation='relu',
                     strides=1,
                     padding='same'))


    model.add(Conv1D(filters=32,
                     kernel_size=9,
                     activation='relu',
                     strides=1,
                     padding='same'))
    model.add(Conv1D(filters=32,
                     kernel_size=9,
                     activation='relu',
                     strides=1,
                     padding='same'))


    model.add(Conv1D(filters=16,
                     kernel_size=9,
                     activation='relu',
                     strides=1,
                     padding='same'))
    model.add(Conv1D(filters=16,
                     kernel_size=9,
                     activation='relu',
                     strides=1,
                     padding='same'))


    model.add(Conv1D(filters=1,
                     kernel_size=9,
                     activation='linear',
                     strides=1,
                     padding='same'))
    return model


def deep_filter_I_linear():
    input_shape = (512, 1)
    input = Input(shape=input_shape)

    tensor = LFilter_module(input, 64)
    tensor = LFilter_module(tensor, 64)
    tensor = LFilter_module(tensor, 32)
    tensor = LFilter_module(tensor, 32)
    tensor = LFilter_module(tensor, 16)
    tensor = LFilter_module(tensor, 16)
    predictions = Conv1D(filters=1,
                         kernel_size=9,
                         activation='linear',
                         strides=1,
                         padding='same')(tensor)

    model = Model(inputs=[input], outputs=predictions)

    return model


def deep_filter_I_Nlinear():
    input_shape = (512, 1)
    input = Input(shape=input_shape)

    tensor = NLFilter_module(input, 64)
    tensor = NLFilter_module(tensor, 64)
    tensor = NLFilter_module(tensor, 32)
    tensor = NLFilter_module(tensor, 32)
    tensor = NLFilter_module(tensor, 16)
    tensor = NLFilter_module(tensor, 16)
    predictions = Conv1D(filters=1,
                         kernel_size=9,
                         activation='linear',
                         strides=1,
                         padding='same')(tensor)

    model = Model(inputs=[input], outputs=predictions)

    return model


def deep_filter_I_LANL():
    # TODO: Make the doc

    input_shape = (512, 1)
    input = Input(shape=input_shape)

    tensor = LANLFilter_module(input, 64)
    tensor = BatchNormalization()(tensor)
    tensor = LANLFilter_module(tensor, 64)
    tensor = BatchNormalization()(tensor)
    tensor = LANLFilter_module(tensor, 32)
    tensor = BatchNormalization()(tensor)
    tensor = LANLFilter_module(tensor, 32)
    tensor = BatchNormalization()(tensor)
    tensor = LANLFilter_module(tensor, 16)
    tensor = BatchNormalization()(tensor)
    tensor = LANLFilter_module(tensor, 16)
    tensor = BatchNormalization()(tensor)
    predictions = Conv1D(filters=1,
                    kernel_size=9,
                    activation='linear',
                    strides=1,
                    padding='same')(tensor)

    model = Model(inputs=[input], outputs=predictions)

    return model


def deep_filter_model_I_LANL_dilated():
    # TODO: Make the doc

    input_shape = (512, 1)
    input = Input(shape=input_shape)

    tensor = LANLFilter_module(input, 64)
    tensor = BatchNormalization()(tensor)
    tensor = LANLFilter_module_dilated(tensor, 64)
    tensor = BatchNormalization()(tensor)
    tensor = LANLFilter_module(tensor, 32)
    tensor = BatchNormalization()(tensor)
    tensor = LANLFilter_module_dilated(tensor, 32)
    tensor = BatchNormalization()(tensor)
    tensor = LANLFilter_module(tensor, 16)
    tensor = BatchNormalization()(tensor)
    tensor = LANLFilter_module_dilated(tensor, 16)
    tensor = BatchNormalization()(tensor)
    predictions = Conv1D(filters=1,
                    kernel_size=9,
                    activation='linear',
                    strides=1,
                    padding='same')(tensor)

    model = Model(inputs=[input], outputs=predictions)

    return model


def FCN_DAE():
    # Implementation of FCN_DAE approach presented in
    # Chiang, H. T., Hsieh, Y. Y., Fu, S. W., Hung, K. H., Tsao, Y., & Chien, S. Y. (2019).
    # Noise reduction in ECG signals using fully convolutional denoising autoencoders.
    # IEEE Access, 7, 60806-60813.

    input_shape = (512, 1)
    input = Input(shape=input_shape)

    x = Conv1D(filters=40,
               input_shape=(512, 1),
               kernel_size=16,
               activation='elu',
               strides=2,
               padding='same')(input)

    x = BatchNormalization()(x)

    x = Conv1D(filters=20,
               kernel_size=16,
               activation='elu',
               strides=2,
               padding='same')(x)

    x = BatchNormalization()(x)

    x = Conv1D(filters=20,
               kernel_size=16,
               activation='elu',
               strides=2,
               padding='same')(x)

    x = BatchNormalization()(x)

    x = Conv1D(filters=20,
               kernel_size=16,
               activation='elu',
               strides=2,
               padding='same')(x)

    x = BatchNormalization()(x)

    x = Conv1D(filters=40,
               kernel_size=16,
               activation='elu',
               strides=2,
               padding='same')(x)

    x = BatchNormalization()(x)

    x = Conv1D(filters=1,
               kernel_size=16,
               activation='elu',
               strides=1,
               padding='same')(x)

    x = BatchNormalization()(x)

    # Keras has no 1D Traspose Convolution, instead we use Conv2DTranspose function
    # in a souch way that is mathematically equivalent
    x = Conv1DTranspose(input_tensor=x,
                        filters=1,
                        kernel_size=16,
                        activation='elu',
                        strides=1,
                        padding='same')

    x = BatchNormalization()(x)

    x = Conv1DTranspose(input_tensor=x,
                        filters=40,
                        kernel_size=16,
                        activation='elu',
                        strides=2,
                        padding='same')

    x = BatchNormalization()(x)

    x = Conv1DTranspose(input_tensor=x,
                        filters=20,
                        kernel_size=16,
                        activation='elu',
                        strides=2,
                        padding='same')

    x = BatchNormalization()(x)

    x = Conv1DTranspose(input_tensor=x,
                        filters=20,
                        kernel_size=16,
                        activation='elu',
                        strides=2,
                        padding='same')

    x = BatchNormalization()(x)

    x = Conv1DTranspose(input_tensor=x,
                        filters=20,
                        kernel_size=16,
                        activation='elu',
                        strides=2,
                        padding='same')

    x = BatchNormalization()(x)

    x = Conv1DTranspose(input_tensor=x,
                        filters=40,
                        kernel_size=16,
                        activation='elu',
                        strides=2,
                        padding='same')

    x = BatchNormalization()(x)

    predictions = Conv1DTranspose(input_tensor=x,
                        filters=1,
                        kernel_size=16,
                        activation='linear',
                        strides=1,
                        padding='same')

    model = Model(inputs=[input], outputs=predictions)
    return model


def DRRN_denoising():
    # Implementation of DRNN approach presented in
    # Antczak, K. (2018). Deep recurrent neural networks for ECG signal denoising.
    # arXiv preprint arXiv:1807.11551.    

    model = Sequential()
    model.add(LSTM(64, input_shape=(512, 1), return_sequences=True))
    model.add(Dense(64, activation='relu'))
    model.add(Dense(64, activation='relu'))
    model.add(Dense(1, activation='linear'))

    return model

def LSTM_denoising():
    # Implementation of LSTM approach presented in
    # Deep Learning Models for Denoising ECG Signals Corneliu T.C. Arsene, Richard Hankins, Hujun Yin
    # https://ieeexplore.ieee.org/document/8902833

    model = Sequential()
    model.add(LSTM(140, input_shape=(512, 1), return_sequences=True))
    model.add(Dense(140, activation='relu'))
    model.add(LSTM(140, return_sequences=True)) #Check for errors
    model.add(Dense(140, activation='relu'))
    model.add(Dense(1, activation='linear'))

    return model
    
    def CNN_Denoising():
    # Implementation of CNN denoising approach presented in
    # Deep Learning Models for Denoising ECG Signals Corneliu T.C. Arsene, Richard Hankins, Hujun Yin
    # https://ieeexplore.ieee.org/document/8902833
    
  input_shape = (512,1)
  input = Input(shape = input_shape)
  

  x = Conv1D(filters=36, input_shape=(512,1), kernel_size=19, activation='relu',strides = 1, padding = "same")(input)
  x = BatchNormalization()(x)
  leaky_relu = LeakyReLU(alpha=0.01)
  x = Activation(leaky_relu)(x)
  x = AvgPool1D(pool_size=2, strides=4, padding="same")(x) #128,36
  
  x = Conv1D(filters=36, kernel_size=19, activation='relu', input_shape=(512,1), padding = "same")(x)
  x = BatchNormalization()(x)
  leaky_relu = LeakyReLU(alpha=0.01)
  x = Activation(leaky_relu)(x)
  x = AvgPool1D(pool_size=2, strides=4, padding="same")(x) #32,36

  x = Conv1D(filters=36, kernel_size=19, activation='relu', input_shape=(512,1), padding = "same")(x)
  x = BatchNormalization()(x)
  leaky_relu = LeakyReLU(alpha=0.01)
  x = Activation(leaky_relu)(x)
  x = AvgPool1D(pool_size=2, strides=4, padding="same")(x) #8,36

  x= Flatten()(x) #288

  predictions = Dense(512, activation='linear')(x) # 512

  predictions = Lambda(lambda i: K.expand_dims(i, axis=2))(predictions)
  
  model = Model(inputs=[input], outputs=predictions)

  return model


def CNN_encoder_decoder():
    # Implementation of CNN autoencoder for denoising approach presented in
    # End-to-End Trained CNN Encoder-Decoder Network for Fetal ECG Signal Denoising
    # https://iopscience.iop.org/article/10.1088/1361-6579/ab69b9/meta
    # https://github.com/rshnn/xray-denoising


    input_shape = (512,1)
    input = Input(shape = input_shape)

    x = Conv1D(filters=64, kernel_size=15, padding='same', kernel_initializer=glorot_uniform(seed=0))(input)
    leaky_relu = LeakyReLU(alpha=0.01)
    x = Activation(leaky_relu)(x)   #512, 64
    
    shortcut_1 = x #512,64

    x = Conv1D(filters=128, kernel_size=15, strides = 2, padding='same', kernel_initializer=glorot_uniform(seed=0))(input)
    x = Activation(leaky_relu)(x) #256 128
    
    shortcut_2 = x #256, 128

    x = Conv1D(filters=256, kernel_size=15, strides=2, padding='same', 
               kernel_initializer=glorot_uniform(seed=0))(x)
    x = Activation(leaky_relu)(x) #128,256
    
    shortcut_3 = x #128, 256

    x = Conv1D(filters=256, kernel_size=15, strides=2, padding='same', 
               kernel_initializer=glorot_uniform(seed=0))(x)
    x = Activation(leaky_relu)(x) #64,256
    
    shortcut_4 = x #64, 256

    x = Conv1D(filters= 512, kernel_size=15, strides=2, padding='same', 
               kernel_initializer=glorot_uniform(seed=0))(x)
    x = Activation(leaky_relu)(x) #32,512

    shortcut_5 = x #32, 512

    x = Conv1D(filters=512, kernel_size=15 , strides=2, padding='same', 
               kernel_initializer=glorot_uniform(seed=0))(x)
    x = Activation(leaky_relu)(x) #16,512

    shortcut_6 = x  #16, 512

    x = Conv1D(filters=1024, kernel_size=15, strides=2, padding='same', 
               kernel_initializer=glorot_uniform(seed=0))(x)
    x = Activation(leaky_relu)(x) #8, 1024

    shortcut_7 = x #8, 1024

    x = Conv1D(filters=2048, kernel_size=15,strides=2, padding='same', 
               kernel_initializer=glorot_uniform(seed=0))(x)
    x = Activation(leaky_relu)(x) #4,2048


    
    ## Upsampling 
    x = Conv1DTranspose(input_tensor = x, filters=2048, kernel_size=15, strides=1, padding='same')
    x = Activation(leaky_relu)(x) #4,2048

    x = Conv1DTranspose(input_tensor = x, filters=1024, kernel_size=15, strides=2, padding='same')
    x = Activation(leaky_relu)(x) #8,1024

    x = Add()([x, shortcut_7]) #8, 1024
    x = Conv1DTranspose(input_tensor = x,filters=512, kernel_size=15, strides=2, padding='same')
    x = Activation(leaky_relu)(x) #16, 512

    x = Add()([x, shortcut_6]) #16, 512
    x = Conv1DTranspose(input_tensor = x,filters=512, kernel_size=15, strides=2, padding='same')
    x = Activation(leaky_relu)(x) #32, 512

    x = Add()([x, shortcut_5]) #32, 512
    x = Conv1DTranspose(input_tensor = x, filters=256, kernel_size=15, strides=2, padding='same')
    x = Activation(leaky_relu)(x) #64, 256

    x = Add()([x, shortcut_4]) #64, 256
    x = Conv1DTranspose(input_tensor = x, filters=256, strides = 2, kernel_size=15, padding='same')
    x = Activation(leaky_relu)(x) #128, 256  

    x = Add()([x, shortcut_3]) #128,256
    x = Conv1DTranspose(input_tensor = x, filters=128, kernel_size=15, strides=2, padding='same')
    x = Activation(leaky_relu)(x) #256, 128

    x = Add()([x, shortcut_2]) #256, 128
    x = Conv1DTranspose(input_tensor = x, filters=64, kernel_size=15, strides=2, padding='same')
    x = Activation(leaky_relu)(x) # 512,64

    x = Add()([x, shortcut_1]) 
    predictions = Conv1DTranspose(input_tensor = x, filters=1, kernel_size=15, strides=1, padding='same', activation = 'relu') #512,1

    model = Model(inputs=[input], outputs=predictions)
    return model
