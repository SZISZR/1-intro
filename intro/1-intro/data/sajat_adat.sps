SET DECIMAL=DOT.

DATA LIST FILE= "data/sajat_adat.sav"  free (",")
ENCODING="Locale"
/ id szul_ido * telepules_kat (F8.0) havi_jov 
  .

VARIABLE LABELS
id "id" 
 szul_ido "szul_ido" 
 telepules_kat "telepules_kat" 
 havi_jov "havi_jov" 
 .

VALUE LABELS
/
telepules_kat 
1 "Község" 
 2 "Város" 
.
VARIABLE LEVEL id, szul_ido, havi_jov 
 (scale).

EXECUTE.
