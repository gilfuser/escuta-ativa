// ponha o cursor em qualquer lugar entre os parêntesis e aperte Ctrl + enter
// se o SuperCollider reiniciar repita a operacao
(

q = q ? ();

"teste-quark*".loadRelative;

s.waitForBoot({
	"Comunicacao/osc-dentro-fora*".loadRelative;
	0.1.wait;
	s.sync;
	"Sons/saaw*".loadRelative;
	0.1.wait;
	s.sync;
	"Comunicacao/entre-movimento-e-som*".loadRelative;
});

)

/*
MFdef(\imu).disable(\post)  // Shift + Enter nesta linha para parar de mostrar os números do acelerômetro
MFdef(\imu).enable(\post)  // Shift + Enter nesta linha para mostrar os números do acelerômetro
*/