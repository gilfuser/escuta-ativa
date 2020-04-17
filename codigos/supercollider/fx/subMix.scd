q = q ? ();
Ndef(\do_mov1).ar(2);
Ndef(\re_mov1).ar(2);
Ndef(\mi_mov1).ar(2);
Ndef(\fa_mov1).ar(2);
Ndef(\sol_mov1).ar(2);
Ndef(\si_mov1).ar(2);
{
	q.vermelhodo.mix = ProxySubmix(\mixdo);
	q.vermelhodo.mix.ar(2);

	q.vermelhodo.mix.addMix( Ndef(\do_mov1) );
	q.vermelhodo.mix.addMix( Ndef(\tunelDo) );
	q.vermelhodo.mix.addMix( Ndef(\acidDo) );
	q.vermelhodo.mix.addLevel;
	q.vermelhodo.mix.play;

	q.subDo = ProxyChain.from( q.vermelhodo.mix, [ \pitch, \wah, \lpf, \analysisdo] );
	q.subDo.add(\pitch, 0.5).add(\analysisdo);

	q.vermelhodo.mix.set( 'tdisp', 0.005, 'pdisp', 0.005, 'slide', 0.02 );

	0.2.wait;

	q.laranjare.mix = ProxySubmix(\mixre);
	q.laranjare.mix.ar(2);

	q.laranjare.mix.addMix( Ndef(\re_mov1) );
	q.laranjare.mix.addMix( Ndef(\tunelRe) );
	q.laranjare.mix.addMix( Ndef(\acidRe) );
	q.laranjare.mix.addLevel;
	q.laranjare.mix.play;

	q.subRe = ProxyChain.from( q.laranjare.mix, [ \pitch, \wah, \lpf, \analysisre] );
	q.subRe.add(\pitch, 0.5).add(\analysisre);

	q.laranjare.mix.set( 'tdisp', 0.005, 'pdisp', 0.005, 'slide', 0.02, 'pideg', 9 );

	0.2.wait;

	q.amarelomi.mix = ProxySubmix(\mixmi);
	q.amarelomi.mix.ar(2);

	q.amarelomi.mix.addMix( Ndef(\mi_mov1) );
	q.amarelomi.mix.addMix( Ndef(\tunelmi) );
	q.amarelomi.mix.addMix( Ndef(\acidmi) );
	q.amarelomi.mix.addLevel;
	q.amarelomi.mix.play;

	q.submi = ProxyChain.from( q.amarelomi.mix, [ \pitch, \wah, \lpf, \analysismi] );
	q.submi.add(\pitch, 0.5).add(\analysismi);

	q.amarelomi.mix.set( 'wphase', 1.5, 'pdisp', 0.005, 'depth', 1.0, 'pideg', 18.0, 'wrate', 0.12, 'jdepth', 0.0, 'jfreq', 0.1, 'sinsaw', 1.0 );

	0.2.wait;

	q.verdefa.mix = ProxySubmix(\mixfa);
	q.verdefa.mix.ar(2);

	q.verdefa.mix.addMix( Ndef(\fa_mov1) );
	q.verdefa.mix.addMix( Ndef(\tunelfa) );
	q.verdefa.mix.addMix( Ndef(\acidfa) );
	q.verdefa.mix.addLevel;
	q.verdefa.mix.play;

	q.subfa = ProxyChain.from( q.verdefa.mix, [ \pitch, \wah, \lpf, \analysisfa] );
	q.submi.add(\pitch, 0.5).add(\analysisfa);

	q.verdefa.mix.set( 'tdisp', 0.17, 'pdisp', 0.008, 'depth', 1/3, 'pideg', 18.0, 'wrate', 0.15, 'wet10', 0.5, 'sinsaw', 1.0, 'jdepth', 1/3);

	0.2.wait;

	q.verdesol.mix = ProxySubmix(\mixsol);
	q.verdesol.mix.ar(2);

	q.verdesol.mix.addMix( Ndef(\sol_mov1) );
	q.verdesol.mix.addMix( Ndef(\tunelsol) );
	q.verdesol.mix.addMix( Ndef(\acidsol) );
	q.verdesol.mix.addLevel;
	q.verdesol.mix.play;

	q.subsol = ProxyChain.from( q.verdesol.mix, [ \pitch, \wah, \lpf, \analysissol] );
	q.submi.add(\pitch, 0.5).add(\analysissol);

	q.verdesol.mix.set( 'tdisp', 0.0, 'pideg', 18.0, 'pdisp', 0.02 );

	0.2.wait;

	q.lilassi.mix = ProxySubmix(\mixsi);
	q.lilassi.mix.ar(2);

	q.lilassi.mix.addMix( Ndef(\si_mov1) );
	q.lilassi.mix.addMix( Ndef(\tunelsi) );
	q.lilassi.mix.addMix( Ndef(\acidsi) );
	q.lilassi.mix.addLevel;
	q.lilassi.mix.play;

	q.subsi = ProxyChain.from( q.lilassi.mix, [ \pitch, \wah, \lpf, \analysissi] );
	q.submi.add(\pitch, 0.5).add(\analysissi);


	q.lilassi.mix.set( 'tdisp', 0.0, 'pideg', 18.0, 'pdisp', 0.02 );

	{
		q.subDo.gui(18).moveTo(1210, 600);
		q.subRe.gui(18).moveTo(10, 160);
		q.submi.gui(18).moveTo(610, 160);
		q.subfa.gui(18).moveTo(1210, 160);
		q.subsol.gui(18).moveTo(10, 600);
		q.subsi.gui(18).moveTo(610, 600)
	}.defer;

	" \n SubMix - LOADED \n".postln;

}.fork;
