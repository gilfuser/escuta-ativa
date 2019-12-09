{
	(
		q.lilassi.pxChain = ProxyChain.from( Ndef(\lilassi), [ 'pitch', 'wah', 'lpf','analysissi' ] );
		q.vermelhodo1.pxChain = ProxyChain.from( Ndef(\vermelhodo1), [ 'pitch', 'wah', 'lpf','analysisdo1' ] );
		q.vermelhodo2.pxChain = ProxyChain.from( Ndef(\vermelhodo2), [ 'pitch', 'wah', 'lpf','analysisdo2' ] );
		q.laranjare.pxChain = ProxyChain.from( Ndef(\laranjare), [ 'pitch', 'wah', 'lpf','analysisre' ] );
		q.amarelomi.pxChain = ProxyChain.from( Ndef(\amarelomi), [ 'pitch', 'wah', 'lpf','analysismi' ] );
		q.verdefa1.pxChain = ProxyChain.from( Ndef(\verdefa1), [ 'pitch', 'wah', 'lpf','analysisfa1' ] );
		q.verdefa2.pxChain = ProxyChain.from( Ndef(\verdefa2), [ 'pitch', 'wah', 'lpf','analysisfa2' ] );
		q.verdesol.pxChain = ProxyChain.from( Ndef(\verdesol), [ 'pitch', 'wah', 'lpf','analysissol' ] );
	);

	0.2.wait;

	Ndef('vermelhodo1').set('wet20', 1, 'tdisp', 0.005, 'wet30', 0, 'wet10', 0.5, 'pdisp', 0.005, 'wet40', 0, 'slide', 0.02);

	// [ q.lilassi.pxChain, q.vermelhodo1.pxChain, q.vermelhodo2.pxChain, q.laranjare.pxChain, q.amarelomi.pxChain, q.verdefa1.pxChain, q.verdefa2.pxChain, q.verdesol.pxChain ].do(_.add(\lpf)).do(_.add(\pitch));
	// [ q.lilassi.pxChain, q.vermelhodo1.pxChain, q.vermelhodo2.pxChain, q.laranjare.pxChain, q.amarelomi.pxChain, q.verdefa1.pxChain, q.verdefa2.pxChain, q.verdesol.pxChain ].do(_.add(\analysis));
	/*q.vermelhodo1.pxChain.set(\select, 1);
	q.vermelhodo2.pxChain.set(\select, 2);
	q.laranjare.pxChain.set(\select, 3);
	q.amarelomi.pxChain.set(\select, 4);
	q.verdefa1.pxChain.set(\select, 5);
	q.verdefa2.pxChain.set(\select, 6);
	q.verdesol.pxChain.set(\select, 7);*/

	q.lilassi.pxChain.add(\analysissi);
	q.vermelhodo1.pxChain.add(\analysisdo1);
	q.vermelhodo2.pxChain.add(\analysisdo2);
	q.laranjare.pxChain.add(\analysisre);
	q.amarelomi.pxChain.add(\analysismi);
	q.verdefa1.pxChain.add(\analysisfa1);
	q.verdefa2.pxChain.add(\analysisfa2);
	q.verdesol.pxChain.add(\analysissol);

	// q.verdesol.pxChain.add(\analysis);
	//////////////////////////////////////////////////////////////////////
	// q.dir = thisProcess.nowExecutingPath.dirname;
	0.2.wait;

	(
		{
			q.lilassi.pxChainG = q.lilassi.pxChain.gui(18).moveTo(610, 600);
			q.vermelhodo1.pxChainG = q.vermelhodo1.pxChain.gui(18).moveTo(1210, 600);
			q.laranjare.pxChainG = q.laranjare.pxChain.gui(18).moveTo(10, 160);
			q.amarelomi.pxChainG = q.amarelomi.pxChain.gui(18).moveTo(610, 160);
			q.verdefa1.pxChainG = q.verdefa1.pxChain.gui(18).moveTo(1210, 160);
			q.verdesol.pxChainG = q.verdesol.pxChain.gui(18).moveTo(10, 600);
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

