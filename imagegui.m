function varargout = imagegui(varargin)
% IMAGEGUI MATLAB code for imagegui.fig
%      IMAGEGUI, by itself, creates a new IMAGEGUI or raises the existing
%      singleton*.
%
%      H = IMAGEGUI returns the handle to a new IMAGEGUI or the handle to
%      the existing singleton*.
%
%      IMAGEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEGUI.M with the given input arguments.
%
%      IMAGEGUI('Property','Value',...) creates a new IMAGEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imagegui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imagegui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imagegui

% Last Modified by GUIDE v2.5 08-Dec-2020 23:45:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imagegui_OpeningFcn, ...
                   'gui_OutputFcn',  @imagegui_OutputFcn, ...
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


% --- Executes just before imagegui is made visible.
function imagegui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imagegui (see VARARGIN)

% Choose default command line output for imagegui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imagegui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imagegui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function thresholding_Callback(hObject, eventdata, handles)
% hObject    handle to thresholding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

temp=handles.c;
b=get(hObject,'value');
temp = temp>=b;
d=num2str(b);
set(handles.threshold_value,'String',d);
axes(handles.axes2); %swtich current handle to axes2

imshow(temp);
% Update handles structure
handles.b=temp; %save the temporary changes
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function thresholding_CreateFcn(hObject, eventdata, handles)
% hObject    handle to thresholding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 %This code checks if the user pressed cancel on the dialog.
 
    [filename, pathname] = uigetfile('*.jpg', 'Pick an Image file');
    if isequal(filename,0) || isequal(pathname,0)
       disp('User pressed cancel')
    else
       disp(['User selected ', fullfile(pathname, filename)])
       a=imread(fullfile(pathname, filename));
       
       axes(handles.axes1);
       imshow(a);
        a=rgb2gray(a);
        [rows,columns]=size(a);
        
       a=imresize(a,0.15);
      [newrows,newcolumns]=size(a);
       
       handles.a=a;%copy used to display the original image 
       handles.b=a;%copy used for temporary changes
       handles.c=a;%copy used for saving changes 
       %save the dimensions of the image 
       disp(rows);
       disp(newrows);
       handles.rows=rows;
       handles.columns=columns;
       handles.newrows=newrows;
       handles.newcolumns=newcolumns;
       axes(handles.axes2);
       imshow(a);
       
       %store other relevant information
       handles.erasermsgcount=0;
    end
%clean up text field 
%clean up text fields
set(handles.finalLength,'String','');
% Update handles structure

guidata(hObject, handles);



function threshold_value_Callback(hObject, eventdata, handles)
% hObject    handle to threshold_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of threshold_value as text
%        str2double(get(hObject,'String')) returns contents of threshold_value as a double
edit=get(hObject,'string');
set(handles.thresholding,'value',str2num(edit));
thresholding_Callback(handles.thresholding, [], handles);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function threshold_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to threshold_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in savebutton.
function savebutton_Callback(hObject, eventdata, handles)
% hObject    handle to savebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, foldername] = uiputfile('Where do you want the file saved?');
complete_name = fullfile(foldername, filename);
c=handles.c;
imwrite(c, complete_name);
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in brighten_image.
function brighten_image_Callback(hObject, eventdata, handles)
% hObject    handle to brighten_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

temp=handles.b;
% temp=imlocalbrighten(temp);
temp=adapthisteq(temp);
axes(handles.axes2);
imshow(temp);
handles.b=temp;
guidata(hObject, handles);


% --- Executes on button press in reset_button.
function reset_button_Callback(hObject, eventdata, handles)
% hObject    handle to reset_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.c=handles.a;
handles.b=handles.a;
axes(handles.axes2);
imshow(handles.c);

%clean up text fields
set(handles.finalLength,'String','');

guidata(hObject, handles);


% --- Executes on button press in background_subraction.
function background_subraction_Callback(hObject, eventdata, handles)
% hObject    handle to background_subraction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
b=handles.b;
imwrite(b,"temp.png",'png');
temp=background_subtraction('temp.png',1,false,false,false);
waitfor(msgbox('Operation Completed','Success'));
axes(handles.axes2);
imshow(temp);
handles.b=temp;
guidata(hObject, handles);
delete("temp.png");


% --- Executes on button press in detectCell.
function detectCell_Callback(hObject, eventdata, handles)
% hObject    handle to detectCell (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
b=handles.b;
k=get(handles.component_number,'String');%get the k value from the text box
k=str2num(k);%convert to a number
tempLargest=getLargestComponents(b,k,1);
disp(tempLargest);
size(tempLargest)
axes(handles.axes2);
grayoverlay(a,tempLargest);
handles.preview=tempLargest;
guidata(hObject, handles);


% --- Executes on button press in confirm.
function confirm_Callback(hObject, eventdata, handles)
% hObject    handle to confirm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.c=handles.b;
waitfor(msgbox('Changes saved. You can now move on to image thresholding','Success'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function brighten_image_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brighten_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function component_number_Callback(hObject, eventdata, handles)
% hObject    handle to component_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of component_number as text
%        str2double(get(hObject,'String')) returns contents of component_number as a double
% edit=get(hObject,'string');
% set(handles.detectCell,'value',str2num(edit));
% previewLargest_Callback(handles.detectCell, [], handles);
% guidata(hObject,handles);




% --- Executes during object creation, after setting all properties.
function component_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to component_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reportLength.
function reportLength_Callback(hObject, eventdata, handles)
% hObject    handle to reportLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

message1="Calculating cell length...";
set(handles.finalLength,'String',message1);
drawnow;%display text immediately 
cellbody=handles.preview; %retrieve the binary image of the cell body 
cell_cc=buildCC2D(cellbody);%build the cell complex for thinning 
thin_result=thin2D(cell_cc,20,0.8); %perform 2D thinning on the cell complex with the specified parameters. 
cell_length=(size(thin_result{1},2)*(handles.rows/handles.newrows))/3.06; %NOTE: NEED TO COME BACK AND FIX ratio 
disp(cell_length);
final_length=num2str(cell_length);
% plotCC2(thin_result);
message2=strcat("The length of the sperm cell is: ",final_length, " mm");
set(handles.finalLength,'String',message2);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function finalLength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to finalLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in eraser.
function eraser_Callback(hObject, eventdata, handles)
% hObject    handle to eraser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(handles.erasermsgcount==0)
    waitfor(msgbox('Use the draggable rectangle to blacken out part of the image.Once finished,double click to move on')); 
    handles.erasermsgcount=handles.erasermsgcount+1;
end 
    

temp=handles.b;
% figure;
axes(handles.axes2);
imshow(temp);
while true 
    H=imrect(gca);
    pos=wait(H);
    % close all
%     pos=cast(pos,'uint8');
    disp(pos)
    
    %check bounds 
    height=handles.newrows;
    width=handles.newcolumns;
    
    if(pos(1,2)<0||pos(1,2)>height||pos(1,2)+pos(1,4)>height||pos(1,2)+pos(1,4)<0||pos(1,1)<0||pos(1,1)>width||pos(1,1)+pos(1,3)>width||pos(1,1)+pos(1,3)<0)
     msgbox('Out of bound error, please press the eraser button again to restart','Error','error');
        break
    end
    
    
    temp(pos(1,2):pos(1,2)+pos(1,4),pos(1,1):pos(1,1)+pos(1,3))=0;
    imshow(temp);
    loop = inputdlg('Continue? (1/0) : '); % 1 to continue 0 to break loop
    user_val = str2num(loop{1});
   
    if user_val ==0
        break
    else 
        continue 
    end 
    
end 
size(temp)
 handles.b=temp;
guidata(hObject,handles);
