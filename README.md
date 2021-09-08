# 2D-Fourier-transform

### Implementation Process
1. Centering -> multiply (-1)^(x+y)
2. 2D Fourier transform
3. Log scaling
4. Compute Phase  


### Instructions
 - Change the filename of input picture  
  ![image](https://user-images.githubusercontent.com/78803926/132446274-35c79a10-e46a-47d4-a8f2-2bed51bc6db5.png)


### Theory & Experimental Results
 - Fourier magnitude (using log scale)  
   ![image](https://user-images.githubusercontent.com/78803926/132370460-6e148fa4-d001-4bee-8aa5-52cd53781eb1.png)  
   As the figure shown, the high-frequency components were shifted to the border, and the low-frequency components were rotate to the cantral area. It was found that centering will not affect the amplitude of frequency domain because the mulitiplication in spatial to time domain is equivalent to the convolution in frequency domain.  
      
 - Phase spectrum (after centering)  
   ![image](https://user-images.githubusercontent.com/78803926/132370681-40fd1c04-dd16-4d4a-bc68-5626db6c5c54.png)
   
 - Top 25 DFT frequency (u,v) [Before centering]  
   ![image](https://user-images.githubusercontent.com/78803926/132370783-829a6fb5-d68c-4c15-8cf0-785c53be08c5.png)

 - Top 25 DFT frequency (u,v) [After centering]  
   ![image](https://user-images.githubusercontent.com/78803926/132370874-c7a0eabb-cc28-4530-95f6-177edded4bff.png)  
   
   可以看到after centering 的 (u,v) 都是對 before centering shift(256,256)後的結果，有一些大小順序不一致是因為大小相同再加上我會先
取 index 小的 frquency 的關係，簡單來說，這些數值更直接地反映了 centering 對頻域的影響。
