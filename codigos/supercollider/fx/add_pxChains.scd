{
	(
		q.vermelhodo.pxChain = ProxyChain.from( Ndef(\vermelhodo), [ 'pitch', 'wah', 'lpf','analysisdo' ] );
		q.laranjare.pxChain = ProxyChain.from( Ndef(\laranjare), [ 'pitch', 'wah', 'lpf','analysisre' ] );
		q.amarelomi.pxChain = ProxyChain.from( Ndef(\amarelomi), [ 'pitch', 'wah', 'lpf','analysismi' ] );
		q.verdefa.pxChain = ProxyChain.from( Ndef(\verdefa), [ 'pitch', 'wah', 'lpf','analysisfa' ] );
		q.verdesol.pxChain = ProxyChain.from( Ndef(\verdesol), [ 'pitch', 'wah', 'lpf','analysissol' ] );
		q.lilassi.pxChain = ProxyChain.from( Ndef(\lilassi), [ 'pitch', 'wah', 'lpf','analysissi' ] );

		q.vermelhodo.pxAcid = ProxyChain.from( Ndef(\acidDo), [ 'pitch', 'wah', 'lpf','analysisdo' ] );
		q.laranjare.pxAcid = ProxyChain.from( Ndef(\acidRe), [ 'pitch', 'wah', 'lpf','analysisre' ] );
		q.amarelomi.pxAcid = ProxyChain.from( Ndef(\acidMi), [ 'pitch', 'wah', 'lpf','analysismi' ] );
		q.verdefa.pxAcid = ProxyChain.from( Ndef(\acidFa), [ 'pitch', 'wah', 'lpf','analysisfa' ] );
		q.verdesol.pxAcid = ProxyChain.from( Ndef(\acidSol), [ 'pitch', 'wah', 'lpf','analysissol' ] );
		q.lilassi.pxAcid = ProxyChain.from( Ndef(\acidSi), [ 'pitch', 'wah', 'lpf','analysissi' ] );

		q.vermelhodo.pxTunel = ProxyChain.from( Ndef( \tunelDo ), [ 'pitch', 'wah', 'lpf','analysisdo' ] );
		q.laranjare.pxTunel = ProxyChain.from( Ndef( \tunelRe ), [ 'pitch', 'wah', 'lpf','analysisre' ] );
		q.amarelomi.pxTunel = ProxyChain.from( Ndef( \tunelMi ), [ 'pitch', 'wah', 'lpf','analysismi' ] );
		q.verdefa.pxTunel = ProxyChain.from( Ndef( \tunelFa ), [ 'pitch', 'wah', 'lpf','analysisfa' ] );
		q.verdesol.pxTunel = ProxyChain.from( Ndef( \tunelSol ), [ 'pitch', 'wah', 'lpf','analysissol' ] );
		q.lilassi.pxTunel = ProxyChain.from( Ndef( \tunelSi ), [ 'pitch', 'wah', 'lpf','analysissi' ] );

	);

	0.2.wait;

	q.vermelhodo.pxChain.add(\pitch, 0.5).add(\analysisdo);
	q.laranjare.pxChain.add(\pitch, 0.5).add(\analysisre);
	q.amarelomi.pxChain.add(\pitch, 0.5).add(\wah, 0.9).add(\analysismi);
	q.verdefa.pxChain.add(\wah, 0.9).add(\analysisfa);
	q.verdesol.pxChain.add(\wah, 0.9).add(\analysissol);
	q.lilassi.pxChain.add(\wah, 0.82).add(\analysissi);

	q.vermelhodo.pxAcid.add(\pitch, 0.5).add(\analysisdo);
	q.laranjare.pxAcid.add(\pitch, 0.5).add(\analysisre);
	q.amarelomi.pxAcid.add(\pitch, 0.5).add(\wah, 0.9).add(\analysismi);
	q.verdefa.pxAcid.add(\wah, 0.9).add(\analysisfa);
	q.verdesol.pxAcid.add(\wah, 0.9).add(\analysissol);
	q.lilassi.pxAcid.add(\wah, 0.82).add(\analysissi);

	q.vermelhodo.pxTunel.add(\pitch, 0.5).add(\analysisdo);
	q.laranjare.pxTunel.add(\pitch, 0.5).add(\analysisre);
	q.amarelomi.pxTunel.add(\pitch, 0.5).add(\wah, 0.9).add(\analysismi);
	q.verdefa.pxTunel.add(\wah, 0.9).add(\analysisfa);
	q.verdesol.pxTunel.add(\wah, 0.9).add(\analysissol);
	q.lilassi.pxTunel.add(\wah, 0.82).add(\analysissi);

	0.2.wait;

	q.vermelhodo.pxChain.set( 'tdisp', 0.005, 'pdisp', 0.005, 'slide', 0.02 );
	q.laranjare.pxChain.set( 'pideg', 9.0 );
	q.amarelomi.pxChain.set( 'wphase', 1.5, 'pdisp', 0.005, 'depth', 1.0, 'pideg', 18.0, 'wrate', 0.12, 'jdepth', 0.0, 'jfreq', 0.1, 'sinsaw', 1.0 );
	q.verdefa.pxChain.set( 'tdisp', 0.17, 'pdisp', 0.008, 'depth', 1/3, 'pideg', 18.0, 'wrate', 0.15, 'wet10', 0.5, 'sinsaw', 1.0, 'jdepth', 1/3);
	q.verdesol.pxChain.set( 'tdisp', 0.0, 'pideg', 18.0, 'pdisp', 0.02 );
	q.lilassi.pxChain.set( 'wphase', 0.5, 'depth', 0.25, 'wrate', 0.05, 'jdepth', 0.25 );

	// q.verdesol.pxChain.add(\analysis);
	//////////////////////////////////////////////////////////////////////
	// q.dir = thisProcess.nowExecutingPath.dirname;
	0.2.wait;

	(
		{
			q.vermelhodo.pxChainG = q.vermelhodo.pxChain.gui(18).moveTo(1210, 600);
			q.laranjare.pxChainG = q.laranjare.pxChain.gui(18).moveTo(10, 160);
			q.amarelomi.pxChainG = q.amarelomi.pxChain.gui(18).moveTo(610, 160);
			q.verdefa.pxChainG = q.verdefa.pxChain.gui(18).moveTo(1210, 160);
			q.verdesol.pxChainG = q.verdesol.pxChain.gui(18).moveTo(10, 600);
			q.lilassi.pxChainG = q.lilassi.pxChain.gui(18).moveTo(610, 600);

			q.vermelhodo.pxAcidG = q.vermelhodo.pxAcid.gui(18).moveTo(1210, 600);
			q.laranjare.pxAcidG = q.laranjare.pxAcid.gui(18).moveTo(10, 160);
			q.amarelomi.pxAcidG = q.amarelomi.pxAcid.gui(18).moveTo(610, 160);
			q.verdefa.pxAcidG = q.verdefa.pxAcid.gui(18).moveTo(1210, 160);
			q.verdesol.pxAcidG = q.verdesol.pxAcid.gui(18).moveTo(10, 600);
			q.lilassi.pxAcidG = q.lilassi.pxAcid.gui(18).moveTo(610, 600);

			q.vermelhodo.pxTunelG = q.vermelhodo.pxTunel.gui(18).moveTo(1110, 500);
			q.laranjare.pxTunelG = q.laranjare.pxTunel.gui(18).moveTo(0, 110);
			q.amarelomi.pxTunelG = q.amarelomi.pxTunel.gui(18).moveTo(510, 110);
			q.verdefa.pxTunelG = q.verdefa.pxTunel.gui(18).moveTo(1110, 110);
			q.verdesol.pxTunelG = q.verdesol.pxTunel.gui(18).moveTo(0, 500);
			q.lilassi.pxTunelG = q.lilassi.pxTunel.gui(18).moveTo(510, 500);

		}.defer;
	);

	" \n PxChain > Orbs - LOADED \n".postln;
}.fork;

