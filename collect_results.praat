# collect personal information of subject, collect results of test,
# combine into one table and save

beginPause: "Dotazník k testu -- váš vztah k hudbě 1/3"
    comment: "Jméno (nebo přezdívka):"
    sentence: "jmen", ""
    comment: "Věk:"
    natural: "vek", 18
    comment: "VŠ jazykového zaměření?"
    choice: "vs_jaz", 1
        option: "ne"
        option: "mezinárodní vztahy, teritoriální studia apod."
        option: "filologie"
        option: "lingvistika"
        option: "fonetika"
    comment: "Hudební vzdělání (vyberte možnost nejníže v seznamu, která pro vás ještě platí):"
    choice: "vzdel", 1
        option: "žádné"
        option: "soukromé lekce"
        option: "ZUŠ"
        option: "konzervatoř"
        option: "VŠ/VOŠ"
    comment: "Délka hudebního vzdělání (roky):"
    integer: "del_vzdel", 0
clicked = endPause: "Zrušit", "Potvrdit", 2, 1

assert clicked = 2

# appendInfoLine: jmen$
# appendInfoLine: vek
# appendInfoLine: vzdel
# appendInfoLine: del_vzdel

beginPause: "Dotazník k testu -- váš vztah k hudbě 2/3"
    comment: "Působení v hudebním tělese (sbor, orchestr, kapela):"
    choice: "hud_tel", 2
        option: "ano"
        option: "ne"
    comment: "Poslech hudby (kulisa = pasivní; sledování skladby = aktivní):"
    choice: "posl", 1
        option: "převážně pasivní"
        option: "i aktivní"
    comment: "Hudební aktivita v současnosti:"
    choice: "hud_akt", 2
        option: "ano"
        option: "ne"
    comment: "Tanec:"
    choice: "tanec", 1
        option: "vůbec"
        option: "příležitostně"
        option: "pravidelně"
        option: "profesionálně"
clicked = endPause: "Zrušit", "Potvrdit", 2, 1

assert clicked = 2

# appendInfoLine: hud_tel
# appendInfoLine: posl
# appendInfoLine: hud_akt
# appendInfoLine: tanec

beginPause: "Dotazník k testu -- váš vztah k hudbě 3/3"
    comment: "Aktivní pravidelná hra (dříve či aktuálně) na:"
    comment: "strunné nástroje:"
    choice: "strun", 2
        option: "ano"
        option: "ne"
    comment: "klávesové nástroje:"
    choice: "klav", 2
        option: "ano"
        option: "ne"
    comment: "dechové nástroje:"
    choice: "dech", 2
        option: "ano"
        option: "ne"
    comment: "perkusivní nástroje:"
    choice: "perk", 2
        option: "ano"
        option: "ne"
clicked = endPause: "Zrušit", "Potvrdit", 2, 1

assert clicked = 2

# appendInfoLine: strun
# appendInfoLine: klav
# appendInfoLine: dech
# appendInfoLine: perk

select all
Extract results
Collect to Table
Set column label (label): "subject", "task"
Append column: "jmen"
Append column: "vek"
Append column: "vzdel"
Append column: "del_vzdel"
Append column: "hud_tel"
Append column: "posl"
Append column: "hud_akt"
Append column: "tanec"
Append column: "strun"
Append column: "klav"
Append column: "dech"
Append column: "perk"
Append column: "vs_jaz"

total = Get number of rows
for i from 1 to total
    Set string value: i, "jmen", jmen$
    Set numeric value: i, "vek", vek
    @vzdel_proc: vzdel
    Set string value: i, "vzdel", vzdel_proc.string$
    Set numeric value: i, "del_vzdel", del_vzdel
    @ano_ne: hud_tel
    Set string value: i, "hud_tel", ano_ne.string$
    @pas_akt: posl
    Set string value: i, "posl", pas_akt.string$
    @ano_ne: hud_akt
    Set string value: i, "hud_akt", ano_ne.string$
    @tanec_proc: tanec
    Set string value: i, "tanec", tanec_proc.string$
    @ano_ne:  strun
    Set string value: i, "strun", ano_ne.string$
    @ano_ne: klav
    Set string value: i, "klav", ano_ne.string$
    @ano_ne: dech
    Set string value: i, "dech", ano_ne.string$
    @ano_ne: perk
    Set string value: i, "perk", ano_ne.string$
    @vs_jaz_proc: vs_jaz
    Set string value: i, "vs_jaz", vs_jaz_proc.string$
endfor

basename$ = jmen$ + "_" + replace_regex$(date$(), "[: ]", "_", 0)
filename$ = "./results/" + basename$ + ".csv"
idx = 1
while fileReadable(filename$)
    filename$ = basename$ + string$(idx) + ".csv"
    idx = idx + 1
endwhile

Save as tab-separated file: filename$

########## SUBROUTINES

procedure ano_ne: int
    if int = 1
        .string$ = "ano"
    elsif int = 2
        .string$ = "ne"
    endif
endproc

procedure pas_akt: int
    if int = 1
        .string$ = "pas"
    elsif int = 2
        .string$ = "akt"
    endif
endproc

procedure vzdel_proc: int
    if int = 1
        .string$ = "zadne"
    elsif int = 2
        .string$ = "soukrlek"
    elsif int = 3
        .string$ = "zus"
    elsif int = 4
        .string$ = "konz"
    elsif int = 5
        .string$ = "vs/vos"
    endif
endproc

procedure tanec_proc: int
    if int = 1
        .string$ = "vubec"
    elsif int = 2
        .string$ = "prilez"
    elsif int = 3
        .string$ = "pravid"
    elsif int = 4
        .string$ = "profes"
    endif
endproc

procedure vs_jaz_proc: int
    if int = 1
        .string$ = "ne"
    elsif int = 2
        .string$ = "mzv"
    elsif int = 3
        .string$ = "filog"
    elsif int = 4
        .string$ = "ling" 
    elsif int = 5
        .string$ = "fon"
    endif
endproc