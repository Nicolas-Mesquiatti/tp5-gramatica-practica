/*
sustantivo(empleado, masculino, singular).
sustantivo(empleada, femenino, singular).
sustantivo(sueldos, masculino, plural).
sustantivo(sueldo, masculino, singular).

verbo(trabaja, singular).
verbo(trabajan, plural).
verbo(cobra, singular).
verbo(cobran, plural). */


o(o(SN,SV)) --> sn(SN,_Gen,Num), sv(SV,Num). %Una oracion está formada por un SN y un SV que deben concordar en número.
sn(sn(DET,N),Gen,Num) --> det(DET,Gen,Num), n(N,Gen,Num). %Un SN tiene un determinante y un nombre con el mismo género y número.
sv(sv(VT,SN),Num) --> vt(VT,Num), sn(SN,_Gen,_Num). %Un SV tiene un verbo transitivo y un SN que concuerdan en número.
sv(sv(VI),Num) --> vi(VI,Num). %Un SV puede tener un verbo intransitivo que concuerda en número.
det(det(X),f,sg) --> [X], {member(X,[la,una])}. %Un determinante femenino singular puede ser "la" o "una".
det(det(X),f,pl) --> [X], {member(X,[las,unas])}. %Un determinante femenino plural puede ser "las" o "unas".
det(det(X),m,sg) --> [X], {member(X,[el,un])}. %Un determinante masculino singular puede ser "el" o "un".
det(det(X),m,pl) --> [X], {member(X,[los,unos])}. %Un determinante masculino plural puede ser "los" o "unos".
vi(vi(trabaja),sg) --> [trabaja]. %Un verbo intransitivo singular puede ser "trabaja".
vi(vi(trabajan),pl) --> [trabajan]. %Un verbo intransitivo plural puede ser "trabajan".
vt(vt(cobra),sg) --> [cobra]. %Un verbo transitivo singular puede ser "cobra".
vt(vt(cobran),pl) --> [cobran]. %Un verbo transitivo plural puede ser "cobran".
n(n(empleada),f,sg) --> [empleada]. %Un nombre femenino singular puede ser "empleada".
n(n(empleadas),f,pl) --> [empleadas]. %Un nombre femenino plural puede ser "empleadas".
n(n(X),m,sg) --> [X], {member(X,[empleado,sueldo])}. %Un nombre masculino singular puede ser "empleado" o "sueldo".
n(n(X),m,pl) --> [X], {member(X,[empleados,sueldos])}. %Un nombre masculino plural puede ser "empleados" o "sueldos".

/*                      o
                 _______|_______
                |               |
               sn              sv
           ____|____        ____|____
          |         |      |         |
        det         n     vt        sn
        |           |      |       __|___
       la       empleada  cobra  det     n
                                 |       |
                                un    sueldo
*/


%phrase(o(_), [los, empleados, trabajan, los,  sueldos]). 
%phrase(o(_), [la, empleada, cobra, el, sueldo]).
%phrase(o(_), [las, empleadas, trabajan, los, sueldos]).
%phrase(o(_), [un, empleado, cobra, un, sueldo]).

/* Explicacion: La oración completa se divide en dos partes: SN (sujeto) y SV (predicado).

El SN está formado por un determinante y un sustantivo, que deben tener el mismo género y número.

El SV puede ser:

un verbo intransitivo (ej. "trabaja"),

o un verbo transitivo seguido de otro SN (ej. "cobra un sueldo").

La concordancia en número entre SN y SV es obligatoria. /*