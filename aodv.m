function [total_dist,path]=aodv(src_node1,dst_node,inrange,nodeloc)
%% function to plot shortest path using AODV protocol
%%
src_node=src_node1; % to reset teh src_node to original source node after every iteration of n=1:citysize
    rtngtble=src_node;% initialise
    tble1=src_node;% initialise
    tble=src_node;% initialise
    cnt=1;% initialise
    cnt1=1;% initialise
    counter=1;
    dimnsn(cnt)=numel(rtngtble);
    while rtngtble~=dst_node
       
            for ii=1:numel(tble1)
                src_node=tble1(ii);
                temp=find(inrange(src_node,:));
                temp=temp(find(ismember(temp,tble)==0));
                str{cnt1}=[src_node,temp];
                tble=[tble, temp];
                cnt1=cnt1+1;
            end
            tble1=tble(find(ismember(tble,rtngtble)==0));% seprate nodes which are not present in routing table
            rtngtble=[rtngtble,tble];
            % remove the repeated node in table
            [any,index]=unique( rtngtble,'first');
            rtngtble=rtngtble(sort(index));
            
            if ismember(dst_node,rtngtble)
                dst_cell=find(cellfun(@equal, str,repmat({dst_node},1,length(str)))); % find out whihch structre cell has destination node
                dst=dst_cell;
                nodtble=dst_node;
                frst_node=dst;
                while frst_node~=src_node1
                    frst_node=str{dst(1)}(1);
                    dst=find(cellfun(@equal, str,repmat({frst_node},1,length(str)))); 
                    nodtble=[nodtble, frst_node];
                end
%                 msgbox('path found')
                nodtble=fliplr(nodtble) % final routing table
            
                %%
                route{counter}=nodtble; % save all AODV paths for each change in vehicle position into a structure
                % take out the distance of nodes in routing table from each other
                for ii=1:numel(nodtble)-1
                    distnc(ii)=sqrt((nodeloc(nodtble(ii+1),1)-nodeloc(nodtble(ii),1))^2+(nodeloc(nodtble(ii+1),2)-nodeloc(nodtble(ii),2))^2);
                end
                total_dist=sum(distnc); % total distnace from source to destination
                distance(counter)=total_dist;% Total Distance between hops in AODV path
                counter=counter+1;
             end

            cnt=cnt+1;
            dimnsn(cnt)=numel(rtngtble);
            if numel(rtngtble)==1           
                msgbox('1-No Node in range, Execute again')
                return
            end
            if cnt>=5
%                 h8=msgbox('No path found');
                break
            end
         
    end
    if ~exist('nodtble','var')
        errordlg('Transmission Range is less,Kindly enhance it')
        return
    end
    path=nodtble;
end
