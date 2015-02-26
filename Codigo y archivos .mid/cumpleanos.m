%frecuencias fundamentales
do3=261.626;
re3=293.665;
mi3=329.628;
fa3=349.228;
sol3=391.995;
la3=440;
si3=493.883;

reb3=277.183;
solb3=369.994;
lab3=415.305;
sib3=466.164;

%tiempo de un pulso (ms)
tiempo_pulso=650;

%lista notas cumpleaños feliz
notas_cumple=[do3 do3 re3 do3 fa3 mi3 do3 do3 re3 do3 sol3 fa3 do3 do3 2*do3 la3 fa3 mi3 re3 sib3 sib3 la3 fa3 sol3 fa3];
pulsos=[3/4 1/4 1 1 1 2 3/4 1/4 1 1 1 2 3/4 1/4 1 1 1 1 2 3/4 1/4 1 1 1 2];

tiempo_cancion=sum(tiempo_pulso*pulsos);

tiempo_inicio=0;
for i=1:length(pulsos)-1
    tiempo_inicio=[tiempo_inicio tiempo_pulso*pulsos(i)+tiempo_inicio(i)];
end
tiempo_fin=[tiempo_inicio(1,2:length(tiempo_inicio)) tiempo_cancion];


cancion=track_generator(notas_cumple, tiempo_inicio, tiempo_fin, 44100);

soundsc(cancion,44100)



