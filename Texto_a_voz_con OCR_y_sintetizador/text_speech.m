% MATLAB code 
% Program to do text to speech.
% Get user's sentence
% userPrompt = '¿qué quieres decir?';
% titleBar = 'Text to Speech';
% defaultString = '¡Es un animal grande!';
% caUserInput = inputdlg(userPrompt, titleBar, 1, {defaultString});
% if isempty(caUserInput)
%   return;
% end; % Bail out if they clicked Cancel.
word = ocr(imread('frase.jpg'));
palabras =word.Words;

for i = 1:length(palabras)
caUserInput = palabras(i);

caUserInput = char(caUserInput); % Convert from cell to string.
NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Volume = 100;
Speak(obj, caUserInput);
end