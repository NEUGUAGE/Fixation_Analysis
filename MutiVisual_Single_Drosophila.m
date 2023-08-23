%Multiplot Direction: 1->2
                     %3->4
i=1;
xd=1;
num=1;
while i<10%edit here each visual patterns trail numbers
    while xd<6 %edit here,a array which means the different visual patterns
    oldres=res(:,:,xd);
    newres=oldres(:,i);
    xd=xd+1;
    n=0;
    newres=newres-170/96;
    newres=newres*36;
    newres(newres<0)=newres(newres<0)+360;
    newres(newres>360)=newres(newres<0)-360;
    dashedline1=zeros(3600,1);
    dashedline2=zeros(3600,1);
    dashedline3=zeros(3600,1);
    dashedline2=dashedline2+180;
    dashedline3=dashedline3+360;
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
    subplot(9,5,num);%edit here
    graphB=plot(newres,'k');
    graphB.LineWidth = 0.5;
    hold on
    rectanglelines=plot(dashedline1,'--r');
    circlelines=plot(dashedline2,'--r');
    lines=plot(dashedline3,'--r');
    num=num+1;
    end
    xd=1;
    i=i+1;
end