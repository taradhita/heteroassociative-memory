%[1 1 0 0; 1 0 0 0; 0 0 1 1; 0 0 0 1]
%[1 0; 1 0; 0 1; 0 1]
function varargout = heteroassociative(varargin)
% HETEROASSOCIATIVE MATLAB code for heteroassociative.fig
%      HETEROASSOCIATIVE, by itself, creates a new HETEROASSOCIATIVE or raises the existing
%      singleton*.
%
%      H = HETEROASSOCIATIVE returns the handle to a new HETEROASSOCIATIVE or the handle to
%      the existing singleton*.
%
%      HETEROASSOCIATIVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HETEROASSOCIATIVE.M with the given input arguments.
%
%      HETEROASSOCIATIVE('Property','Value',...) creates a new HETEROASSOCIATIVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before heteroassociative_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to heteroassociative_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help heteroassociative

% Last Modified by GUIDE v2.5 13-Dec-2018 21:04:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @heteroassociative_OpeningFcn, ...
                   'gui_OutputFcn',  @heteroassociative_OutputFcn, ...
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


% --- Executes just before heteroassociative is made visible.
function heteroassociative_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to heteroassociative (see VARARGIN)

% Choose default command line output for heteroassociative
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes heteroassociative wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = heteroassociative_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editInput_Callback(hObject, eventdata, handles)
% hObject    handle to editInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editInput as text
%        str2double(get(hObject,'String')) returns contents of editInput as a double
global X;
X = get(handles.editInput,'String');
X=str2num(X);

% --- Executes during object creation, after setting all properties.
function editInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editOutput_Callback(hObject, eventdata, handles)
% hObject    handle to editOutput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editOutput as text
%        str2double(get(hObject,'String')) returns contents of editOutput as a double
global T;
T = get(handles.editOutput,'String');
T=str2num(T);

% --- Executes during object creation, after setting all properties.
function editOutput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editOutput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in togglebuttonTrain.
function togglebuttonTrain_Callback(hObject, eventdata, handles)
% hObject    handle to togglebuttonTrain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebuttonTrain
global X;
global T;
global w;
w = zeros(size(X,2), size(T,2));
for i=1:size(X,2)
    w=w+X(i,1:size(X,2))'*T(i,1:size(T,2));
end
w_result = set(handles.edit6,'String',num2str(w));
guidata(hObject, handles);



function editTraining_Callback(hObject, eventdata, handles)
% hObject    handle to editTraining (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTraining as text
%        str2double(get(hObject,'String')) returns contents of editTraining as a double
global X_test;
X_test = get(handles.editTraining,'String');
X_test = str2num(X_test);


% --- Executes during object creation, after setting all properties.
function editTraining_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTraining (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in togglebuttonTest.
function togglebuttonTest_Callback(hObject, eventdata, handles)
% hObject    handle to togglebuttonTest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebuttonTest
global X_test;
global w;
global y_in;
y_in=X_test*w;
y_in_result = set(handles.edit7,'String',num2str(y_in));
for j=1:(size(y_in, 2))
    if (y_in(j)>0)
        y(j)=1;
    else
        y(j)=0;
    end
end
fungsi_aktivasi=set(handles.edit8,'String',num2str(y));
guidata(hObject, handles);



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
