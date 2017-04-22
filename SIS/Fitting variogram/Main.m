function varargout = Main(varargin)
% MAIN M-file for Main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main

% Last Modified by GUIDE v2.5 31-Jan-2010 01:47:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Main is made visible.
function Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main (see VARARGIN)

% Choose default command line output for Main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
teta=str2num(get(handles.edit1,'string'));
angle_tol=str2num(get(handles.edit2,'string'));
tol_lag=str2num(get(handles.edit3,'string'));
%% data
x=[3,4,5,10,13,14,15,15,16,17,18,18,18,19,20,24,25,26,29,29,31,31,31,32,32,34,37,37,39,39,40,40,41,41,41,42,42,44,45,46,47,47,48,49,51,51,52,54,55,56,59,60,60,61,61,61,61,61,62,62,63,63,63,65,65,67,68,69,70,71,71,72,73,74,75,76,76,77,77,79,79,80,80,82,84,84,87,87,88,89,91,92,93,95,95,95,95,96,98,98];
y=[75,56,70,64,51,17,32,37,92,82,41,62,96,80,34,27,97,95,82,86,5,31,98,52,98,39,14,88,11,55,43,80,15,87,91,22,58,95,43,91,18,86,43,8,42,79,94,24,97,29,52,14,94,22,22,29,57,100,42,44,45,53,73,42,80,60,15,43,66,7,35,97,86,45,17,47,69,30,96,61,68,33,80,98,25,78,25,38,61,94,80,92,87,7,24,61,83,62,35,81];
k=[104,91,155,164,61,164,179,120,127,133,105,147,190,143,142,137,165,97,108,120,158,167,132,63,164,136,147,92,172,72,170,188,135,149,175,126,69,122,86,113,175,115,79,125,119,65,145,154,189,151,140,190,74,157,157,155,60,110,188,197,187,153,61,199,124,61,196,195,68,178,200,68,69,88,184,148,63,173,74,150,75,158,65,69,177,69,130,120,148,70,138,141,131,185,166,153,137,158,201,157];


%% selecting pairs of points that make 0 degree vector
clc
ang=teta;                                       
hold off;
clear points1 points2
counter=1;
for ii=1:100
        for jj=1:100
            if (ii~=jj && (deg2rad(ang-angle_tol)<=angle((x(ii)-x(jj))+(y(ii)-y(jj))*1i) && angle((x(ii)-x(jj))+(y(ii)-y(jj))*1i)<=deg2rad(ang+angle_tol)))

                points1(counter)=ii;      % this line shows selected point and below line shows it's pair.
                points2(counter)=jj;     
                counter=counter+1;
            
            end
        end
end

%% 
cut1=str2double(get(handles.edit4,'string'));
cut2=str2double(get(handles.edit5,'string'));

%% showing the results of selected pairs
axes(handles.axes1)
%% plot the indicator
plot(x(k<=cut1),y(k<=cut1),'sb','markerfacecolor','b');
hold on;
plot(x(k<=cut2 & k>cut1),y(k<=cut2 & k>cut1),'or','markerfacecolor','r');
plot(x(k>cut2),y(k>cut2),'^g','markerfacecolor','g');
legend('i = 0','i = 1','i = 2','location','eastoutside');title('plot of indicators for the chosen cut off');xlabel('x');ylabel('y');
hold off;
%% making indicator vector
indicator=zeros(1,length(k));
indicator(k<=cut1)=0;
indicator(k<=cut2 & k>cut1)=1;
indicator(k>cut2)=2;

%% calculating variogram between selected pairs
intered_lag=str2double(get(handles.lag_box,'string'));
lag=0:intered_lag:20;  %change this if you want to fit the spherical to more lags.
bandwidth=str2double(get(handles.bandwidth,'string'));
variogram=zeros(length(lag),1);
bandwidth_start=str2double(get(handles.band_start,'string'));
for mm=1:length(lag)
  sum=0;
  pair_number=0;
  for ii=1:length(points1)   
      if abs(x(points2(ii))-x(points1(ii))+(y(points2(ii))-y(points1(ii)))*1i)<=lag(mm)+tol_lag...    % checking distance beween pairs.
                 && lag(mm)-tol_lag<=abs(x(points2(ii))-x(points1(ii))+(y(points2(ii))-y(points1(ii)))*1i)

             if mm>bandwidth_start     %excluding the points that are not in the bandwidth.
                 if ((deg2rad(ang+rad2deg(atan(bandwidth/(abs(x(points2(ii))-x(points1(ii))+(y(points2(ii))-y(points1(ii)))* 1i) * ...
                    cos(angle(x(points1(ii))-x(points2(ii))+(y(points2(ii))-y(points2(ii)))* 1i)-deg2rad(ang))))))...
                    <= angle((x(points1(ii))-x(points2(ii)))+(y(points1(ii))-y(points2(ii)))*1i)) ||...
                    (angle((x(points1(ii))-x(points2(ii)))+(y(points1(ii))-y(points2(ii)))*1i) <= ...         
                    deg2rad(ang-rad2deg(atan(bandwidth/(abs(x(points2(ii))-x(points1(ii))+(y(points2(ii))-y(points1(ii)))* 1i) * ...
                    cos(angle(x(points1(ii))-x(points2(ii))+(y(points2(ii))-y(points2(ii)))* 1i)-deg2rad(ang))))))))
               
                  continue
                 end
             end
            
             sum=sum+(indicator(points2(ii))-indicator(points1(ii)))^2;
             pair_number=pair_number+1;
             
      end
  end
  variogram(mm)=sum/(.5*pair_number);
end

axes(handles.axes3)
%% showing the results
plot(lag,variogram,'.:k','linewidth',5);
hold on;

%% fitting the spline
spline_lag=[0:.1:lag(end)];
variogram_interpol=spline(lag,variogram,spline_lag);
plot(spline_lag,variogram_interpol,'-*','linewidth',1.5)

%% fitting an spherical model
end_model=str2num(get(handles.end_model,'string'));
c_lag=spline_lag(1:end_model);
x=[ones(length(c_lag),1) c_lag' -(c_lag').^3];
spherical=(x'*x)^-1*x'*variogram_interpol(1:end_model)';
nugget=spherical(1);
sill=(spherical(3)/spherical(2)^3*(1.5^3/.5))^-.5 + nugget;
range=1.5/spherical(2)*(sill-nugget);
landa = @(h)((sill-nugget)*(1.5*h./range-.5*h.^3./range.^3)+nugget);
lag_=c_lag(end_model):1:lag(end);
plot(c_lag,landa(c_lag),'*r',lag_,repmat(landa(c_lag(end)),1,length(lag_)),'-*r')
title('indicator variogram for teta+-tolerance degree vectors');xlabel('lag');ylabel('variogram');
axis auto;legend('Indicator variogram','location','northwest','fitted spline','fitted spherical model');
set(handles.text_nugget,'string',num2str(nugget));
set(handles.text_range,'string',num2str(range));
set(handles.text_sill,'string',num2str(sill));
empty_index=0;
for i=1:length(variogram)
    if isnan(variogram(i))
        empty_index=i;
    end
end
if empty_index==0,empty_index=lag(end);end
xlim([0,empty_index])

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lag_box_Callback(hObject, eventdata, handles)
% hObject    handle to lag_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lag_box as text
%        str2double(get(hObject,'String')) returns contents of lag_box as a double


% --- Executes during object creation, after setting all properties.
function lag_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lag_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bandwidth_Callback(hObject, eventdata, handles)
% hObject    handle to bandwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bandwidth as text
%        str2double(get(hObject,'String')) returns contents of bandwidth as a double


% --- Executes during object creation, after setting all properties.
function bandwidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bandwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function band_start_Callback(hObject, eventdata, handles)
% hObject    handle to band_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of band_start as text
%        str2double(get(hObject,'String')) returns contents of band_start as a double


% --- Executes during object creation, after setting all properties.
function band_start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to band_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function end_model_Callback(hObject, eventdata, handles)
% hObject    handle to end_model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of end_model as text
%        str2double(get(hObject,'String')) returns contents of end_model as a double


% --- Executes during object creation, after setting all properties.
function end_model_CreateFcn(hObject, eventdata, handles)
% hObject    handle to end_model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text_nugget_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_nugget (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text_sill_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_sill (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text_range_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)