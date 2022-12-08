https://learn.microsoft.com/pt-br/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-7.3

Igualdade

-eq, -ieq- -ceq é igual a
-ne, -ine- -cne não é igual a
-gt, -igt- -cgt maior que
-ge, -ige, -cge - maior ou igual
-lt, -ilt, -clt - menos do que
-le, -ile, -cle - menor ou igual

Matching

-like, -ilike– -clike cadeia de caracteres corresponde ao padrão curinga
-notlike, -inotlike, -cnotlike - cadeia de caracteres não corresponde ao padrão curinga
-match, -imatch, -cmatch - cadeia de caracteres corresponde ao padrão regex
-notmatch, -inotmatch, -cnotmatch - cadeia de caracteres não corresponde ao padrão regex

Substituição

-replace, -ireplace- -creplace substitui cadeias de caracteres correspondentes a um padrão regex
Contenção

-contains, -icontains- -ccontains a coleção contém um valor
-notcontains, -inotcontains– -cnotcontains a coleção não contém um valor
-in - o valor está em uma coleção
-notin - o valor não está em uma coleção
Tipo

-is - ambos os objetos são do mesmo tipo
-isnot - os objetos não são do mesmo tipo