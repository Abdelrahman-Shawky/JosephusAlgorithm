clc;clear;close all
prompt = {'\fontsize{13} Enter Number of people:','\fontsize{13} Enter Step Size:'}; %Subtitles
dlgtitle = 'Josephus Algorithm'; %Title
size = [1 50]; %Size to show whole title
definput = {'1','1'}; %Default values 1,1
opts.Interpreter = 'tex'; %Enable tex markup to increase font
answer = inputdlg(prompt,dlgtitle,size,definput,opts);
n =  str2num(answer{1}); %convert string entered to integer
k =  str2num(answer{2}); 
alive = ones(1,n); %create a vector 1 x n
position = 0;
l = [1:n]; %vector for l 
hFigure = figure; %remove menu bar & toolbar
set(hFigure, 'MenuBar', 'none');
set(hFigure, 'ToolBar', 'none');
set(gcf, 'Position', get(0, 'Screensize')); %make full screen(gca: get current axis)
for i=0:n-1 %plot all blue circles
    x=n*cos((2*pi*i/n)+pi/2);
    y=n*sin((2*pi*i/n)+pi/2);
    if n<100 %increase point size
    plot(x,y,'bo','MarkerFaceColor','b','MarkerSize',20-n*0.15)  
    else 
        plot(x,y,'bo','MarkerFaceColor','b')  
    end
    hold on
            if rem(n,4)==0
        if i+1<=n/4 %l
        text(x-2,y+2,num2str(l(i+1)),'VerticalAlignment','bottom','HorizontalAlignment','right')
             else if i+1<=n/2
                    text(x-2,y-2,num2str(l(i+1)),'VerticalAlignment','top','HorizontalAlignment','right')
                  else if i+1<=3*n/4
                  text(x+2,y-2,num2str(l(i+1)),'VerticalAlignment','top','HorizontalAlignment','left')
                       else 
                       text(x+2,y+2,num2str(l(i+1)),'VerticalAlignment','bottom','HorizontalAlignment','left')
                       end
                  end
        end
            else
                if i+1<=n/4+1 %l
        text(x-2,y+2,num2str(l(i+1)),'VerticalAlignment','bottom','HorizontalAlignment','right')
             else if i+1<=n/2+1
                    text(x-2,y-2,num2str(l(i+1)),'VerticalAlignment','top','HorizontalAlignment','right')
                  else if i+1<=3*n/4+1
                  text(x+2,y-2,num2str(l(i+1)),'VerticalAlignment','top','HorizontalAlignment','left')
                       else 
                       text(x+2,y+2,num2str(l(i+1)),'VerticalAlignment','bottom','HorizontalAlignment','left')
                       end
                  end
                end
            end
end 
set(gca,'color','y') %yellow background
set(gca,'XTick',[], 'YTick', []) %remove axis values  
title('\fontsize{22} {\color{red}Josephus Algorithm}') %plot title
axis([-10-n n+10 -10-n n+10]) 
axis square %circle instead of elipse
pause(.1)
while(length(alive(alive == 1 ))>1) % loop till one person is left alive
    c = 1 ; % counter set to 1
    position = position + 1; % starting position of counting
               if (position > n) % if it overlaps 
               position = position - n; % return postion from zero
               end
          for i=0:n-1
                   if alive(position)==1 && i+1==position
                   x=n*cos((2*pi*i/n)+pi/2);
                   y=n*sin((2*pi*i/n)+pi/2);
                        if n<100 %increase point size
                        plot(x,y,'go','MarkerFaceColor','g','MarkerSize',30-n*0.15)
                        else 
                        plot(x,y,'go','MarkerFaceColor','g')  
                        end   
                   else if alive(i+1)==0
                   x=n*cos((2*pi*i/n)+pi/2);
                   y=n*sin((2*pi*i/n)+pi/2);
                        if n<100 %increase point size
                        plot(x,y,'rx','MarkerSize',20-n*0.15)
                        else 
                        plot(x,y,'rx')
                        end %plot red x if dead
                   else
                   x=n*cos((2*pi*i/n)+pi/2);
                   y=n*sin((2*pi*i/n)+pi/2);
                        if n<100 %increase point size
                        plot(x,y,'bo','MarkerFaceColor','b','MarkerSize',20-n*0.15)
                        else 
                        plot(x,y,'bo','MarkerFaceColor','b')  
                        end %plot blue circle if alive
                       end 
                   end
        if rem(n,4)==0
        if i+1<=n/4 %l
        text(x-2,y+2,num2str(l(i+1)),'VerticalAlignment','bottom','HorizontalAlignment','right')
             else if i+1<=n/2
                    text(x-2,y-2,num2str(l(i+1)),'VerticalAlignment','top','HorizontalAlignment','right')
                  else if i+1<=3*n/4
                  text(x+2,y-2,num2str(l(i+1)),'VerticalAlignment','top','HorizontalAlignment','left')
                       else 
                       text(x+2,y+2,num2str(l(i+1)),'VerticalAlignment','bottom','HorizontalAlignment','left')
                       end
                  end
        end
            else
                if i+1<=n/4+1 %l
        text(x-2,y+2,num2str(l(i+1)),'VerticalAlignment','bottom','HorizontalAlignment','right')
             else if i+1<=n/2+1
                    text(x-2,y-2,num2str(l(i+1)),'VerticalAlignment','top','HorizontalAlignment','right')
                  else if i+1<=3*n/4+1
                  text(x+2,y-2,num2str(l(i+1)),'VerticalAlignment','top','HorizontalAlignment','left')
                       else 
                       text(x+2,y+2,num2str(l(i+1)),'VerticalAlignment','bottom','HorizontalAlignment','left')
                       end
                  end
                end
            end
        hold on
               end
    set(gca,'color','y') %yellow background
    set(gca,'XTick',[], 'YTick', []) %remove axis values    
    title('\fontsize{22} {\color{red}Josephus Algorithm}') %plot title
    axis([-10-n n+10 -10-n n+10])
    axis square %circle instead of elipse
    hold off %to draw x instead of o
    pause(.1) %slow  processing                   
    while (c < k) % loop k-1 times
        if (alive(position)==1) % make sure position to start counting at is alive
        position = position + 1; % move to next position
               if (position > n) % if it overlaps 
               position = position - n; % return postion from zero
               end
            while (alive(position)==0) % if person is dead loop till next alive is found
            position = position + 1; 
               if (position > n) % if it overlaps 
               position = position - n; % return postion from zero
               end  
            end
        end
    c = c + 1; % increase counter by 1
    end
alive(position) = 0; % kill this person
        for i=0:n-1
            if alive(i+1)==0
            x=n*cos((2*pi*i/n)+pi/2);
            y=n*sin((2*pi*i/n)+pi/2);
                  if n<100 %increase point size
                  plot(x,y,'rx','MarkerSize',20-n*0.15)
                  else 
                  plot(x,y,'rx')  
                  end %plot red x if dead
            else
            x=n*cos((2*pi*i/n)+pi/2);
            y=n*sin((2*pi*i/n)+pi/2);
                  if n<100 %increase point size
                  plot(x,y,'bo','MarkerFaceColor','b','MarkerSize',20-n*0.15)
                  else 
                  plot(x,y,'bo','MarkerFaceColor','b')  
                  end %plot blue circle if alive
            end 
            if rem(n,4)==0
        if i+1<=n/4 %l
        text(x-2,y+2,num2str(l(i+1)),'VerticalAlignment','bottom','HorizontalAlignment','right')
             else if i+1<=n/2
                    text(x-2,y-2,num2str(l(i+1)),'VerticalAlignment','top','HorizontalAlignment','right')
                  else if i+1<=3*n/4
                  text(x+2,y-2,num2str(l(i+1)),'VerticalAlignment','top','HorizontalAlignment','left')
                       else 
                       text(x+2,y+2,num2str(l(i+1)),'VerticalAlignment','bottom','HorizontalAlignment','left')
                       end
                  end
        end
            else
                if i+1<=n/4+1 %l
        text(x-2,y+2,num2str(l(i+1)),'VerticalAlignment','bottom','HorizontalAlignment','right')
             else if i+1<=n/2+1
                    text(x-2,y-2,num2str(l(i+1)),'VerticalAlignment','top','HorizontalAlignment','right')
                  else if i+1<=3*n/4+1
                  text(x+2,y-2,num2str(l(i+1)),'VerticalAlignment','top','HorizontalAlignment','left')
                       else 
                       text(x+2,y+2,num2str(l(i+1)),'VerticalAlignment','bottom','HorizontalAlignment','left')
                       end
                  end
                end
            end
        hold on
        end
    set(gca,'color','y') %yellow background
    set(gca,'XTick',[], 'YTick', []) %remove axis values    
    title('\fontsize{22} {\color{red}Josephus Algorithm}') %plot title
    axis([-10-n n+10 -10-n n+10])
    axis square %circle instead of elipse
    hold off %to draw x instead of o
    pause(.1) %slow  processing 
end
last = find(alive); % gets position of last person alive
fprintf('last surviving position is : %d\n',last)
CreateStruct.Interpreter = 'tex'; %enable tex markup
CreateStruct.WindowStyle = 'modal'; %block any execution till user interacts with message
L = msgbox(['\fontsize{15} Last Surviving Position = ' num2str(last)],CreateStruct); % message
