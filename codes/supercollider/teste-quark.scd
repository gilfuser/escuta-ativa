// A funcao abaixo (na realidade chamada de "rotina") testa se voce tem os necessários componentes extra do SuperCollider (Quarks) instalados. Você só precisa dela uma vez.

~qi = false;
{
	if ( Quarks.isInstalled("JITLibExtensions").not,
		{ Quarks.install("JITLibExtensions"); ~qi = true }
	);
	if ( Quarks.isInstalled("adclib").not,
		{ Quarks.install("adclib"); ~qi = true }
	);
	if ( ~qi == true,
		{
			1.do{
				"Agora você já tem tudo o que precisa.\nO SC será reiniciado em 5 segundos.\nEm seguida aperte Ctrl + Enter com o cursor em qualquer lugar do código (entre os parêntesis)\nComo você já fez! ;)".postln;
				5.wait;
				s.quit;
				thisProcess.recompile;
			}
		},
		{
			"siga em frente, você já tem tudo o que precisa".postln;
		}
	)
}.fork;