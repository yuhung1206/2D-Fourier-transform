clc; clear all; close all; 

% read Image to double
ImageMatrix = im2double( imread('Bird 1.tif' ));
[M, N] = size(ImageMatrix)

% creating array for DFT & IDFT
DFTMatrix = zeros(2*M, 2*N)
DFTrow = 2*M
DFTcol = 2*N

% Padding the image
PaddMatrix(1:512, 1:512) = ImageMatrix
figure();  imshow(ImageMatrix);  title('original image');
figure();  imshow(PaddMatrix);  title('padded image');

% centering -> multiply (-1)^(x+y)
CenterMatrix = zeros(2*M, 2*N)
powerVector = [0 : 2*M-1]
PowerMatrix = [ ]
temp = repmat(powerVector, 2*M, 1)
PowerMatrix = temp + temp'
CenterMatrix = PaddMatrix.*((-1).^(PowerMatrix))
figure();  imshow(CenterMatrix);  title('pre processed image for calculating DFT');

% 2D Fourier transform
DFTMatrix = fft2(CenterMatrix); 
figure();  imshow(DFTMatrix);  title('2D DFT of image before Laplacian');



% Design filter
% implement "Laplacian Filter" with "freqspace"
[u, v] = freqspace(2*M, 'meshgrid');
H_Matrix = zeros(2*M, 2*N);
H_Matrix = (u.^(2) + v.^(2))
H_Matrix = H_Matrix/(max(max(H_Matrix)))
figure();  imshow(H_Matrix);  title('H_Matrix');

% Filtering
G_Matrix = DFTMatrix.*H_Matrix
figure();  imshow(G_Matrix);  title('G Matrix (after Laplacian)');

% Top 25 Hz
Freq25 = DFTMatrix(1, 1:25)
Freq25 = [Freq25; G_Matrix(1, 1:25)]
Freq25 = roundn(Freq25, -2)

% calculate Inverse 2D DFT
g_matrix = ifft2(G_Matrix);
figure();  imshow(g_matrix);  title('After Inverse 2D DFT');

% Post preprocess
% centering again -> multiply (-1)^(x+y)
CenterMatrix2 = zeros(2*M, 2*N)
CenterMatrix2 = real(g_matrix).*((-1).^(PowerMatrix))
figure();  imshow(255.*CenterMatrix2);  title('post processed image for calculating DFT');
OutputMatrix = 255.*(CenterMatrix2(1:512, 1:512))
figure();  imshow(OutputMatrix);  title('Output Image');
