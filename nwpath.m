function nwpath(hObject,event)
%% this function plots the path between source and destination
%% Plot the network
global hmain nodeloc nodes
gui=guidata(hmain);
area=str2num(get(gui.gui.edit,'String'))
nodes=str2num(get(gui.gui.nodes,'String'))
grid_size=str2num(get(gui.gui.grid,'String'))
% validation of grid size
if rem(area,grid_size)~=0
    errordlg('Enter The grid size so that equal number of grids are formed in the area')
    return
end
nodeloc=(area-0)*rand(nodes,2); % random positions of nodes
axis([0,area,0,area]) % geographical area plotting
title(['Network Plotting for area = ',num2str(area),' m^2 & number of nodes = ',num2str(nodes),' with grid size ',num2str(grid_size),' m^2'])
hold on
for ii=1:nodes
    plot(nodeloc(ii,1),nodeloc(ii,2),'r*') % nodes' plottinf
    text(nodeloc(ii,1),nodeloc(ii,2),num2str(ii))
    hold on
end

for ii=1:area/grid_size
    y=(grid_size)*ii; % change in y grid position
    plot(1:area,repmat(y,area,1),'k')
    hold on
end
for ii=1:area/grid_size
    x=(grid_size)*ii; % change in y grid position
    plot(repmat(x,area,1),1:area,'k')
    hold on
end

%% Plot the path and route
Range=str2num(get(gui.gui.range,'String'))

dstno=str2num(get(gui.gui.dst,'String')); % get the destination node
for ii=1:dstno
    dst(ii)=round((nodes-1)*rand+1);
    plot(nodeloc(dst(ii),1),nodeloc(dst(ii),2),'hk','markerSize',10,'MarkerFaceColor',[1,1,0])
end
pkt=str2num(get(gui.gui.pkt,'String'));% get no of packets
% text(nodeloc(dst,1),nodeloc(dst,2),'dst')
for ii=1:nodes
    for jj=1:nodes
        dist(ii,jj)=sqrt((nodeloc(ii,1)-nodeloc(jj,1))^2+(nodeloc(ii,2)-nodeloc(jj,2))^2);
        if dist(ii,jj)<=Range
            inrange(ii,jj)=1;
        else
            inrange(ii,jj)=0;
        end
    end
end

for jj=1:pkt
    src=round((nodes-1)*rand+1); % generate the random source node for each packet
    % to check sorce node doesn't overlap with destinatio source nodes
    if ismember(src,dst)
         src=round((nodes-1)*rand+1); 
    end
    plot(nodeloc(src,1),nodeloc(src,2),'hg','markerSize',10,'MarkerFaceColor',[0,1,0])
    text(nodeloc(src,1)+1,nodeloc(src,2),'Source','BackgroundColor',[.7 .9 .7])
    for ii=1:dstno
        [totdist(ii),path{ii}]=aodv(src,dst(ii),inrange,nodeloc);
        
    end
    [~,index]=min(totdist);
    plot(nodeloc(path{index},1),nodeloc(path{index},2),'k','linewidth',2)
    for kk=1:numel(path{index})-1
        [x, y]=points(nodeloc(path{index}(kk),1),nodeloc(path{index}(kk),2),nodeloc(path{index}(kk+1),1),nodeloc(path{index}(kk+1),2));
        for pp=1:size(x,1)
            h2=text(x(pp),y(pp),[num2str(jj),' Packet'],'BackgroundColor',[.7 .9 .7]);
            pause(0.01)
            set(h2(),'Visible','off');
        end
    end
end
end
% end
