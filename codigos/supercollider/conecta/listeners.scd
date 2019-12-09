q.scale = Scale.at(\lydianMinor);

q.playTunel = { |q, oTunel, key, attack, release, amp|
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

(

OSCdef(\vermelhodo1, { |msg|
	// (instrument: \simpsamp, buf: q.snares.choose, rate: 1, out: Ndef(\vermelhodo1).bus, \amp: 1).play
	q.playTunel(
		q.vermelhodo1.tunel, // oTunel
		q.scale.degreeToFreq(( msg[3] * 4 ).asInteger , 69.midicps, -6), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		1 // amp
	);
}, '/vermelhodo1_reply');

/*OSCdef(\vermelhodo2, { |msg|
// (instrument: \simpsamp, buf: q.snares.choose, rate: 1, out: Ndef(\vermelhodo1).bus, \amp: 1).play
( instrument: \tunel2, \scale: q.scale, \degree: msg[3], \att: msg[4], \rel: msg[5] * Ndef(\envCtrl).get(\rel), \amp: 0.1, pos: -0.5, out: Ndef(\vermelhodo2).bus ).play;
}, '/vermelhodo2_reply');*/

OSCdef(\laranjare, { |msg|
	// (instrument: \simpsamp, buf: q.snares.choose, rate: 1, out: Ndef(\laranjare).bus, \amp: 1).play
	q.playTunel(
		q.laranjare.tunel, // oTunel
		q.scale.degreeToFreq(( msg[3] * 3 ).asInteger , 69.midicps, -5), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.8 // amp
	);
}, '/laranjare_reply');

OSCdef(\amarelomi, { |msg|
	// (instrument: \simpsamp_st, buf: q.cabassa.choose, rate: 1, out: Ndef(\amarelomi).bus, \amp: 1).play;
	q.playTunel(
		q.amarelomi.tunel, // oTunel
		q.scale.degreeToFreq(( msg[3] * 2 ).asInteger , 69.midicps, -4), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.6 // amp
	);
}, '/amarelomi_reply' );

OSCdef(\verdefa1, { |msg|
	// (instrument: \simpsamp_st, buf: q.cabassa.choose, rate: 1, out: Ndef(\verdefa1).bus, \amp: 1).play;
	q.playTunel(
		q.verdefa1.tunel, // oTunel
		q.scale.degreeToFreq(( msg[3] * 1 ).asInteger , 69.midicps, -3), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.5 // amp
	);
}, '/verdefa1_reply' );

/*OSCdef(\verdefa2, { |msg|
(instrument: \simpsamp, buf: q.surdo.choose, rate: 1, out: Ndef(\lilassi).bus).play;
( instrument: \tunel2, \scale: q.scale, \degree: msg[3], \att: msg[4], \rel: msg[5], \amp: 0.1, out: Ndef(\verdefa1).bus ).play;
}, '/verdefa1_reply' );*/

OSCdef(\verdesol, { |msg|
	// (instrument: \simpsamp, buf: q.surdo.choose, rate: 1, out: Ndef(\verdesol).bus, \amp: 1).play
	q.playTunel(
		q.verdesol.tunel, // oTunel
		q.scale.degreeToFreq(( msg[3] ).asInteger , 69.midicps, -2), // key, deg
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.3 // amp
	);
}, '/verdesol_reply');

OSCdef(\lilassi, { |msg|
	// var msg = [0, 0, 0, 0, 0.01, 0.1, 1, 1];
	// (instrument: \simpsamp_st, buf: q.cabassa.choose, rate: 1, out: Ndef(\lilassi).bus, \amp: 1).play;
	q.playTunel(
		q.lilassi.tunel, // oTunel
		q.scale.degreeToFreq(( msg[3] * 0.5 ).asInteger , 69.midicps, 0 ), // key
		msg[4] * Ndef(\envCtrl).get(\att), // attack
		msg[5] * Ndef(\envCtrl).get(\rel), // release
		0.2 // amp
	)
}, '/lilassi_reply' );

)