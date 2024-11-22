#Requires -Version 5

<#   
.NOTES     
    Author: Armando Hernández Rodríguez
    Twitter @acts268
    Email: armando.hernandez.rodriguez@hotmail.com
    Last Updated: 11-11-2024

    ## Copyright (c) Technology Music Art.
    #Licensed under the MIT license.

    #Crear Password 20 caracteres.ps1

    #THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    #FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
    #WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

.SYNOPSIS   
    Check last version and documentation at https://github.com/acts268/ScriptCollection/blob/main/Powershell/Security/Crear_Password_20_caracteres.ps1
    
    REQUIRES
        IF want to run as script
            - Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
        
#>

<#
Listado de caracteres ASCII estándar con su código decimal correspondiente:

Código	Carácter	Descripción
33	!	Exclamación
34	"	Comillas dobles
35	#	Almohadilla
36	$	Signo de dólar
37	%	Porcentaje
38	&	Ampersand
39	'	Comilla simple
40	(	Paréntesis izquierdo
41	)	Paréntesis derecho
42	*	Asterisco
43	+	Suma
44	,	Coma
45	-	Menos
46	.	Punto
47	/	Barra diagonal
48	0	Cero
49	1	Uno
50	2	Dos
51	3	Tres
52	4	Cuatro
53	5	Cinco
54	6	Seis
55	7	Siete
56	8	Ocho
57	9	Nueve
58	:	Dos puntos
59	;	Punto y coma
60	<	Menor que
61	=	Igual
62	>	Mayor que
63	?	Interrogación
64	@	Arroba
65	A	Letra A mayúscula
66	B	Letra B mayúscula
67	C	Letra C mayúscula
68	D	Letra D mayúscula
69	E	Letra E mayúscula
70	F	Letra F mayúscula
71	G	Letra G mayúscula
72	H	Letra H mayúscula
73	I	Letra I mayúscula
74	J	Letra J mayúscula
75	K	Letra K mayúscula
76	L	Letra L mayúscula
77	M	Letra M mayúscula
78	N	Letra N mayúscula
79	O	Letra O mayúscula
80	P	Letra P mayúscula
81	Q	Letra Q mayúscula
82	R	Letra R mayúscula
83	S	Letra S mayúscula
84	T	Letra T mayúscula
85	U	Letra U mayúscula
86	V	Letra V mayúscula
87	W	Letra W mayúscula
88	X	Letra X mayúscula
89	Y	Letra Y mayúscula
90	Z	Letra Z mayúscula
91	[	Corchete izquierdo
92	\	Barra inversa
93	]	Corchete derecho
94	^	Acento circunflejo
95	_	Guion bajo
96	`	Acento grave
97	a	Letra a minúscula
98	b	Letra b minúscula
99	c	Letra c minúscula
100	d	Letra d minúscula
101	e	Letra e minúscula
102	f	Letra f minúscula
103	g	Letra g minúscula
104	h	Letra h minúscula
105	i	Letra i minúscula
106	j	Letra j minúscula
107	k	Letra k minúscula
108	l	Letra l minúscula
109	m	Letra m minúscula
110	n	Letra n minúscula
111	o	Letra o minúscula
112	p	Letra p minúscula
113	q	Letra q minúscula
114	r	Letra r minúscula
115	s	Letra s minúscula
116	t	Letra t minúscula
117	u	Letra u minúscula
118	v	Letra v minúscula
119	w	Letra w minúscula
120	x	Letra x minúscula
121	y	Letra y minúscula
122	z	Letra z minúscula
123	{	Llave izquierda
124	|	Barra vertical
125	}	Llave derecha
126	~	Tilde
#>


# Definir los diferentes conjuntos de caracteres
$lower = 97..122    # a-z
$upper = 65..90     # A-Z
$numbers = 48..57   # 0-9
$special = 33..47 + 58..64 + 91..96 + 123..126  # Special characters

# Crear una lista que incluya al menos un carácter de cada conjunto
$passwordChars = @(
    [char](Get-Random -InputObject $lower)
    [char](Get-Random -InputObject $upper)
    [char](Get-Random -InputObject $numbers)
    [char](Get-Random -InputObject $special)
)

# Rellenar el resto de la contraseña con caracteres aleatorios de todos los conjuntos
$allChars = $lower + $upper + $numbers + $special
$passwordChars += [char[]] (Get-Random -InputObject $allChars -Count (20 - $passwordChars.Length))

# Mezclar y unir los caracteres para crear la contraseña final
$plainPassword = -join (Get-Random -InputObject $passwordChars -Count $passwordChars.Length)

# Mostrar la contraseña generada
$plainPassword

# Copia la contraseña al portapapeles
$plainPassword | Set-Clipboard
