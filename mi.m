% ���������λ��ģ����ͼ����ĵ�������ˡ�
% ͨ�����ж�ά����Ҷ�任���ڿռ�Ƶ���г�����һ�����λ��ģ�����԰�ȫ���ܡ�


I=imread('1.jpg');% ����ͼ��
A=im2double(I);% ��ͼ��תΪdouble��ʽ
figure,imshow(A);title('The original image');% ��ʾͼ��
 
%���ܲ���
Y=fftshift(A);% ����Ҷ�任���ֵ�������ͼ�񣬽���Ƶ���Ƶ�Ƶ�׵��м�
figure,imshow(Y);title('shifted image');%��ʾ
B=fft2(Y);% ��ά����Ҷ�任
figure,imshow(B);title('FFT imagea');%��ʾ

%M1=rand(255/255);% ���������Կ
M1=0.814%ֻҪ��0��1��Χ�ھͺ�

M11=exp(i*2*pi*M1);%M11Ϊ���������λ���ɵ�ͼ����Ĥ
M111=B.*M11; %��Ҫ���ܵ�ͼ�����Ĥ���
figure,imshow(M111);title('phase mask');%��ʾ����ͼ��
 
D=fft2(M111); % �ٴθ���Ҷ�任
figure,imshow(D);title('FFT image b');
 
C=abs(D);%�Ծ������θ���Ҷ�仯��ͼ�����ػҶ�ȡ����ֵ
 
 
%���ܲ���
C1=ifft2(C); % ��ά����Ҷ��任
figure,imshow(C1);title('2-D IFFT b');%��ʾ����һ�θ���Ҷ��任��ͼ��
C11=C1.*exp(-i*2*pi*M1); % �Ƴ���Ĥ�����M1������Ϣ���ͷ��ͽ��շ�����Լ���õ���Կ�����ռ���ͼ����˱���֪��M1������ȷ���ܡ�
%�������ֻ����ʾ���ܽ��ܹ��̣���������ɵ�M1����ȻӦ������һ����Կ�ļ���¼M1��˫��������
figure,imshow(C11);title('remove mask');%��ʾ�Ƴ���Ĥ���ͼ��
C111=ifft2(C11); %��ά����Ҷ��任
figure,imshow(C111);title('2-D IFFT a');%��ʾȥ����Ĥ�ͽ������θ���Ҷ�任��ͼ��
C1111=ifftshift(C111); %����Ƶ�㻹ԭ��ԭʼλ��
F=abs(C1111); %ȡ����ֵ
figure,imshow(F);title('The decrypted image');%��ʾ���õ������ս��ܺ�ͼ��

