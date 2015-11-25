clear all
close all
clc

%%
global hmain
hmain=figure(1);
%set the area edit box
uicontrol('style','text','Units','Normalize','Position',[0.82 0.900 0.150 0.05],'String','Enter The Area');
gui.edit=uicontrol('style','edit','Units','Normalize','Position',[0.84 0.850 0.100 0.05],'BackgroundColor','white');
%set the node number edit box
uicontrol('style','text','Units','Normalize','Position',[0.82 0.780 0.150 0.07],'String','Enter The Nodes no');
gui.nodes=uicontrol('style','edit','Units','Normalize','Position',[0.84 0.730 0.100 0.05],'BackgroundColor','white');
%set the node grid size edit box
uicontrol('style','text','Units','Normalize','Position',[0.82 0.660 0.150 0.07],'String','Enter The Grid Size');
gui.grid=uicontrol('style','edit','Units','Normalize','Position',[0.84 0.610 0.100 0.05],'BackgroundColor','white');

% uicontrol('style','text','Units','Normalize','Position',[0.82 0.45 0.152 0.05],'String','Enter The Source');
% gui.src=uicontrol('style','edit','Units','Normalize','Position',[0.84 0.40 0.100 0.05],'BackgroundColor','white');
uicontrol('style','text','Units','Normalize','Position',[0.82 0.55 0.152 0.05],'String','Base stations No.');
gui.dst=uicontrol('style','edit','Units','Normalize','Position',[0.84 0.50 0.100 0.05],'BackgroundColor','white');
uicontrol('style','text','Units','Normalize','Position',[0.82 0.45 0.152 0.05],'String','No. of packets');
gui.pkt=uicontrol('style','edit','Units','Normalize','Position',[0.84 0.40 0.100 0.05],'BackgroundColor','white');
uicontrol('style','text','Units','Normalize','Position',[0.80 0.32 0.200 0.08],'String','Enter The Transmission Range');
gui.range=uicontrol('style','edit','Units','Normalize','Position',[0.84 0.26 0.100 0.05],'BackgroundColor','white');
gui.button=uicontrol('style','pushbutton','Units','Normalize','Position',[0.84 0.21 0.100 0.05],'string','plot path'...
    ,'callback',@nwpath,'BackgroundColor','cyan');
% uicontrol('style','pushbutton','Units','Normalize','Position',[0.70 0.01 0.100 0.05],'string','Clear All'...
%     ,'callback',@cla,'BackgroundColor','cyan');
set(axes,'position',[0.1,0.1,0.7,0.7])
%% available the variables balues for other functions usage
handles.gui=gui;
guidata(hmain,handles)
get(gui.edit,'value')
%%




