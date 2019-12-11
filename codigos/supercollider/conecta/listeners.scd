OSCdef(\vermelhodo_m1, { |msg|
	(instrument: \simpsamp, buf: q.snares.choose, rate: 1, out: Ndef(\vermelhodo).bus, \amp: 1).play;
}, '/vermelhodo_mov1');

OSCdef(\laranjare_m1, { |msg|
	(instrument: \simpsamp, buf: q.snares.choose, rate: 1, out: Ndef(\laranjare).bus, \amp: 1).play;
}, '/laranjare_mov1');

OSCdef(\amarelomi_m1, { |msg|
	(instrument: \simpsamp_st, buf: q.cabassa.choose, rate: 1, out: Ndef(\amarelomi).bus, \amp: 1).play;
}, '/amarelomi_mov1' );

OSCdef(\verdefa_m1, { |msg|
	(instrument: \simpsamp_st, buf: q.cabassa.choose, rate: 1, out: Ndef(\verdefa).bus, \amp: 1).play;
}, '/verdefa_mov1' );

OSCdef(\verdesol_m1, { |msg|
	(instrument: \simpsamp, buf: q.surdo.choose, rate: 1, out: Ndef(\verdesol).bus, \amp: 1).play;
}, '/verdesol_mov1');

OSCdef(\lilassi_m1, { |msg|
	// var msg = [0, 0, 0, 0, 0.01, 0.1, 1, 1];
	(instrument: \simpsamp_st, buf: q.cabassa.choose, rate: 1, out: Ndef(\lilassi).bus, \amp: 1).play;
}, '/lilassi_mov1' );

/////////////////////////////////////////// MOV 2 /////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////

q.playacid = { |q, acid, key, attack = 0.02, release = 0.2, amp|
	if ( acid.playingKeys.includes(key).not ) {
		acid.put(key, [
			\freq, key,
			\att, attack,
			\rel, release,
			\amp, amp * (2 + acid.playingKeys.size).reciprocal
		]);
	};
	defer( { acid.release(key, 0.1) }, attack + release );
};

OSCdef(\vermelhodo_m2, { |msg|
	q.playacid(
		q.vermelhodo.acid,
		q.scale.degreeToFreq(( msg[3]  ).asInteger , 69.midicps, -2), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		1 // amp
	);
}, '/vermelhodo_mov2');

OSCdef(\laranjare_m2, { |msg|
	q.playacid(
		q.laranjare.acid,
		q.scale.degreeToFreq(( msg[3] + 5 ).asInteger , 69.midicps, -2), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.8 // amp
	);
}, '/laranjare_mov2');

OSCdef(\amarelomi_m2, { |msg|
	q.playacid(
		q.amarelomi.acid,
		q.scale.degreeToFreq( ( msg[3] ).asInteger , 69.midicps, -1), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.7 // amp
	);
}, '/amarelomi_mov2' );

OSCdef(\verdefa_m2, { |msg|
	q.playacid(
		q.verdefa.acid,
		q.scale.degreeToFreq( ( msg[3] - 5 ).asInteger , 69.midicps, 0), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.6 // amp
	);
}, '/verdefa_mov2' );

OSCdef(\verdesol_m2, { |msg|
	q.playacid(
		q.verdesol.acid,
		q.scale.degreeToFreq( ( msg[3] ).asInteger , 69.midicps, 0), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.4 // amp
	);
}, '/verdesol_mov2');

OSCdef(\lilassi_m2, { |msg|
	q.playacid(
		q.lilassi.acid,
		q.scale.degreeToFreq( ( msg[3] ).asInteger , 69.midicps, 1 ), // key
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.4 // amp
	)
}, '/lilassi_mov2' );



/////////////////////////////////////////// MOV 3 /////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////

q.playTunel = { |q, oTunel, key, attack = 0.02, release = 0.2, amp|
	if ( oTunel.playingKeys.includes(key).not ) {
		oTunel.put(key, [
			\freq, key,
			\att, attack,
			\rel, release,
			\amp, amp * (2 + oTunel.playingKeys.size).reciprocal
		]);
	};
	defer( { oTunel.release(key, 0.2) }, attack + release );
};

OSCdef(\vermelhodo_m3, { |msg|
	q.playTunel(
		q.vermelhodo.tunel, // oTunel
		q.scale.degreeToFreq(( msg[3] * 0.25 ).asInteger , 69.midicps, -5), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.8 // amp
	);
}, '/vermelhodo_mov3');

OSCdef(\laranjare_m3, { |msg|
	q.playTunel(
		q.laranjare.tunel, // oTunel
		q.scale.degreeToFreq(( msg[3] * 0.5 ).asInteger , 69.midicps, -4), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.8 // amp
	);
}, '/laranjare_mov3');

OSCdef(\amarelomi_m3, { |msg|
	q.playTunel(
		q.amarelomi.tunel, // oTunel
		q.scale.degreeToFreq(( msg[3] * 1 ).asInteger , 69.midicps, -3), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.7 // amp
	);
}, '/amarelomi_mov3' );

OSCdef(\verdefa_m3, { |msg|
	q.playTunel(
		q.verdefa.tunel, // oTunel
		q.scale.degreeToFreq(( msg[3] * 1 ).asInteger , 69.midicps, -3), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.6 // amp
	);
}, '/verdefa_mov3' );

OSCdef(\verdesol_m3, { |msg|
	q.playTunel(
		q.verdesol.tunel, // oTunel
		q.scale.degreeToFreq(( msg[3] * 0.5 ).asInteger , 69.midicps, 2), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.4 // amp
	);
}, '/verdesol_mov3');

OSCdef(\lilassi_m3, { |msg|
	q.playTunel(
		q.lilassi.tunel, // oTunel
		q.scale.degreeToFreq(( msg[3] * 0.25 ).asInteger , 69.midicps, 3 ), // key
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.4 // amp
	)
}, '/lilassi_mov3' );

