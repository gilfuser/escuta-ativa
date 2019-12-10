q = q ? ();
{
	(
		// An 8-channel MasterFX on server s.
		// The order in slotNames determines order of execution of the efx.

		q.masta = MasterFX.new(server: s,
			numChannels: 2,
			slotNames: [\verb, \comp, \leakDC, \ampFin],
			busIndex: 0
		);
		q.masta.add(\verb, 1);
		q.masta.add(\leakDC, 1);
		q.masta.add(\comp, 0.8);  // compressor
		q.masta.add(\ampFin, 1);  // limit output
		{q.mastaGui = q.masta.gui('Masta!', 15)}.defer;
		{s.scope(s.options.numOutputBusChannels)}.defer;
	);

	Ndef('zz_mastafx').set('mix', 0.25, 'clamp', 0.03, 'wet30', 1, 'drive', 2, 'relax', 0.35, 'thresh', 0.33, 'slopea', 0.25);

	" \n Master FX - LOADED \n".postln;

}.fork;

MasterFX.clear('localhost') 