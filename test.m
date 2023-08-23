cam = webcam('Arducam OV9782 USB Camera');%Subject to change 

img = snapshot(cam);%
img_grey=rgb2gray(img);

a = tic;

tmp_img = double(img_grey);
tmp_img(:) = 0;

total_scans = 50;
for i = 1:total_scans
    img = snapshot(cam);%
    img_grey=rgb2gray(img);

    tmp_img = tmp_img+double(img_grey)/255;

    %imshow(img_grey)
    if mod(i,10)==0
        disp(i)
    end


end
tmp_img = tmp_img/total_scans;

toc(a)/total_scans

imshow(tmp_img)


start_time = tic;
while toc(start_time)<10
    img = snapshot(cam);%
    img_after_subtraction = tmp_img - double(rgb2gray(img))/255;
    
    img_after_subtraction(img_after_subtraction>0.5) = 1.0;
    img_after_subtraction(img_after_subtraction<=0.5) = 0;
    
    tmp_x = sum(img_after_subtraction,1);
    [~,tmp_idx_x] = find(tmp_x>5);
    idx_x = mean(tmp_idx_x);
    tmp_y = sum(img_after_subtraction,2);
    [~,tmp_idx_y] = find(tmp_y'>5);
    idx_y = mean(tmp_idx_y);

    fly_location = [idx_y, idx_x];


    imagesc(img_after_subtraction);
    hold on; plot(fly_location(2), fly_location(1), 'r.', 'markersize', 20);
    drawnow();
end



