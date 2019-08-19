function varargout = untitled2(varargin)
% UNTITLED2 MATLAB code for untitled2.fig
%      UNTITLED2, by itself, creates a new UNTITLED2 or raises the existing
%      singleton*.
%
%      H = UNTITLED2 returns the handle to a new UNTITLED2 or the handle to
%      the existing singleton*.
%
%      UNTITLED2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED2.M with the given input arguments.
%
%      UNTITLED2('Property','Value',...) creates a new UNTITLED2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled2

% Last Modified by GUIDE v2.5 04-Jun-2013 22:39:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled2_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled2_OutputFcn, ...
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


% --- Executes just before untitled2 is made visible.
function untitled2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled2 (see VARARGIN)

% Choose default command line output for untitled2

image(imread('Bild2.jpg'));

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Create_FEM.




function start_x_edit_Callback(hObject, eventdata, handles)
% hObject    handle to start_x_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of start_x_edit as text
%        str2double(get(hObject,'String')) returns contents of start_x_edit as a double


% --- Executes during object creation, after setting all properties.
function start_x_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to start_x_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function end_x_edit_Callback(hObject, eventdata, handles)
% hObject    handle to end_x_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of end_x_edit as text
%        str2double(get(hObject,'String')) returns contents of end_x_edit as a double


% --- Executes during object creation, after setting all properties.
function end_x_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to end_x_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function end_t_edit_Callback(hObject, eventdata, handles)
% hObject    handle to end_t_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of end_t_edit as text
%        str2double(get(hObject,'String')) returns contents of end_t_edit as a double


% --- Executes during object creation, after setting all properties.
function end_t_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to end_t_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in x_space_list.
function x_space_list_Callback(hObject, eventdata, handles)
% hObject    handle to x_space_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns x_space_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from x_space_list
val = get(hObject, 'value');
str = get(hObject, 'string');
switch str{val}
    case 'x_steg'
        image(imread('Bild_tid'));
    case '1'
        handles.N= 1;
    case '2' 
        handles.N= 2;
    case '4'
        handles.N= 4;
    case '5'
        handles.N= 5;
    case '10'
        handles.N= 10;
    case '20'
        handles.N= 20;
    case '50'
        handles.N= 50;
    case '100'
        handles.N= 100;
    case '200'
        handles.N= 200;
    case '500'
        handles.N= 500;
    case '1000'
        handles.N= 1000;
    
end
 clear val
 clear str

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function x_space_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_space_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in t_space_list.
function t_space_list_Callback(hObject, eventdata, handles)
% hObject    handle to t_space_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns t_space_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from t_space_list
val = get(hObject, 'value');
str = get(hObject, 'string');
switch str{val}
    case 't_space_List'
        image(imread('Bild_tid'));
    case '2'
        handles.t= 2;
    case '4' 
        handles.t= 4;
    case '5'
        handles.t= 5;
    case '10'
        handles.t= 10;
    case '20'
        handles.t= 20;
    case '50'
        handles.t= 50;
    case '100'
        handles.t= 100;
    case '200'
        handles.t= 200;
    case '500'
        handles.t= 500;
    case '1000'
        handles.t= 1000;
    case '1000'
        handles.N= 1000;
    
end
 clear val
 clear str

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function t_space_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_space_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
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


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5
val = get(hObject, 'value');
str = get(hObject, 'string');
switch str{val}
    case 'Annat'
        % syms talar om att det är en symbålisk funktion med avsend
        % på x och t som skapas av komandot sym som konverterar från string till symbol 
        % matlabFunction skapar ett funktions hantag av in datan    
        % som kommer ifrån text lådan för f(x,t)
        
        syms x t                                                                
        f_edit = matlabFunction(sym(get(handles.edit5,'string')));
        handles.f=f_edit;
        
    case '1'
        handles.f= @(x,t)1;
    case 'pi' 
        handles.f= @(x,t)pi;
    case '10'
        handles.f= @(x,t)10;
    case '100'
        handles.f= @(x,t)100;
    case 'x'
        handles.f= @(x,t)x;
    case 't'
        handles.f= @(x,t)t;
    case 'x^2'
        handles.f= @(x,t)x^2;
    case 'x*t'
        handles.f= @(x,t)x*t;
    case 'x*e^(-t)'
        handles.f= @(x,t)x*exp(-t);
    case 'sin(x)'
        handles.f= @(x,t)sin(x);
    case 'cos(x)'
        handles.f= @(x,t)cos(x);
    case 'sin(x)*cos(t)'
        handles.f= @(x,t)sin(x)*cos(t);
end
 clear val
 clear str

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4

val = get(hObject, 'value');
str = get(hObject, 'string');
switch str{val}
    case 'Annat'
        % syms talar om att det är en symbålisk funktion med avsend
        % på x och t som skapas av komandot sym som konverterar från string till symbol 
        % matlabFunction skapar ett funktions hantag av in datan    
        % som kommer ifrån text lådan för f(x,t)
        
        syms x t                                                                
        C_edit = matlabFunction(sym(get(handles.edit4,'string')));
        handles.C=C_edit;
        handles.val_C='funktion';
        
    case '1'
        handles.C= 1;
         
    case 'pi' 
        handles.C= pi;
        
    case '10'
        handles.C= 10;
        
    case '100'
        handles.C= 100;
        
    case 'x'
        handles.C= @(x)x;
        
    case 't'
        handles.C= @(x)x;
        
    case 'x^2'
        handles.C= @(x)x^2;
        
    case 'x*t'
        handles.C= @(x)x*x;
        
    case 'x*e^(-t)'
        handles.C= @(x)x*exp(-x);
        
    case 'sin(x)'
        handles.C= @(x)sin(x);
        
    case 'cos(x)'
        handles.C= @(x)cos(x);
        
    case 'sin(x)*cos(t)'
        
        
end
 

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
val = get(hObject, 'value');
str = get(hObject, 'string');

switch str{val}
    case 'Annat'
        % syms talar om att det är en symbålisk funktion med avsend
        % på x och t som skapas av komandot sym som konverterar från string till symbol 
        % matlabFunction skapar ett funktions hantag av in datan    
        % som kommer ifrån text lådan för f(x,t)
        handles.val_A='funktion';
        syms x t                                                                
        A_edit = matlabFunction(sym(get(handles.edit1,'string')));
        handles.A=A_edit;
        
    case '1'
        handles.A= 1;
        
    case 'pi' 
        handles.A=pi;
        
    case '10'
        handles.A= 10;
        
    case '100'
        handles.A= 100;
        
    case 'x'
        handles.A= @(x,t)x;
        
    case 't'
        handles.A= @(x,t)t;
        
    case 'x^2'
        handles.A= @(x,t)x^2;
        
    case 'x*t'
        handles.A= @(x,t)x*t;
        
    case 'x*e^(-t)'
        handles.A= @(x,t)x*exp(-t);
        
    case 'sin(x)'
        handles.A= @(x,t)sin(x);
        
    case 'cos(x)'
        handles.A= @(x,t)cos(x);
        
    case 'sin(x)*cos(t)'
        handles.A= @(x,t)sin(x)*cos(t);
        
end
 clear val
 clear str

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on selection change in gamma_list.
function gamma_list_Callback(hObject, eventdata, handles)
% hObject    handle to gamma_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns gamma_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from gamma_list
val = get(hObject, 'value');
str = get(hObject, 'string');
switch str{val}
        
    case 'Gamma'
        image(imread('Bild_gamma'));
    case '1' 
        handles.gamma= @(x)1;
    case '2'
        handles.gamma= @(x)2;
    case '5'
        handles.gamma= @(x)5;
    case '10'
        handles.gamma= @(x)10;
    case '50'
        handles.gamma= @(x)50;
    case '100'
        handles.gamma= @(x)100;
    case '1000'
        handles.gamma= @(x)1000;
   
end

 clear val
 clear str

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function gamma_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in G_D_list.
function G_D_list_Callback(hObject, eventdata, handles)
% hObject    handle to G_D_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns G_D_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from G_D_list
val = get(hObject, 'value');
str = get(hObject, 'string');
switch str{val}
        
    case 'G_D'
        image(imread('Bild_G_D'));
    case '1' 
        handles.G_D = @(x)1;
    case '10'
        handles.G_D = @(x)10;
    case 'x'
        handles.G_D = @(x)x;
    case 'x^2'
        handles.G_D = @(x)x^2;
    case 'sin(x)'
        handles.G_D= @(x)sin(x);
    case 'cos(x)'
        handles.G_D= @(x)cos(x);
   
end
 clear val
 clear str

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function G_D_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to G_D_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in G_N_list.
function G_N_list_Callback(hObject, eventdata, handles)
% hObject    handle to G_N_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns G_N_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from G_N_list
val = get(hObject, 'value');
str = get(hObject, 'string');
switch str{val}
        
    case 'G_N'
        image(imread('Bild_G_N'));
    case '1' 
        handles.G_N = @(x)1;
    case '10'
        handles.G_N = @(x)10;
    case 'x'
        handles.G_N = @(x)x;
    case 'x^2'
        handles.G_N = @(x)x^2;
    case 'x^3'
        handles.G_N = @(x)x^3;
    case 'sin(x)'
        handles.G_N= @(x)sin(x);
    case 'cos(x)'
        handles.G_N= @(x)cos(x);
   
end
 clear val
 clear str

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function G_N_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to G_N_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Create_FEM_Callback(hObject, eventdata, handles)
% hObject    handle to Create_FEM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

                                                                       
        rve{1} = handles.gamma;                                           
        rve{2} = handles.G_D;                                                               
        rve{3} = handles.G_N;
        rve
        Tstring = get(handles.end_t_edit,'string');
        T = str2num(Tstring);
        
        Xstart = get(handles.start_x_edit,'string');
        xstart = str2num(Xstart);
        
        Xend = get(handles.end_x_edit,'string');
        xend = str2num(Xend);
        
        N = handles.N;
        L = handles.t;
        p = linspace(xstart,xend,N);
        
        f = handles.f;
        A = handles.A;
        C = handles.C;
        
        

U = FEM_1D_tid(A,C,f,rve,p,L,T,'konstant','konstant')
handles.U = U;

% --- Executes during object creation, after setting all properties.
function Create_FEM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Create_FEM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in Create_movie_button.
function Create_movie_button_Callback(hObject, eventdata, handles)
% hObject    handle to Create_movie_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
U = handles.U;
L = handles.L;
z = zeros(length(U(:,1)));
for k=1:L
    z=U(:,k);
    set(h,'Ydata',z);
    handles.W(k) = getframe;
    
end


% --- Executes on button press in Play_button.
function Play_button_Callback(hObject, eventdata, handles)
% hObject    handle to Play_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
W = handles.W;
Movie(W);


% --- Executes on button press in Surf_button.
function Surf_button_Callback(hObject, eventdata, handles)
% hObject    handle to Surf_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


surf(handles.p,handles.t,handles.U)

% --- Executes on button press in Mesh_button.
function Mesh_button_Callback(hObject, eventdata, handles)
% hObject    handle to Mesh_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
U = handles.U;
p = handles.p;
t = handles.t;
mesh(p,t,U)


