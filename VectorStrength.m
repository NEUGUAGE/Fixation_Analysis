i=1;
angleaverage1=0;
angleaverage2=0;
xx=17;
while i<19%enter the number of trials you want to analyse

    z=res(:,i);%copy all data from res
    i=i+1;
    z=z-xx*10/96;% 
    z(z<0)=z(z<0)+10;
    z(z>10)=z(z>10)-10;
    z=z*36;
    meanz=mean(z);
    x=cos((z/360)*2*pi);
    y=sin((z/360)*2*pi);
    t1=mean(x);
    t2=mean(y);
    a=t1;
    b=t2;
    angle= atan(t2/t1);

    title('WTB')%change the title of the graph
    hold on
    c=plot([0 a],[0 b],'-k');
    cosa=cos(angle);
    sina=sin(angle);
    if a<0
        p=plot(-cosa*1.02,-sina*1.02,'.k');
        p.MarkerSize = 20;
        set(gca,'XColor', 'none','YColor','none')
        axis equal


    else
        p=plot(cosa*1.02,sina*1.02,'.k');
        p.MarkerSize = 20;
        set(gca,'XColor', 'none','YColor','none')%remove the axis
        axis equal

    end
    th = 0:pi/50:2*pi;
    xunit = 1 * cos(th) + 0;
    yunit = 1 * sin(th) + 0;
    h = plot(xunit, yunit,'-k');
    h.MarkerEdgeColor = [1 0.5 0];
    set(gca,'XColor', 'none','YColor','none')
    axis equal
    angleaverage1=a+angleaverage1;
    angleaverage2=b+angleaverage2;
end
averageplot=plot([angleaverage1/11,0],[angleaverage2/11,0],'-r');
averageplot.LineWidth =2;