--Aufgabe 1:
select * from SCHUELER
where S_K_KLASSE like '03TA';

--Aufgabe 2:
select L_VORNAME, L_NAME, L_GEHALT from LEHRER
where L_GEHALT between 220 and 400
and L_GEBDAT < '1955-01-01';

--Aufgabe 3:
select P_S_KANDIDAT, P_L_PRUEFER, P_DATUM, P_NOTE from PRUEFUNGEN
where P_L_PRUEFER in ('HA', 'BE', 'SG', 'MI');

--Aufgabe 4:
select distinct ST_K_KLASSE, ST_L_LEHRER, ST_G_FACH from STUNDENPLAN
where ST_K_KLASSE in ('03TA', '03TB')
and ST_STUNDE like 'DO%' or ST_STUNDE like 'FR%';

--Aufgabe 5:
select * from LEHRER
order by L_GEHALT DESC,
         L_NAME,
         L_VORNAME;

--Aufgabe 6:
select S.ST_K_KLASSE, ST_G_FACH, L.L_VORNAME, L.L_NAME, S.ST_STUNDE from STUNDENPLAN S
    join LEHRER L on S.ST_L_LEHRER = L.L_ID
where S.ST_K_KLASSE like '03TA';

--Aufgabe 7:
select  S.S_NAME, S.S_VORNAME, L.L_NAME, L.L_VORNAME, P.P_NOTE from PRUEFUNGEN P
    join SCHUELER S on S.S_SCHNR = P.P_S_KANDIDAT
    join LEHRER L on L.L_ID = P.P_L_PRUEFER
    join KLASSEN K on K.K_ID = S.S_K_KLASSE
where K.K_L_KLAVST = L.L_ID;

--Aufgabe 8:
select S.S_VORNAME, S.S_NAME,
    case
        when S.S_SCHNR = K.K_S_KLASPR then K.K_ID
    end as K_ID
       from SCHUELER S
    left join KLASSEN K on S.S_K_KLASSE = K.K_ID
order by S.S_NAME,
         S.S_VORNAME;

--Aufgabe 9:
select V.L_VORNAME, V.L_NAME, U.L_VORNAME, U.L_NAME, U.L_GEBDAT from LEHRER U
join LEHRER V on U.L_ID = V.L_ID
where U.L_L_CHEF in ('HA', 'BI', 'BE', 'B1');
