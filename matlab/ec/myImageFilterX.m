function [img1] = myImageFilterX(img0, h)
% through vectorization
% flip h

h=rot90(h,2);

imgwid=size(img0,2);
imghei=size(img0,1);
img1=zeros(imghei,imgwid);
len=size(h,1);
padsize=0.5*(len-1);
padfig= padarray(img0,[padsize padsize],'replicate');

% show original image
% subplot(1,2,1);
% imshow(padfig);

for idx=1:imghei*imgwid
    i=rem(idx,imghei);
    if (i==0)
        i=imghei;
    end
    
    j= floor(idx/imghei)+1;
    if (j>640)
        break;
    end

    block=padfig(i:i+len-1,j:j+len-1);
    temp=block.*h;
    img1(i,j)=sum(temp(:));
end

end