// ponha o cursor em qualquer lugar dentro dos parêntesis e aperte Ctrl + enter
(
q = q ? ();

s.waitForBoot({
	"Comunicacao/osc-pra-dentro*".loadRelative;
	s.sync;
	"Comunicacao/osc-pra-fora*".loadRelative;
	s.sync;
	"Sons/saaw*".loadRelative;
	s.sync;
	"Comunicacao/entre/movimento-e-som*".loadRelative;
});

)