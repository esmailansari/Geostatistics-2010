function varargout = SGS_simulator(varargin)
% SGS_SIMULATOR M-file for SGS_simulator.fig
%      SGS_SIMULATOR, by itself, creates a new SGS_SIMULATOR or raises the existing
%      singleton*.
%
%      H = SGS_SIMULATOR returns the handle to a new SGS_SIMULATOR or the handle to
%      the existing singleton*.
%
%      SGS_SIMULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SGS_SIMULATOR.M with the given input arguments.
%
%      SGS_SIMULATOR('Property','Value',...) creates a new SGS_SIMULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SGS_simulator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SGS_simulator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SGS_simulator

% Last Modified by GUIDE v2.5 31-Jan-2010 17:09:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SGS_simulator_OpeningFcn, ...
                   'gui_OutputFcn',  @SGS_simulator_OutputFcn, ...
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


% --- Executes just before SGS_simulator is made visible.
function SGS_simulator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SGS_simulator (see VARARGIN)

% Choose default command line output for SGS_simulator
 handles.output = hObject;
% UI_data=[1,2,5,6,10,15,20,27,31,32,39,43,51,59,62,64,36,81,85,93;
%          5,80,30,2,32,86,12,90,26,47,79,22,1,29,95,44,67,31,47,55;
%          17,12,13,19,21,28,12,10,14,22,11,29,30,15,17,13,17,24,28,20];
% set(handles.UItable,'data',UI_data);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SGS_simulator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SGS_simulator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function X_blocks_Callback(hObject, eventdata, handles)
% hObject    handle to X_blocks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X_blocks as text
%        str2double(get(hObject,'String')) returns contents of X_blocks as a double


% --- Executes during object creation, after setting all properties.
function X_blocks_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X_blocks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_blocks_Callback(hObject, eventdata, handles)
% hObject    handle to Y_blocks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y_blocks as text
%        str2double(get(hObject,'String')) returns contents of Y_blocks as a double


% --- Executes during object creation, after setting all properties.
function Y_blocks_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y_blocks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup.
function popup_Callback(hObject, eventdata, handles)
% hObject    handle to popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup


% --- Executes during object creation, after setting all properties.
function popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global known_points_Ix known_points_Iy X Y Plane known_data
plot(known_points_Ix,known_points_Iy,'ob','markerfacecolor','b');
hold on;
[c,h]=contour(X,Y,Plane',[min(known_data(3,:)):max(known_data(3,:))]);
contour_handle=clabel(c,h);
set(contour_handle,'fontsize',7)
xlabel('X direction');ylabel('Y direction');title('Changing trend of porosity');
legend('known Points');
grid on;
hold off;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sill=str2double(get(handles.sill_text,'string'));
nugget=str2double(get(handles.nugget_text,'string'));
Grid_Size=str2double(get(handles.size_grid,'string'));
R_x=str2double(get(handles.R_x_text,'string'))*10^3/Grid_Size;
R_y=str2double(get(handles.R_y_text,'string'))*10^3/Grid_Size;
global known_data X_blocks Y_blocks
X_blocks=str2double(get(handles.X_blocks,'string'));
Y_blocks=X_blocks;
message{1}='PLEASE WAIT ...';
msgbox(message,'PLEASE WAIT ...','help');
known_data=cell2mat(get(handles.UItable,'data'));
known_data(isnan(known_data))=[];
total_nodes=X_blocks*Y_blocks;
k = (R_x/R_y)^2;
pop_value=get(handles.popup,'value');
switch pop_value
    case 1
        points_number=12;
    case 2
        points_number=20;
    case 3 
        points_number=48;
end
if isempty(known_data)
    known_data=[1,2,5,6,10,15,20,27,31,32,39,43,51,59,62,64,36,81,85,93;
          5,80,30,2,32,86,12,90,26,47,79,22,1,29,95,44,67,31,47,55;
          17,12,13,19,21,28,12,10,14,22,11,29,30,15,17,13,17,24,28,20];
end
%% set data
global Plane X Y known_points_Ix known_points_Iy uncertainty
Plane=zeros(X_blocks,Y_blocks);
uncertainty=zeros(X_blocks,Y_blocks);
[m,n]=size(known_data);
for i=1:n,Plane(known_data(1,i),known_data(2,i))=known_data(3,i);end
[known_points_Ix known_points_Iy] = find(Plane~=0); % this line is just for plotting the known data.

%%  covaiance(h) = variance - variogram 
sigma =  @(h) ((sill -((sill-nugget)*(1.5*h/R_x-.5*(h/R_x).^3)+nugget)) .* (h<R_x));

%% labeling the points with their turns (for setting the random path)
point_turn = randperm(total_nodes);
point_turn = reshape(point_turn,X_blocks,Y_blocks);

%% labeling all the points by they turn 
point_index = zeros(X_blocks*Y_blocks,2);
for i=1:X_blocks
    for j=1:Y_blocks        
        point_index(point_turn(i,j),:) = [i,j];   
    end
end
%% here we krige points that are unknown.
for i=1:total_nodes
    kriging_point_index = point_index(i,:);
    if Plane(kriging_point_index(1),kriging_point_index(2))~=0
        continue
    end
    
    %% find the nearest points around our randomly selected point
    h = zeros(points_number);H = zeros(points_number,1);PorosityOfSelectedPoints = zeros(1,points_number);
    A=10^10;
    
    %% for all the grids that are nonzero, find there distances to the
    % target node 
    [IX_BLOCKS IY_BLOCKS]=meshgrid((1:X_blocks),(1:Y_blocks));
    distance_matrix = ((IY_BLOCKS-kriging_point_index(1)).^2+(IX_BLOCKS-kriging_point_index(2)).^2).^.5 .* (Plane ~= 0) + A .* (Plane == 0);
        
    %% here we sort all the distances to select the nearest points to our
    % target point, ( number of nearest points = points_number).
    [dummy sorted_index] = sort(distance_matrix(:));
    sorted_index = sorted_index(1:points_number);
    x_index = mod(sorted_index,X_blocks); x_index(x_index==0) = X_blocks;
    y_index = floor((sorted_index-1)/X_blocks); y_index = y_index+1;
    x_length=length(x_index);
    
    %% the distances to the target node will be set here by equation
    %           *** h = ( h_x ^ 2 +  k * h_y ^ 2 ) ^ (1/2) ***
    for ii=1:x_length
        PorosityOfSelectedPoints(ii) = Plane(x_index(ii),y_index(ii));
        H(ii) = ((x_index(ii)-kriging_point_index(1))^2+ k * (y_index(ii)-kriging_point_index(2))^2)^.5;
    end
    for jj=1:x_length
        for kk=1:x_length
            h(jj,kk) = ((x_index(jj)-x_index(kk))^2 +  k * (y_index(jj)-y_index(kk))^2)^.5;
        end
    end    
    
    %% calculations of the kriging
    kriging_matrix = sigma(h);
    kriging_vector = sigma(H);
    kriging_matrix = [kriging_matrix ones(points_number,1);[ones(1,points_number),0]];
    kriging_vector = [kriging_vector;1];
    weghits_vector = kriging_matrix^-1 * kriging_vector;
    landa = weghits_vector(1:points_number);
    mu = weghits_vector(end);
    
    %% using the CDF for our estimation
    Gaussian_mean = PorosityOfSelectedPoints * landa;
    variance = kriging_matrix(1,1);
    OK_variance = variance-sum(kriging_vector(1:end-1).*landa)-mu;
    Fz = rand(1);
    Z = -sqrt(2) * erfinv (1-2*Fz);
    condition_number = get(handles.SGS,'value');
    switch condition_number
        case 1
            simulated_point_porosity = (OK_variance)^.5*Z+Gaussian_mean;
        case 0
            simulated_point_porosity = PorosityOfSelectedPoints * landa;
    end
    %% assigning the calculated porosity to our grids
    Plane(kriging_point_index(1),kriging_point_index(2)) = simulated_point_porosity;
    uncertainty(kriging_point_index(1),kriging_point_index(2))=OK_variance;
end
x=[1:X_blocks];y=[1:Y_blocks];
[X Y]=meshgrid(x,y);
axes(handles.axes1)
surf(X,Y,Plane')
view(0,90)
xlim([1 X_blocks]);ylim([1 Y_blocks]);
xlabel('X direction');ylabel('Y direction');title(' Sequential Gaussian Simulation for Porosity');
colorbar
hold off;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function nugget_text_Callback(hObject, eventdata, handles)
% hObject    handle to nugget_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nugget_text as text
%        str2double(get(hObject,'String')) returns contents of nugget_text as a double


% --- Executes during object creation, after setting all properties.
function nugget_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nugget_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sill_text_Callback(hObject, eventdata, handles)
% hObject    handle to sill_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sill_text as text
%        str2double(get(hObject,'String')) returns contents of sill_text as a double


% --- Executes during object creation, after setting all properties.
function sill_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sill_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function R_x_text_Callback(hObject, eventdata, handles)
% hObject    handle to R_x_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R_x_text as text
%        str2double(get(hObject,'String')) returns contents of R_x_text as a double


% --- Executes during object creation, after setting all properties.
function R_x_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R_x_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function R_y_text_Callback(hObject, eventdata, handles)
% hObject    handle to R_y_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R_y_text as text
%        str2double(get(hObject,'String')) returns contents of R_y_text as a double


% --- Executes during object creation, after setting all properties.
function R_y_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R_y_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X Y Plane
surf(X,Y,Plane');xlabel('X direction');ylabel('Y direction');zlabel('Porosity');
view(-106,35);
colorbar


function size_grid_Callback(hObject, eventdata, handles)
% hObject    handle to size_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size_grid as text
%        str2double(get(hObject,'String')) returns contents of size_grid as a double


% --- Executes during object creation, after setting all properties.
function size_grid_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size_grid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in UItable.
function UItable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to UItable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected cell(s) is changed in UItable.
function UItable_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to UItable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function UItable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UItable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in SGS.
function SGS_Callback(hObject, eventdata, handles)
% hObject    handle to SGS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.SGS,'value',1);set(handles.kriging,'value',0);
% Hint: get(hObject,'Value') returns toggle state of SGS


% --- Executes on button press in kriging.
function kriging_Callback(hObject, eventdata, handles)
% hObject    handle to kriging (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.SGS,'value',0);set(handles.kriging,'value',1);
% Hint: get(hObject,'Value') returns toggle state of kriging


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global uncertainty X Y X_blocks Y_blocks
axes(handles.axes1)
surf(X,Y,uncertainty');view(0,90);
xlim([1 X_blocks]);ylim([1 Y_blocks]);
xlabel('X direction');ylabel('Y direction');title(' Uncertainty of each point ');
colorbar
hold off;
