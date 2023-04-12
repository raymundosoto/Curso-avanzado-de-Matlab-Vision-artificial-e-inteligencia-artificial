%% Encabezado
clear all
close all
clc

%% Lectura  y visualización de imagen
img = imread('palabras.jpg');
figure(1)
imshow(img)

%% Reconocimiento optico de caracteres
ocr_words = ocr(img);
ocr_words.Text; % TExto reconocido

% Extracción de bounding box
bbox = ocr_words.WordBoundingBoxes;

%Dibujado del bounding box 
hold on
for i=1:length(bbox)
    rectangle('Position',bbox(i,:), 'EdgeColor','g', LineWidth=5)
end
hold off

%% Guardado de imagen

imwrite(img, 'texto_reconocido.jpg')

