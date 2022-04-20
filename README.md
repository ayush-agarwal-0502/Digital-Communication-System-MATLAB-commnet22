# Digital-Communication-System-MATLAB-commnet22
Digital Communication system implemented from scratch on MATLAB and used for transferring audio and image . Commnet22 

## Introduction :

* Team Name - Connected 
* Team members - Ayush Agarwal (me) , Sandeepan Ghosh 
* Project Skills - Digital Communication System 
* Project Tools - MATLAB
* Event - COMMNET'22 ( Digital Communication event of UDYAM , which is the electronics department fest of IIT BHU ) 
* Position Secured - 1st

![image](https://user-images.githubusercontent.com/86561124/164150494-33162cc8-c796-4f37-b8d5-0fdec643fb31.png)

( Link to leaderboard - https://www.udyamfest.com/leaderboard (Link may not work after 2022)) 

## The PS :

(Also pdf uploaded to this repository ) 

![image](https://user-images.githubusercontent.com/86561124/164151205-bfdf5a38-02d0-4e28-8dae-305eaddd34f8.png)
![image](https://user-images.githubusercontent.com/86561124/164151212-afe69697-0baf-4bce-9001-5982b90532f6.png)
![image](https://user-images.githubusercontent.com/86561124/164151237-afadba80-cf53-48e9-98f0-e1f94ef1adce.png)

## The PS in short :

Make/Implement a digital communication system from scratch .

## The Assignment :

Assignment problem statment ( which is being referred to in the final PS as the tie-breaker ) can be referred from here : https://github.com/ayush-agarwal-0502/Digital-Communication-System-MATLAB-commnet22/blob/main/Assignment.pdf ( uploaded in this repository ) 

Basically , we were supposed to implement Cyclic Redundancy Check ( CRC) on a Digital message .

Its solution also I have uploaded in this repository : https://github.com/ayush-agarwal-0502/Digital-Communication-System-MATLAB-commnet22/blob/main/Cyclic_redundancy_check_code.mlx (MATLAB file ) 

## Digital Communication system basic structure :

![image](https://user-images.githubusercontent.com/86561124/164157897-1a0b707b-01aa-4908-a9ad-b341c5acac2a.png)

## Our project work description :

There are 3 codes in this repository , one for audio transmission , one for image and one for video . The basic principle however remains the same : i.e. Converting the information into bits and then applying the standard digital communicaiton techniques . 

### Rough Diagrametic explanation of BPSK using a sample message signal :

Original message :

![image](https://user-images.githubusercontent.com/86561124/164163706-808aec93-a92e-43bd-8d6a-5635b432fc6c.png)

After converting 0 to -1s :

![image](https://user-images.githubusercontent.com/86561124/164163722-fcda9f08-6a82-4ad8-adf9-0bb330993b5f.png)

Message signal after transmission from the channel (addition of AWGN ) :

![image](https://user-images.githubusercontent.com/86561124/164163760-ced55c01-6c13-45ab-9040-8358ab90351e.png)

Demodulating :

![image](https://user-images.githubusercontent.com/86561124/164163773-a132136c-52a7-4281-9831-64611468451c.png)

Retrived message signal :

![image](https://user-images.githubusercontent.com/86561124/164163782-3cfeabf2-72f7-44f2-9a8e-5b67aa1b3470.png)


### Image Transmission:-

MATLAB Code : https://github.com/ayush-agarwal-0502/Digital-Communication-System-MATLAB-commnet22/blob/main/imgt.m

• First read the image

• Then made it’s 1D array 

• Converted the decimal values of pixel into binary .

• It becomes string bcoz of previous operation so converted it back to 
number 

• Converted 0s to -1s so that BPSK becomes easier 

• Converted it to its electrical version instead of the message version we had 
, to simulate it on matlab 

• Modulated it (BPSK) by multiplying with carrier wave 

• Added awgn to it to simulate the effect of noise from the channel , as awgn 
is a good model of noise 

• Demodulated it using an algorithm ( by multiplying by cos and taking 
convolution ) 

• Reconstructed the message signal from the electrical version 

• Reshaped the received 1D message to image

### Audio Transmission:-

MATLAB Code : https://github.com/ayush-agarwal-0502/Digital-Communication-System-MATLAB-commnet22/blob/main/audiot.mlx

• In audio transmission we first read the audio file from Matlab’s default 
handle.mat which is an audio file of 8 seconds approximately with a sample 
rate of 8192. The following steps have been applied only on the first 16384 
samples that is 2 seconds of the audio file as processing long audio files 
leads to matlab running out of memory.

• Next source encoding has been implemented by converting the float values 
from –1 to 1 to bits with 1 bit for the integer part and 20 bits for the 
decimal part. An extra bit has been added at the start for the sign- 1 for 
negative and 0 for positive. So every sample is represented as 22 bits.

• Now channel encoding has been implemented using parity bit. We have 
used odd parity to generate a parity bit for every 22 bits which is essentially 
every encoded float sample. 

• Following which for the modulation, channel transmission and 
demodulation part BPSK has been implemented and 10 dB of channel noise 
has been added using awgn. 

• In a similar fashion channel decoding and source decoding has been 
implemented then and the final output is written to ‘output.wav’.

### Video transmission :

MATLAB Code : https://github.com/ayush-agarwal-0502/Digital-Communication-System-MATLAB-commnet22/blob/main/videotransfer.m

* Applied MATLAB's standard functions to do all the message breaking work .
* Applied MATLAB's functions for BPSK modulation and demodulation .
* Rest of the explanation same as audio and image , except that here the work was done using MATLAB functions instead from scratch .
