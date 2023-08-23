% This code is for selecting flies that can fix bars at certain position
% from the STRAIGHT BAR FIXATION at long time. 
% Ctrl+A select all datas

v=0.6;% input the desired circular variance for selecting


for i = 1:9 %enter the number of trials you want to analyze
   z=res(:,i);%copy all the data into z
   pos = z/10*2*pi;

   front_bar_pos_in_x = 17;
   front_bar_pos_in_rad = 17/96*2*pi;

   [x,y] = pol2cart(pos, ones(size(pos)));
   x_mean = mean(x);
   y_mean = mean(y);

   [th, r] = cart2pol(x_mean, y_mean);

   cv = 1-r;
   %if i==1
       disp(['fly ' num2str(i) ': ' num2str(cv)]);
   %end
end


%    z=z-170/96;
%    z=z*36;
%    x=cos((z/360)*2*pi);
%    y=sin((z/360)*2*pi);
%    t1=mean(x);
%    t2=mean(y);
%    V=1-sqrt((t1^2+t2^2));%circular variance calculation;
%    disp(V);
%    selection(i,2)=V;
%    if V<v
%        selection(i,1)="1";
%    else
%        selection(i,1)="0";
%    end
% end
