{
	(
		q.vermelhodo1.pxChain = ProxyChain.from( Ndef(\vermelhodo1), [ 'pitch', 'wah', 'lpf','analysisdo1' ] );
		q.laranjare.pxChain = ProxyChain.from( Ndef(\laranjare), [ 'pitch', 'wah', 'lpf','analysisre' ] );
		q.amarelomi.pxChain = ProxyChain.from( Ndef(\amarelomi), [ 'pitch', 'wah', 'lpf','analysismi' ] );
		q.verdefa1.pxChain = ProxyChain.from( Ndef(\verdefa1), [ 'pitch', 'wah', 'lpf','analysisfa1' ] );
		q.verdesol.pxChain = ProxyChain.from( Ndef(\verdesol), [ 'pitch', 'wah', 'lpf','analysissol' ] );
		q.lilassi.pxChain = ProxyChain.from( Ndef(\lilassi), [ 'pitch', 'wah', 'lpf','analysissi' ] );
	);

	(
		q.vermelhodo1.acid = ();
		q.laranjare.acid = ();
		q.amarelomi.acid = ();
		q.verdefa1.acid = ();
		q.verdesol.acid = ();
		q.lilassi.acid = ();

		q.vermelhodo1.acid.pxChain = ProxyChain.from( Ndef(\acidDo), [ 'pitch', 'wah', 'lpf','analysisdo1' ] );
		q.laranjare.acid.pxChain = ProxyChain.from( Ndef(\acidRe), [ 'pitch', 'wah', 'lpf','analysisre' ] );
		q.amarelomi.acid.pxChain = ProxyChain.from( Ndef(\acidMi), [ 'pitch', 'wah', 'lpf','analysismi' ] );
		q.verdefa1.acid.pxChain = ProxyChain.from( Ndef(\acidFa), [ 'pitch', 'wah', 'lpf','analysisfa1' ] );
		q.verdesol.acid.pxChain = ProxyChain.from( Ndef(\acidSol), [ 'pitch', 'wah', 'lpf','analysissol' ] );
		q.lilassi.acid.pxChain = ProxyChain.from( Ndef(\acidSi), [ 'pitch', 'wah', 'lpf','analysissi' ] );
	);

	0.2.wait;

	q.vermelhodo1.pxChain.set( 'tdisp', 0.005, 'pdisp', 0.005, 'slide', 0.02 );
	q.laranjare.pxChain.set( 'pideg', 9.0 );
	q.amarelomi.pxChain.set( 'wphase', 1.5, 'pdisp', 0.005, 'depth', 1.0, 'pideg', 18.0, 'wrate', 0.12, 'jdepth', 0.0, 'jfreq', 0.1, 'sinsaw', 1.0 );
	q.verdefa1.pxChain.set( 'tdisp', 0.17, 'pdisp', 0.008, 'depth', 1/3, 'pideg', 18.0, 'wrate', 0.15, 'wet10', 0.5, 'sinsaw', 1.0, 'jdepth', 1/3);
	q.verdesol.pxChain.set( 'tdisp', 0.0, 'pideg', 18.0, 'pdisp', 0.02 );
	q.lilassi.pxChain.set( 'wphase', 0.5, 'depth', 0.25, 'wrate', 0.05, 'jdepth', 0.25 );


	q.vermelhodo1.pxChain.add(\pitch, 0.5).add(\analysisdo1);
	q.laranjare.pxChain.add(\pitch, 0.5).add(\analysisre);
	q.amarelomi.pxChain.add(\pitch, 0.5).add(\wah, 0.9).add(\analysismi);
	q.verdefa1.pxChain.add(\wah, 0.9).add(\analysisfa1);
	q.verdesol.pxChain.add(\wah, 0.9).add(\analysissol);
	q.lilassi.pxChain.add(\wah, 0.82).add(\analysissi);

	q.vermelhodo1.acid.pxChain.add(\pitch, 0.5).add(\analysisdo1);
	q.laranjare.acid.pxChain.add(\pitch, 0.5).add(\analysisre);
	q.amarelomi.acid.pxChain.add(\pitch, 0.5).add(\wah, 0.9).add(\analysismi);
	q.verdefa1.acid.pxChain.add(\wah, 0.9).add(\analysisfa1);
	q.verdesol.acid.pxChain.add(\wah, 0.9).add(\analysissol);
	q.lilassi.acid.pxChain.add(\wah, 0.82).add(\analysissi);

	// q.verdesol.pxChain.add(\analysis);
	//////////////////////////////////////////////////////////////////////
	// q.dir = thisProcess.nowExecutingPath.dirname;
	0.2.wait;

	(
		{
			q.vermelhodo1.pxChainG = q.vermelhodo1.pxChain.gui(18).moveTo(1210, 600);
			q.laranjare.pxChainG = q.laranjare.pxChain.gui(18).moveTo(10, 160);
			q.amarelomi.pxChainG = q.amarelomi.pxChain.gui(18).moveTo(610, 160);
			q.verdefa1.pxChainG = q.verdefa1.pxChain.gui(18).moveTo(1210, 160);
			q.verdesol.pxChainG = q.verdesol.pxChain.gui(18).moveTo(10, 600);
			q.lilassi.pxChainG = q.lilassi.pxChain.gui(18).moveTo(610, 600);

			q.vermelhodo1.acid.pxChainG = q.vermelhodo1.acid.pxChain.gui(18).moveTo(1210, 600);
			q.laranjare.acid.pxChainG = q.laranjare.acid.pxChain.gui(18).moveTo(10, 160);
			q.amarelomi.acid.pxChainG = q.amarelomi.acid.pxChain.gui(18).moveTo(610, 160);
			q.verdefa1.acid.pxChainG = q.verdefa1.acid.pxChain.gui(18).moveTo(1210, 160);
			q.verdesol.acid.pxChainG = q.verdesol.acid.pxChain.gui(18).moveTo(10, 600);
			q.lilassi.acid.pxChainG = q.lilassi.acid.pxChain.gui(18).moveTo(610, 600);

			// q.guiOrb4 = q.orb4.gui(8).moveTo(0, 0);
			// q.lilassiPset = NdefPreset( q.lilassi.pxChain.proxy );
			/* q.o0Pset.namesToStore */
			// add the current state of the envir as a setting
			// q.o0Pset.addSet(\lfoOpened);
			// q.o0Pset.xfadeTo(\lfoClosed, 16);
			/*
			q.o0Pset.loadSettings( q.ir ++ "/orb0.pxpreset.scd");
			q.o0PsetGui = NdefPresetGui(q.o0Pset, 40).moveTo(0, 570);
			*/
			// q.vermelhodo1Pset = NdefPreset( q.vermelhodo1.pxChain.proxy );
			/*
			q.o1Pset.loadSettings( q.ir ++ "/orb1.pxpreset.scd");
			q.o1PsetGui = NdefPresetGui(q.o1Pset, 40).moveTo(500, 570);
			*/
			// q.vermelhodo2Pset = NdefPreset( q.vermelhodo2.pxChain.proxy );
			/*
			q.o2Pset.loadSettings( q.ir ++ "/orb2.pxpreset.scd");
			q.o2PsetGui = NdefPresetGui(q.o2Pset, 40).moveTo(1000, 570);
			*/
			// q.laranjarePset = NdefPreset( q.laranjare.pxChain.proxy );
			/*
			q.o3Pset.loadSettings( q.ir ++ "/orb3.pxpreset.scd");
			q.o3Psetgui = NdefPresetGui(q.o3Pset, 40).moveTo(1500, 570);
			*/
		}.defer;
	);

	" \n PxChain > Orbs - LOADED \n".postln;
}.fork;

