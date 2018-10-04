
  
    resim = imread(['/1.jpg']);
    subplot(2,2,1);
    imshow(resim);
    
    % griye ceviriyorum
    gray = rgb2gray(resim);
    subplot(2,2,2);
    imshow(gray);
    
    % canny kenar bulma metodunu kullanarak kenar buluyorum.
    kenar = edge(gray,'canny');
    subplot(2,2,3);
    imshow(kenar);
    
    % g?r?nt?deki delikleri dolduruyorum.
    dolu = imfill(kenar,'holes');
    subplot(2,2,4);
    imshow(dolu);
    
    % g?r?lt? temizleme
    temiz = bwareaopen(dolu,500);
    figure;
    imshow(temiz);
    
    % erozyon yapma
    se90 = strel('disk', 2);
    erode = imerode(temiz,se90)
    figure;
    imshow(erode);
    
    yeni = bwareaopen(erode,100);
    figure;
    imshow(yeni);
    
    % dilation yapma
    se90 = strel('disk', 4);
    yeni2 = imdilate(yeni,se90)
    figure;
    imshow(yeni2);
    
    % delik doldur
    sonhali = imfill(yeni2,'holes');
    figure;
    imshow(sonhali);

    % sonuc degiskenine son deger atmayi unutmayiniz.
    sonuc = sonhali;
end