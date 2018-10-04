

    resim = imread(['/2.jpg']);
    subplot(3,3,1);
    imshow(resim);
    
    %gri tonlu
    gray = rgb2gray(resim);
    subplot(3,3,2);
    imshow(gray);
 
    % resmin mor renkteki piksellerini 1 yap?p di?erlerini 0 yap?yor
    img = resim;
    red = img(:,:,1);
    green = img(:,:,2);
    blue = img(:,:,3);
    rMask = red > 20;
    gMask = green < 100;
    bMask = blue > 20;
    redObjectMask = uint8(rMask & gMask & bMask); 
    isored = zeros(size(redObjectMask),'uint8');
    isored(:,:,1) = img(:,:,1) .* redObjectMask;
    isored(:,:,2) = img(:,:,2) .* redObjectMask;
    isored(:,:,3) = img(:,:,3) .* redObjectMask;
    bwImage = im2bw(isored,0);
    figure;
    imshow(bwImage);
    
    % g?r?lt? temizleme
    son = bwareaopen(bwImage,60);
    figure;
    imshow(son);
    
    % geni?letme(dilation)
    se90 = strel('disk', 8);
    son2 = imdilate(son,se90);
    figure;
    imshow(son2);
    
    % delik doldurma
    dolu = imfill(son2,'holes');
    figure;
    imshow(dolu);

    % erozyon
    se90 = strel('disk', 6);
    sonhali = imerode(dolu,se90);
    figure;
    imshow(sonhali);

  % sonuc degiskenine son deger atmayi unutmayiniz.
    sonuc = sonhali;    
end