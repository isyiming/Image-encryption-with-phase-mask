% 生成随机相位掩模并与图像或文档数据相乘。
% 通过进行二维傅立叶变换并在空间频域中乘以另一随机相位掩模，可以安全加密。


I=imread('1.jpg');% 载入图像
A=im2double(I);% 将图像转为double格式
figure,imshow(A);title('The original image');% 显示图像
 
%加密部分
Y=fftshift(A);% 傅立叶变换部分调整整幅图像，将零频点移到频谱的中间
figure,imshow(Y);title('shifted image');%显示
B=fft2(Y);% 二维傅立叶变换
figure,imshow(B);title('FFT imagea');%显示

%M1=rand(255/255);% 随机生成密钥
M1=0.814%只要是0～1范围内就好

M11=exp(i*2*pi*M1);%M11为根据随机相位生成的图像掩膜
M111=B.*M11; %将要加密的图像和掩膜相乘
figure,imshow(M111);title('phase mask');%显示加密图像
 
D=fft2(M111); % 再次傅立叶变换
figure,imshow(D);title('FFT image b');
 
C=abs(D);%对经过两次傅立叶变化的图像像素灰度取绝对值
 
 
%解密部分
C1=ifft2(C); % 二维傅立叶逆变换
figure,imshow(C1);title('2-D IFFT b');%显示进行一次傅立叶逆变换的图像
C11=C1.*exp(-i*2*pi*M1); % 移除掩膜，这个M1就是信息发送方和接收方事先约定好的密钥，接收加密图像的人必须知道M1才能正确解密。
%这个程序只是演示加密解密过程，就随机生成的M1，不然应该是有一个密钥文件记录M1，双方保留。
figure,imshow(C11);title('remove mask');%显示移除掩膜后的图像
C111=ifft2(C11); %二维傅立叶逆变换
figure,imshow(C111);title('2-D IFFT a');%显示去除掩膜和进行两次傅立叶变换的图像
C1111=ifftshift(C111); %将零频点还原到原始位置
F=abs(C1111); %取绝对值
figure,imshow(F);title('The decrypted image');%显示，得到了最终解密后到图像

