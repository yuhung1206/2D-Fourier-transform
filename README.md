# 2D-Fourier-transform

### Implementation Process
1. Centering -> multiply (-1)^(x+y)
2. 2D Fourier transform
3. Log scaling
4. Compute Phase

## Results
 - Fourier magnitude (using log scale)  
   ![image](https://user-images.githubusercontent.com/78803926/132370460-6e148fa4-d001-4bee-8aa5-52cd53781eb1.png)  
   如上圖之結果所示，經過centering 後的 DFT 其高頻成分 灰階變化快速的部分 )shift 到了 border 附近，而低頻成分則 rotate 到了中心點，示意圖如下，centering 後可以看到比較完整的頻譜，且正確的 centering 也不會影響到頻域的振幅值，這是因在 spatial 或 time domain 中的 multiplication 其實就等價於在 frequency domain 中 convolution
   
 - Phase spectrum (after centering)  
   ![image](https://user-images.githubusercontent.com/78803926/132370681-40fd1c04-dd16-4d4a-bc68-5626db6c5c54.png)
   
 - Top 25 DFT frequency (u,v) [Before centering]  
   ![image](https://user-images.githubusercontent.com/78803926/132370783-829a6fb5-d68c-4c15-8cf0-785c53be08c5.png)

 - Top 25 DFT frequency (u,v) [After centering]  
   ![image](https://user-images.githubusercontent.com/78803926/132370874-c7a0eabb-cc28-4530-95f6-177edded4bff.png)  
   可以看到after centering 的 (u,v) 都是對 before centering shift(256,256)後的結果，有一些大小順序不一致是因為大小相同再加上我會先
取 index 小的 frquency 的關係，簡單來說，這些數值更直接地反映了 centering 對頻域的影響。
