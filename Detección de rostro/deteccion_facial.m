
%% Encabezado del script
clc
close all

%% Lectura de la lista de webcams disponibles
webcamlist();
%% Uso de la webcam
cam = webcam(1);

%% Creacción del objeto detector de rostros
faceDetector = vision.CascadeObjectDetector();

%% Ciclo infinito para captura de imagen de la wecam y detección de rostro
while true
    % Captura de imagen
    img = snapshot(cam);
    % Extraccion de coordenadas del rostro
    bbox = step(faceDetector, img);
    % dibujar rectangulo
    img = insertShape(img, "Rectangle", bbox, "Color","green", 'LineWidth',5);
    img = insertObjectAnnotation(img,'rectangle',bbox,'Rostro');
    % Visulizacion del rectangulo
    figure(1)
    imshow(img)

end