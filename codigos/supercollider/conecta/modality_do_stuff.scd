fork{
	///////////////////////////////////////////////////////////////////////////////////////////

	Ndef(\triggers, { | min = 0.33, max = 0.9 |
		var lilassit, vermelhodo1t, vermelhodo2t, laranjaret, amarelomit, verdefa1t, verdefa2t, verdesolt;
		lilassit = ( InRange.kr( \tlilassi.kr(0.5, 0), min, max ) - 1 * (-1) ).abs;
		vermelhodo1t = ( InRange.kr( \tvermelhodo1.kr(0.5), min, max ) - 1 * (-1) ).abs;
		vermelhodo2t = ( InRange.kr( \tvermelhodo2.kr(0.5), min, max ) - 1 * (-1) ).abs;
		laranjaret = ( InRange.kr( \tlaranjare.kr(0.5), min, max ) - 1 * (-1) ).abs;
		amarelomit = ( InRange.kr( \tamarelomi.kr(0.5), min, max ) - 1 * (-1) ).abs;
		verdefa1t  = ( InRange.kr( \tverdefa1.kr(0.5), min, max ) - 1 * (-1) ).abs;
		verdefa2t  = ( InRange.kr( \tverdefa2.kr(0.5), min, max ) - 1 * (-1) ).abs;
		verdesolt = ( InRange.kr( \tverdesol.kr(0.5), min, max ) - 1 * (-1) ).abs;
		SendReply.kr( Trig1.kr(lilassit), '/lilassi_reply', lilassit );
		SendReply.kr( Trig1.kr(vermelhodo1t), '/vermelhodo1_reply', vermelhodo1t );
		SendReply.kr( Trig1.kr(vermelhodo2t), '/vermelhodo2_reply', vermelhodo2t );
		SendReply.kr( Trig1.kr(laranjaret), '/laranjare_reply', laranjaret );
		SendReply.kr( Trig1.kr(amarelomit), '/amarelomi_reply', amarelomit );
		SendReply.kr( Trig1.kr(verdefa1t), '/verdefa1_reply', verdefa1t );
		SendReply.kr( Trig1.kr(verdefa2t), '/verdefa2_reply', verdefa2t );
		SendReply.kr( Trig1.kr(verdesolt), '/verdesol_reply', verdesolt );
		[ lilassit, vermelhodo1t, vermelhodo2t, laranjaret, amarelomit, verdefa1t, verdefa2t, verdesolt ]
	});

	Ndef(\triggers).gui(10);
	// Ndef(\triggers).scope;
	// Ndef(\triggers2).clear;

	Ndef(\triggers2, { //| degsi degdo1 degre degmi degfa1|
		SendReply.kr( Changed.kr( \degsi.kr(0) ), '/lilassi_reply', [ \degsi.kr(0), \attsi.kr(0), \relsi.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degdo1.kr(0) ), '/vermelhodo1_reply', [ \degdo1.kr(0), \attdo1.kr(0), \reldo1.kr(0.25) ] );
		// SendReply.kr( Changed.kr( \degdo2.kr(0) ), '/vermelhodo2_reply', [ \degdo2.kr(0), \attdo2.kr(0), \reldo2.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degre.kr(0) ), '/laranjare_reply', [ \degre.kr(0), \attre.kr(0), \relre.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degmi.kr(0) ), '/amarelomi_reply', [ \degmi.kr(0), \attmi.kr(0), \relmi.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degfa1.kr(0) ), '/verdefa1_reply', [ \degfa1.kr(0), \attfa1.kr(0), \relfa1.kr(0.25) ] );
		// SendReply.kr( Changed.kr( \degfa2.kr(0) ), '/verdefa1_reply', [ \degfa2.kr(0), \attfa2.kr(0), \relfa2.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degsol.kr(0) ), '/verdesol_reply', [ \degsol.kr(0), \attsol.kr(0), \relsol.kr(0.25) ] );
		DC.kr(0);
	});

	Ndef(\triggers2).addSpec(
		\degsi, [0,7,\lin,1], \attsi, [0.02, 2], \relsi, [0.2, 2],
		\degdo1, [-12,-4,\lin,1], \attdo1, [0.02, 2], \reldo1, [0.2, 2],
		\degdo2, [-12,-4,\lin,1], \attdo2, [0.02, 2], \reldo2, [0.2, 2],
		\degre, [-7,0,\lin,1], \attre, [0.02, 2], \relre, [0.2, 2],
		\degmi, [0,7,\lin,1], \attmi, [0.02, 2], \relmi, [0.2, 2],
		\degfa1, [0,7,\lin,1], \attfa1, [0.02, 2], \relfa1, [0.2, 2],
		\degfa2, [0,7,\lin,1], \attfa2, [0.02, 2], \relfa2, [0.2, 2],
		\degsol, [0,7,\lin,1], \attsol, [0.02, 2], \relsol, [0.2, 2]
	);

	{ Ndef(\triggers2).gui(20) }.defer;
	// Ndef(\triggers2).scope;
	/*
	OSCdef(\lilassi).free;
	OSCdef(\vermelhodo1).free;
	OSCdef(\vermelhodo2).free;
	OSCdef(\laranjare).free;
	OSCdef(\amarelomi).free;
	OSCdef(\verdefa).free;
	OSCdef(\verdesol).free;
	*/

	q.scale = Scale.at(\lydianMinor);

	0.2.wait;
(
	OSCdef(\lilassi, { |msg|
		// var msg = [0, 0, 0, 0, 0.01, 0.1, 1, 1];
			(instrument: \simpsamp_st, buf: q.cabassa.choose, rate: 1, out: Ndef(\lilassi).bus, \amp: 1).play;
			// ( instrument: \tunel, scale: q.scale, degree: msg[3], att: msg[4], rel:  msg[5], /*modFQ: msg[7], downsamp: msg[8],*/ amp: 0.1, pos: -0.75, out: Ndef(\lilassi).bus ).play;
	}, '/lilassi_reply' );

	OSCdef(\vermelhodo1, { |msg|
			(instrument: \simpsamp, buf: q.snares.choose, rate: 1, out: Ndef(\vermelhodo1).bus, \amp: 1).play
			// ( instrument: \tunel, \scale: q.scale, \degree: msg[3] - 12, \att: msg[4], \rel: msg[5], \amp: 0.1, pos: -0.5, out: Ndef(\vermelhodo1).bus ).play;
	}, '/vermelhodo1_reply');

	/*OSCdef(\vermelhodo2, { |msg|
		// (instrument: \simpsamp, buf: q.snares.choose, rate: 1, out: Ndef(\vermelhodo1).bus, \amp: 1).play
		( instrument: \tunel2, \scale: q.scale, \degree: msg[3], \att: msg[4], \rel: msg[5], \amp: 0.1, pos: -0.5, out: Ndef(\vermelhodo2).bus ).play;
	}, '/vermelhodo2_reply');*/

	OSCdef(\laranjare, { |msg|
			(instrument: \simpsamp, buf: q.snares.choose, rate: 1, out: Ndef(\laranjare).bus, \amp: 1).play
			// ( instrument: \tunel, \scale: q.scale, \degree: (msg[3] - 10), \att: msg[4], \rel: msg[5], \amp: 0.1, pos: -0.25, out: Ndef(\laranjare).bus ).play;
	}, '/laranjare_reply');

	OSCdef(\amarelomi, { |msg|
			// (instrument: \simpsamp_st, buf: q.cabassa.choose, rate: 1, out: Ndef(\amarelomi).bus, \amp: 1).play;
			( instrument: \tunel, \scale: q.scale, \degree: msg[3] - 8, \att: msg[4], \rel: msg[5], \amp: 0.1, pos: 0.75, out: Ndef(\amarelomi).bus ).play;
	}, '/amarelomi_reply' );

	OSCdef(\verdefa1, { |msg|
			(instrument: \simpsamp_st, buf: q.cabassa.choose, rate: 1, out: Ndef(\verdefa1).bus, \amp: 1).play;
			// ( instrument: \tunel, \scale: q.scale, \degree: msg[3] - 6, \att: msg[4], \rel: msg[5], \amp: 0.1, pos: 0.5, out: Ndef(\verdefa1).bus ).play;
	}, '/verdefa1_reply' );

	/*OSCdef(\verdefa2, { |msg|
		(instrument: \simpsamp, buf: q.surdo.choose, rate: 1, out: Ndef(\lilassi).bus).play;
		( instrument: \tunel2, \scale: q.scale, \degree: msg[3], \att: msg[4], \rel: msg[5], \amp: 0.1, out: Ndef(\verdefa1).bus ).play;
	}, '/verdefa1_reply' );*/

	OSCdef(\verdesol, { |msg|
			// (instrument: \simpsamp, buf: q.surdo.choose, rate: 1, out: Ndef(\verdesol).bus, \amp: 1).play
			( instrument: \tunel, \scale: q.scale, \degree: msg[3] - 4, \att: msg[4], \rel: msg[5], \amp: 0.1, pos: 0.5, out: Ndef(\verdesol).bus ).play;
	}, '/verdesol_reply');

);
	0.2.wait;

	[
		[ q.lilassi.mktl.elAt(\accel, \z), \tlilassi ],
		[ q.vermelhodo1.mktl.elAt(\accel, \z), \tvermelhodo1 ],
		// [ q.vermelhodo2.mktl.elAt(\accel, \z), \tvermelhodo2 ],
		[ q.laranjare.mktl.elAt(\accel, \z), \tlaranjare ],
		[ q.amarelomi.mktl.elAt(\accel, \z), \tamarelomi ],
		[ q.verdefa1.mktl.elAt(\accel, \z), \tverdefa1 ],
		// [ q.verdefa2.mktl.elAt(\accel, \z), \tverdefa2 ],
		[ q.verdesol.mktl.elAt(\accel, \z), \tverdesol ]
	].collect{ |v| v[0].action =  { |el|
		Ndef(\triggers).set( v[1], el.value )
	}};

	[
		[ q.lilassi.mktl.elAt(\gyro, \roll), \lilassi ],
		[ q.vermelhodo1.mktl.elAt(\gyro, \roll), \vermelhodo1 ],
		// [ q.vermelhodo2.mktl.elAt(\gyro, \roll), \vermelhodo2 ],
		[ q.laranjare.mktl.elAt(\gyro, \roll), \laranjare ],
		[ q.amarelomi.mktl.elAt(\gyro, \roll), \amarelomi ],
		[ q.verdefa1.mktl.elAt(\gyro, \roll), \verdefa1 ],
		// [ q.verdefa2.mktl.elAt(\gyro, \roll), \verdefa2 ],
		[ q.verdesol.mktl.elAt(\gyro, \roll), \verdesol ]
	].collect{ |v|
		v[0].action =  { |el|
			Ndef(v[1]).set( \freq, ((el.value + 0.5 % 1).linlin(0, 1, -pi, pi).sin + 2).linexp(1, 2, 160, 20000).lag3(0.4) )
		}
	};

	//////////////////////////////////////////////////

	// Will trigger instruments
	[
		[ q.lilassi.mktl.elAt( \gyro, \yaw), \degsi ],
		[ q.vermelhodo1.mktl.elAt(\gyro, \yaw), \degdo1 ],
		// [ q.vermelhodo2.mktl.elAt(\gyro, \yaw), \degdo2 ],
		[ q.laranjare.mktl.elAt( \gyro, \yaw), \degre ],
		[ q.amarelomi.mktl.elAt( \gyro, \yaw), \degmi ],
		[ q.verdefa1.mktl.elAt(\gyro, \yaw), \degfa1 ],
		// [ q.verdefa2.mktl.elAt(\gyro, \yaw), \degfa2 ],
		[ q.verdesol.mktl.elAt(\gyro, \yaw), \degsol ],
	].collect{ |v|
		v[0].action =  { |el|
			Ndef(\triggers2).set( v[1], ( el.value * 8 ).asInteger );
		};
		// v[0].resetAction;
	};

	// Change attack
	[
		[ q.lilassi.mktl.elAt(\gyro, \pitch), \attsi ],
		[ q.vermelhodo1.mktl.elAt(\gyro, \pitch), \attdo1 ],
		// [ q.vermelhodo2.mktl.elAt(\gyro, \pitch), \attdo2 ],
		[ q.laranjare.mktl.elAt(\gyro, \pitch), \attre ],
		[ q.amarelomi.mktl.elAt(\gyro, \pitch), \attmi ],
		[ q.verdefa1.mktl.elAt(\gyro, \pitch), \attfa1 ],
		// [ q.verdefa2.mktl.elAt(\gyro, \pitch), \attfa2 ],
		[ q.verdesol.mktl.elAt(\gyro, \pitch), \attsol ],
	].collect{ |v|
		v[0].addAction({ |el|
			Ndef(\triggers2).set( v[1], ((el.value + 0.5 % 1).linlin(0, 1, -pi, pi).sin + 2).linexp(1, 3, 0.02, 2).lag3(0.2) )
		});
		// v[0].resetAction;
	};

	0.2.wait;

	// ((0.00, 0.01..1).linlin(0, 1, -pi, pi).sin + 2).linlin(1, 3, 0.02, 2).plot
	[
		[ q.lilassi.mktl.elAt(\gyro, \roll), \relsi ],
		[ q.vermelhodo1.mktl.elAt(\gyro, \roll), \reldo1 ],
		// [ q.vermelhodo2.mktl.elAt(\gyro, \roll), \reldo2 ],
		[ q.laranjare.mktl.elAt(\gyro, \roll), \relre ],
		[ q.amarelomi.mktl.elAt(\gyro, \roll), \relmi ],
		[ q.verdefa1.mktl.elAt(\gyro, \roll), \relfa1 ],
		// [ q.verdefa2.mktl.elAt(\gyro, \roll), \relfa2 ],
		[ q.verdesol.mktl.elAt(\gyro, \roll), \relsol ],
	].collect{ |v|
		v[0].addAction({ |el|
			Ndef(\triggers2).set( v[1], (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 3, 0.02, 2) );
		});
		// v[0].resetAction;
	};

	/////////////////////////////////////////////////////////
	// q.verdesol.mktl.elAt(\accel, \z).resetAction

		[
		[ q.lilassi.mktl.elAt(\accel, \z), \acidSi, \ttrig ],
		[ q.vermelhodo1.mktl.elAt(\accel, \z), \acidDo, \ttrig ],
		// [ q.vermelhodo2.mktl.elAt(\accel, \z), \acidDo, \ttrig ],
		[ q.laranjare.mktl.elAt(\accel, \z), \acidRe, \ttrig ],
		// [ q.amarelomi.mktl.elAt(\accel, \z), \acidMi, \ttrig ],
		[ q.verdefa1.mktl.elAt(\accel, \z), \acidFa, \ttrig ],
		// [ q.verdefa2.mktl.elAt(\accel, \z), \acidFa, \ttrig ],
		[ q.verdesol.mktl.elAt(\accel, \z), \acidSol, \ttrig ]
	].collect{ |v| v[0].action =  { |el|
		Ndef(v[1]).set( v[2], el.value, \rel, el.value.abs * 2 );
				// Ndef(v[1]).set( \rel, el.value.abs * 1.5 );
	}};

		[
		[ q.lilassi.mktl.elAt( \gyro, \yaw), \acidSi],
		[ q.vermelhodo1.mktl.elAt(\gyro, \yaw), \acidDo ],
		// [ q.vermelhodo2.mktl.elAt(\gyro, \pitch), \degdo2 ],
		[ q.laranjare.mktl.elAt( \gyro, \yaw), \acidRe ],
		[ q.amarelomi.mktl.elAt( \gyro, \yaw), \acidMi ],
		[ q.verdefa1.mktl.elAt(\gyro, \yaw), \acidFa ],
		// [ q.verdefa2.mktl.elAt(\gyro, \yaw), \degfa2 ],
		[ q.verdesol.mktl.elAt(\gyro, \yaw), \acidSol ],
	].collect{ |v|
		v[0].action = { |el|
			Ndef(v[1]).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 12 ).asInteger , 69.midicps, 1) );
	}
		// v[0].resetAction;
	};

	/////////////////////////////////// NOTES AND TRIGGERS + WAVEFORM //////////////////////////////

	q.vermelhodo1.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\do_gyro_yaw).value(el.value) };
	MFdef(\do_gyro_yaw).add(\post, {|el| el.postln});
	MFdef(\do_gyro_yaw).disable(\post);
	MFdef(\do_gyro_yaw).add( \acid_freq, { |el|
		Ndef(\acidDo ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 24 ).asInteger , 69.midicps, 1), \wform, el.value.lag(0.1) )
	} );
	// MFdef(\do_gyro_yaw).enable( \acid_freq );

	q.laranjare.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\re_gyro_yaw).value(el.value) };
	MFdef(\re_gyro_yaw).add(\post, {|el| el.postln});
	MFdef(\re_gyro_yaw).disable(\post);
	MFdef(\re_gyro_yaw).add( \acid_freq, { |el|
		Ndef(\acidRe ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 20 ).asInteger , 69.midicps, 1), \wform, 1 - el.value.lag(0.1) )
	} );
	// MFdef(\re_gyro_yaw).remove( \acid_freq );

	q.amarelomi.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\mi_gyro_yaw).value(el.value) };
	MFdef(\mi_gyro_yaw).add(\post, {|el| el.postln});
	MFdef(\mi_gyro_yaw).disable(\post);
	MFdef(\mi_gyro_yaw).add( \acid_freq, { |el|
		Ndef(\acidMi ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 16 ).asInteger , 69.midicps, 1), \wform, el.value.lag(0.1) )
	} );
	// MFdef(\mi_gyro_yaw).remove( \acid_freq );

	q.verdefa1.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\fa_gyro_yaw).value(el.value) };
	MFdef(\fa_gyro_yaw).add(\post, {|el| el.postln});
	MFdef(\fa_gyro_yaw).disable(\post);
	MFdef(\fa_gyro_yaw).add( \acid_freq, { |el|
		Ndef(\acidFa ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 12 ).asInteger , 69.midicps, 1), \wform, 1 - el.value.lag(0.1) )
	} );
	// MFdef(\fa_gyro_yaw).remove( \acid_freq );

	q.verdesol.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\sol_gyro_yaw).value(el.value) };
	MFdef(\sol_gyro_yaw).add(\post, {|el| el.postln});
	MFdef(\sol_gyro_yaw).disable(\post);
	MFdef(\sol_gyro_yaw).add( \acid_freq, { |el|
		Ndef(\acidSol ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 8 ).asInteger , 69.midicps, 1), \wform, el.value.lag(0.1) )
	} );
	// MFdef(\sol_gyro_yaw).remove( \acid_freq );

	q.lilassi.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\si_gyro_yaw).value(el.value) };
	MFdef(\si_gyro_yaw).add(\post, {|el| el.postln});
	MFdef(\si_gyro_yaw).remove(\post);
	MFdef(\si_gyro_yaw).add( \acid_freq, { |el|
		Ndef(\acidSi ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 4 ).asInteger , 69.midicps, 1), \wform, 1 - el.value.lag(0.1) )
	} );
	// MFdef(\si_gyro_yaw).remove( \acid_freq );

///////////////////////////////////////////////// ATTACK /////////////////////////////////////////////////////

	q.vermelhodo1.mktl.elAt( \accel, \y).action = { |el| MFdef(\do_accel_y).value(el.value) };
	MFdef(\do_accel_y).add(\post, {|el| (el.value - 0.5).abs.postln }); MFdef(\do_accel_y).disable(\post);
	MFdef(\do_accel_y).add( \acid_attack, { |el|
		Ndef(\acidDo ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\do_accel_y).remove( \acid_freq );

	q.laranjare.mktl.elAt( \accel, \y ).action = { |el| MFdef(\re_accel_y).value(el.value) };
	MFdef(\re_accel_y).add(\post, {|el| el.postln}); MFdef(\re_accel_y).disable(\post);
	MFdef(\re_accel_y).add( \acid_attack, { |el|
		Ndef(\acidRe ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\re_accel_y).remove( \acid_freq );

	q.amarelomi.mktl.elAt( \accel, \y ).action = { |el| MFdef(\mi_accel_y).value(el.value) };
	MFdef(\mi_accel_y).add(\post, {|el| el.postln}); MFdef(\mi_accel_y).disable(\post);
	MFdef(\mi_accel_y).add( \acid_attack, { |el|
		Ndef(\acidMi ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\mi_accel_y).remove( \acid_freq );

	q.verdefa1.mktl.elAt( \accel, \y ).action = { |el| MFdef(\fa_accel_y).value(el.value) };
	MFdef(\fa_accel_y).add(\post, {|el| el.postln});
	MFdef(\fa_accel_y).disable(\post);
	MFdef(\fa_accel_y).add( \acid_attack, { |el|
		Ndef(\acidFa ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\fa_accel_y).remove( \acid_freq );

	q.verdesol.mktl.elAt( \accel, \y ).action = {|el| MFdef(\sol_accel_y).value(el.value) };
	MFdef(\sol_accel_y).add(\post, {|el| el.postln});
	MFdef(\sol_accel_y).disable(\post);
	MFdef(\sol_accel_y).add( \acid_attack, { |el|
		Ndef(\acidSol ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\si_accel_y).remove( \acid_freq );

	q.lilassi.mktl.elAt( \accel, \y ).action = {|el| MFdef(\si_accel_y).value(el.value) };
	MFdef(\si_accel_y).add(\post, {|el| el.postln});
	MFdef(\si_accel_y).remove(\post);
	MFdef(\si_accel_y).add( \acid_attack, { |el|
		Ndef(\acidSi ).set( \att, (el.value - 0.5).abs )
	} );

	///////////////////////////////////////// RELEASE ////////////////////////////////////////////////////

	q.vermelhodo1.mktl.elAt( \accel, \z).action = { |el| MFdef(\do_accel_z).value(el.value) };
	MFdef(\do_accel_z).add(\post, {|el| (el.value).abs.postln }); MFdef(\do_accel_z).disable(\post);
	MFdef(\do_accel_z).add( \acid_freq, { |el|
		Ndef(\acidDo ).set( \rel, el.value * 2 )
	} );
	// MFdef(\do_accel_z).remove( \acid_freq );

	q.laranjare.mktl.elAt( \accel, \z ).action = { |el| MFdef(\re_accel_z).value(el.value) };
	MFdef(\re_accel_z).add(\post, {|el| el.postln}); MFdef(\re_accel_z).disable(\post);
	MFdef(\re_accel_z).add( \acid_freq, { |el|
		Ndef(\acidRe ).set( \rel, el.value * 1.8 )
	} );
	// MFdef(\re_accel_z).remove( \acid_freq );

	q.amarelomi.mktl.elAt( \accel, \z ).action = { |el| MFdef(\mi_accel_z).value(el.value) };
	MFdef(\mi_accel_z).add(\post, {|el| el.postln}); MFdef(\mi_accel_z).disable(\post);
	MFdef(\mi_accel_z).add( \acid_freq, { |el|
		Ndef(\acidMi ).set( \rel, el.value * 1.6 )
	} );
	// MFdef(\mi_accel_z).remove( \acid_freq );

	q.verdefa1.mktl.elAt( \accel, \z ).action = { |el| MFdef(\fa_accel_z).value(el.value) };
	MFdef(\fa_accel_z).add(\post, {|el| el.postln});
	MFdef(\fa_accel_z).disable(\post);
	MFdef(\fa_accel_z).add( \acid_freq, { |el|
		Ndef(\acidFa ).set( \rel, el.value * 1.4 )
	} );
	// MFdef(\fa_accel_z).remove( \acid_freq );

	q.verdesol.mktl.elAt( \accel, \z ).action = {|el| MFdef(\sol_accel_z).value(el.value) };
	MFdef(\sol_accel_z).add(\post, {|el| el.postln});
	MFdef(\sol_accel_z).disable(\post);
	MFdef(\sol_accel_z).add( \acid_freq, { |el|
		Ndef(\acidSol ).set( \rel, el.value * 1.2 )
	} );
	// MFdef(\fa_accel_z).remove( \acid_freq );

	q.lilassi.mktl.elAt( \accel, \z ).action = {|el| MFdef(\si_accel_z).value(el.value) };
	MFdef(\si_accel_z).add(\post, {|el| el.postln});
	MFdef(\si_accel_z).remove(\post);
	MFdef(\si_accel_z).add( \acid_freq, { |el|
		Ndef(\acidSi ).set( \rel, el.value )
	} );

	//////////////////////////////////// RESONANCE ////////////////////////////////////////////

	q.vermelhodo1.mktl.elAt( \gyro, \roll ).action = { |el| MFdef(\do_gyro_roll).value(el.value) };
	MFdef(\do_gyro_roll).add(\post, {|el| (el.value).abs.postln }); MFdef(\do_gyro_roll).disable(\post);
	MFdef(\do_gyro_roll).add( \acid_dist, { |el|
		Ndef(\acidDo ).set(
			\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 3, 0.25, 0.75).lag(0.4),
			\reso, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 3, 0.25, 0.75).lag(0.4)  )
	} );

	q.laranjare.mktl.elAt( \gyro, \roll  ).action = { |el| MFdef(\re_gyro_roll).value(el.value) };
	MFdef(\re_gyro_roll).add(\post, {|el| el.postln}); MFdef(\re_gyro_roll).disable(\post);
	MFdef(\re_gyro_roll).add( \acid_dist, { |el|
		Ndef(\acidRe ).set(
			\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.4),
			\reso, (el.value * 1.25).clip2(0.75).lag(0.4)  )
	} );

	q.amarelomi.mktl.elAt( \gyro, \roll  ).action = { |el| MFdef(\mi_gyro_roll).value(el.value) };
	MFdef(\mi_gyro_roll).add(\post, {|el| el.postln}); MFdef(\mi_gyro_roll).disable(\post);
	MFdef(\mi_gyro_roll).add( \acid_dist, { |el|
		Ndef(\acidMi ).set(
			\dist, (el.value * 1.5).clip2(0.75).lag(0.4),
			\reso, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.4)  )
	} );

	q.verdefa1.mktl.elAt( \gyro, \roll  ).action = { |el| MFdef(\fa_gyro_roll).value(el.value) };
	MFdef(\fa_gyro_roll).add(\post, {|el| el.postln});
	MFdef(\fa_gyro_roll).disable(\post);
	MFdef(\fa_gyro_roll).add( \acid_dist, { |el|
		Ndef(\acidFa ).set(
			\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.4),
			\reso, (el.value * 1.2).softclip(0.8).lag(0.4)  )
	} );

	q.verdesol.mktl.elAt( \gyro, \roll  ).action = {|el| MFdef(\sol_gyro_roll).value(el.value) };
	MFdef(\sol_gyro_roll).add(\post, {|el| el.postln});
	MFdef(\sol_gyro_roll).disable(\post);
	MFdef(\sol_gyro_roll).add( \acid_dist, { |el|
		Ndef(\acidSol ).set(
			\dist, (el.value).softclip(0.9).lag(0.4),
			\reso, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.4)  )
	} );

	q.lilassi.mktl.elAt( \gyro, \roll  ).action = {|el| MFdef(\si_gyro_roll).value(el.value) };
	MFdef(\si_gyro_roll).add(\post, {|el| el.postln}); MFdef(\si_gyro_roll).disable(\post);
	MFdef(\si_gyro_roll).add( \acid_dist, { |el|
		Ndef(\acidSi ).set(
			\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.4),
			\reso, (el.value).softclip(0.75).lag(0.4) )
	} );

	////////////////////////////////////////////// MOV 3 //////////////////////////////////////////

		/////////////////////////////////// NOTES AND TRIGGERS //////////////////////////////

	MFdef(\do_gyro_yaw).disable( \acid_freq);
	MFdef(\do_gyro_yaw).add( \tunel_freq, { |el|
		var key = ( el.value * 8 - 24 ).asInteger;
		q.tunel.put(8, [\freq, q.scale.degreeToFreq( -10 , 69.midicps, 1), \att, 4, \rel, 4])
	} );
	// MFdef(\do_gyro_yaw).enable( \acid_freq );

	MFdef(\re_gyro_yaw).disable( \acid_freq);
	MFdef(\re_gyro_yaw).add( \tunel_freq, { |el|
		Ndef(\tunelRe ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 20 ).asInteger , 69.midicps, 1) )
	} );
	// MFdef(\re_gyro_yaw).remove( \acid_freq );

	MFdef(\mi_gyro_yaw).disable( \acid_freq);
	MFdef(\mi_gyro_yaw).add( \tunel_freq, { |el|
		Ndef(\tunelMi ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 16 ).asInteger , 69.midicps, 1) )
	} );
	// MFdef(\mi_gyro_yaw).remove( \tunel_freq );

	MFdef(\fa_gyro_yaw).disable( \acid_freq);
	MFdef(\fa_gyro_yaw).add( \tunel_freq, { |el|
		Ndef(\tunelFa ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 12 ).asInteger , 69.midicps, 1) )
	} );
	// MFdef(\fa_gyro_yaw).remove( \tunel_freq );

	MFdef(\sol_gyro_yaw).disable( \acid_freq);
	MFdef(\sol_gyro_yaw).add( \tunel_freq, { |el|
		Ndef(\tunelSol ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 8 ).asInteger , 69.midicps, 1) )
	} );
	// MFdef(\sol_gyro_yaw).remove( \tunel_freq );

	MFdef(\si_gyro_yaw).disable( \acid_freq);
	MFdef(\si_gyro_yaw).add( \tunel_freq, { |el|
		Ndef(\tunelSi ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 4 ).asInteger , 69.midicps, 1), \wform, 1 - el.value.lag(0.1) )
	} );
	// MFdef(\si_gyro_yaw).remove( \tunel_freq );

///////////////////////////////////////////////// ATTACK /////////////////////////////////////////////////////

	q.vermelhodo1.mktl.elAt( \accel, \y).action = { |el| MFdef(\do_accel_y).value(el.value) };
	MFdef(\do_accel_y).add(\post, {|el| (el.value - 0.5).abs.postln }); MFdef(\do_accel_y).disable(\post);
	MFdef(\do_accel_y).add( \tunel_attack, { |el|
		Ndef(\tunelDo ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\do_accel_y).remove( \tunel_freq );

	q.laranjare.mktl.elAt( \accel, \y ).action = { |el| MFdef(\re_accel_y).value(el.value) };
	MFdef(\re_accel_y).add(\post, {|el| el.postln}); MFdef(\re_accel_y).disable(\post);
	MFdef(\re_accel_y).add( \tunel_attack, { |el|
		Ndef(\tunelRe ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\re_accel_y).remove( \tunel_freq );

	q.amarelomi.mktl.elAt( \accel, \y ).action = { |el| MFdef(\mi_accel_y).value(el.value) };
	MFdef(\mi_accel_y).add(\post, {|el| el.postln}); MFdef(\mi_accel_y).disable(\post);
	MFdef(\mi_accel_y).add( \tunel_attack, { |el|
		Ndef(\tunelMi ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\mi_accel_y).remove( \tunel_freq );

	q.verdefa1.mktl.elAt( \accel, \y ).action = { |el| MFdef(\fa_accel_y).value(el.value) };
	MFdef(\fa_accel_y).add(\post, {|el| el.postln});
	MFdef(\fa_accel_y).disable(\post);
	MFdef(\fa_accel_y).add( \tunel_attack, { |el|
		Ndef(\tunelFa ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\fa_accel_y).remove( \tunel_freq );

	q.verdesol.mktl.elAt( \accel, \y ).action = {|el| MFdef(\sol_accel_y).value(el.value) };
	MFdef(\sol_accel_y).add(\post, {|el| el.postln});
	MFdef(\sol_accel_y).disable(\post);
	MFdef(\sol_accel_y).add( \tunel_attack, { |el|
		Ndef(\tunelSol ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\si_accel_y).remove( \tunel_freq );

	q.lilassi.mktl.elAt( \accel, \y ).action = {|el| MFdef(\si_accel_y).value(el.value) };
	MFdef(\si_accel_y).add(\post, {|el| el.postln});
	MFdef(\si_accel_y).remove(\post);
	MFdef(\si_accel_y).add( \tunel_attack, { |el|
		Ndef(\tunelSi ).set( \att, (el.value - 0.5).abs )
	} );

	///////////////////////////////////////// RELEASE ////////////////////////////////////////////////////

	q.vermelhodo1.mktl.elAt( \accel, \z).action = { |el| MFdef(\do_accel_z).value(el.value) };
	MFdef(\do_accel_z).add(\post, {|el| (el.value).abs.postln }); MFdef(\do_accel_z).disable(\post);
	MFdef(\do_accel_z).add( \tunel_freq, { |el|
		Ndef(\tunelDo ).set( \rel, el.value * 2 )
	} );
	// MFdef(\do_accel_z).remove( \tunel_freq );

	q.laranjare.mktl.elAt( \accel, \z ).action = { |el| MFdef(\re_accel_z).value(el.value) };
	MFdef(\re_accel_z).add(\post, {|el| el.postln}); MFdef(\re_accel_z).disable(\post);
	MFdef(\re_accel_z).add( \tunel_freq, { |el|
		Ndef(\tunelRe ).set( \rel, el.value * 1.8 )
	} );
	// MFdef(\re_accel_z).remove( \tunel_freq );

	q.amarelomi.mktl.elAt( \accel, \z ).action = { |el| MFdef(\mi_accel_z).value(el.value) };
	MFdef(\mi_accel_z).add(\post, {|el| el.postln}); MFdef(\mi_accel_z).disable(\post);
	MFdef(\mi_accel_z).add( \tunel_freq, { |el|
		Ndef(\tunelMi ).set( \rel, el.value * 1.6 )
	} );
	// MFdef(\mi_accel_z).remove( \tunel_freq );

	q.verdefa1.mktl.elAt( \accel, \z ).action = { |el| MFdef(\fa_accel_z).value(el.value) };
	MFdef(\fa_accel_z).add(\post, {|el| el.postln});
	MFdef(\fa_accel_z).disable(\post);
	MFdef(\fa_accel_z).add( \tunel_freq, { |el|
		Ndef(\tunelFa ).set( \rel, el.value * 1.4 )
	} );
	// MFdef(\fa_accel_z).remove( \tunel_freq );

	q.verdesol.mktl.elAt( \accel, \z ).action = {|el| MFdef(\sol_accel_z).value(el.value) };
	MFdef(\sol_accel_z).add(\post, {|el| el.postln});
	MFdef(\sol_accel_z).disable(\post);
	MFdef(\sol_accel_z).add( \tunel_freq, { |el|
		Ndef(\tunelSol ).set( \rel, el.value * 1.2 )
	} );
	// MFdef(\fa_accel_z).remove( \tunel_freq );

	q.lilassi.mktl.elAt( \accel, \z ).action = {|el| MFdef(\si_accel_z).value(el.value) };
	MFdef(\si_accel_z).add(\post, {|el| el.postln});
	MFdef(\si_accel_z).remove(\post);
	MFdef(\si_accel_z).add( \tunel_freq, { |el|
		Ndef(\tunelSi ).set( \rel, el.value )
	} );

	//////////////////////////////////// RESONANCE ////////////////////////////////////////////

	q.vermelhodo1.mktl.elAt( \gyro, \roll ).action = { |el| MFdef(\do_gyro_roll).value(el.value) };
	MFdef(\do_gyro_roll).add(\post, {|el| (el.value).abs.postln }); MFdef(\do_gyro_roll).disable(\post);
	MFdef(\do_gyro_roll).add( \tunel_dist, { |el|
		Ndef(\tunelDo ).set(
			\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 3, 0.25, 0.75).lag(0.4),
			\reso, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 3, 0.25, 0.75).lag(0.4)  )
	} );

	q.laranjare.mktl.elAt( \gyro, \roll  ).action = { |el| MFdef(\re_gyro_roll).value(el.value) };
	MFdef(\re_gyro_roll).add(\post, {|el| el.postln}); MFdef(\re_gyro_roll).disable(\post);
	MFdef(\re_gyro_roll).add( \tunel_dist, { |el|
		Ndef(\tunelRe ).set(
			\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.4),
			\reso, (el.value * 1.25).clip2(0.75).lag(0.4)  )
	} );

	q.amarelomi.mktl.elAt( \gyro, \roll  ).action = { |el| MFdef(\mi_gyro_roll).value(el.value) };
	MFdef(\mi_gyro_roll).add(\post, {|el| el.postln}); MFdef(\mi_gyro_roll).disable(\post);
	MFdef(\mi_gyro_roll).add( \tunel_dist, { |el|
		Ndef(\tunelMi ).set(
			\dist, (el.value * 1.5).clip2(0.75).lag(0.4),
			\reso, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.4)  )
	} );

	q.verdefa1.mktl.elAt( \gyro, \roll  ).action = { |el| MFdef(\fa_gyro_roll).value(el.value) };
	MFdef(\fa_gyro_roll).add(\post, {|el| el.postln});
	MFdef(\fa_gyro_roll).disable(\post);
	MFdef(\fa_gyro_roll).add( \tunel_dist, { |el|
		Ndef(\tunelFa ).set(
			\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.4),
			\reso, (el.value * 1.2).softclip(0.8).lag(0.4)  )
	} );

	q.verdesol.mktl.elAt( \gyro, \roll  ).action = {|el| MFdef(\sol_gyro_roll).value(el.value) };
	MFdef(\sol_gyro_roll).add(\post, {|el| el.postln});
	MFdef(\sol_gyro_roll).disable(\post);
	MFdef(\sol_gyro_roll).add( \tunel_dist, { |el|
		Ndef(\tunelSol ).set(
			\dist, (el.value).softclip(0.9).lag(0.4),
			\reso, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.4)  )
	} );

	q.lilassi.mktl.elAt( \gyro, \roll  ).action = {|el| MFdef(\si_gyro_roll).value(el.value) };
	MFdef(\si_gyro_roll).add(\post, {|el| el.postln}); MFdef(\si_gyro_roll).disable(\post);
	MFdef(\si_gyro_roll).add( \tunel_dist, { |el|
		Ndef(\tunelSi ).set(
			\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.4),
			\reso, (el.value).softclip(0.75).lag(0.4) )
	} );



};
/*(
q.lilassi.mktl.elAt(\accel, \z).resetAction;
q.lilassi.mktl.elAt(\accel, \z).action = { |el|
Ndef(\triggers).set(\tlilassi, el.value)
// el.value.postln
};
)*/
