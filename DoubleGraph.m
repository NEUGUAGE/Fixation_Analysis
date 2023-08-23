i=0;
l=0;
rows=6;% Enter rows&columns=number of trialsx3 here
cols=9;
graph_num=rows*cols;
while l<graph_num %enter the number of trials X3 you want to analysis
    i=i+1;
    n=0;
    l=l+1; 
    newres=res(:,i)-170/96;
    newres=newres*36;
    dashedline1=zeros(3600,1);
    dashedline2=zeros(3600,1);
    dashedline3=zeros(3600,1);
    dashedline2=dashedline2+180;
    dashedline3=dashedline3+360;
    subplot(rows,cols,l);
    polarhistogram(newres/360*(2*pi));
    hold on
    while n<3599%number of frame-1
        n=n+1;
        first=newres(n,1);
        second=newres(n+1,1);
        detectionvalue=abs(first-second);
            if detectionvalue>=300
                newres(n,1)=nan;
                newres(n+1,1)=nan;
            end
    end
    l=l+1;
    subplot(rows,cols,l); 
    graphB=plot(newres,'k');
    graphB.LineWidth = 0.5;
    hold on
    rectanglelines=plot(dashedline1,'--r');
    circlelines=plot(dashedline2,'--r');
    lines=plot(dashedline3,'--r');
    l=l+1;
    subplot(rows,cols,l)
    z=res(:,i);
    z=z-170/96;
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
    hold on
    c=plot([0 a],[0 b],'-k');
    cosa=cos(angle);
    sina=sin(angle);
    if a<0
        p=plot(-cosa*1.02,-sina*1.02,'.k');
        p.MarkerSize = 10;
        set(gca,'XColor', 'none','YColor','none')
        axis equal


    else
        p=plot(cosa*1.02,sina*1.02,'.k');
        p.MarkerSize = 10;
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
  
end