
FS=44100;

load('notas_guitarra')
g=notas_guitarra;

disp('Presiona cualquier tecla para hacer sonar un acorte')
pause

notasDO=[g(5,4) g(4,3) g(3,1) g(2,2) g(1,1)];
DO=acorde(notasDO,3.5,FS);
soundsc(DO,FS)
disp('Eso fue un DO')
disp('Pulsa una vez mas')

pause

notasRE=[g(4,1) g(3,3) g(2,4) g(1,3)];
RE=acorde(notasRE,3.5,FS);
soundsc(RE,FS)
disp('Eso fue un RE')
disp('Y una ultima vez')

pause

notasMI=[g(6,1) g(5,3) g(4,3) g(3,2) g(2,1) g(1,1)];
MI=acorde(notasMI,3.5,FS);
soundsc(MI,FS)
disp('Y por ultimo eso fue un MI')


