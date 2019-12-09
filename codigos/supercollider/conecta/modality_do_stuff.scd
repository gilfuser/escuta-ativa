fork{

	q.vermelhodo1.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\do_gyro_yaw).value(el.value) };
	q.laranjare.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\re_gyro_yaw).value(el.value) };
	q.amarelomi.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\mi_gyro_yaw).value(el.value) };
	q.verdefa1.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\fa_gyro_yaw).value(el.value) };
	q.verdesol.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\sol_gyro_yaw).value(el.value) };
	q.lilassi.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\si_gyro_yaw).value(el.value) };

	q.vermelhodo1.mktl.elAt( \accel, \y).action = { |el| MFdef(\do_accel_y).value(el.value) };
	q.laranjare.mktl.elAt( \accel, \y ).action = { |el| MFdef(\re_accel_y).value(el.value) };
	q.amarelomi.mktl.elAt( \accel, \y ).action = { |el| MFdef(\mi_accel_y).value(el.value) };
	q.verdefa1.mktl.elAt( \accel, \y ).action = { |el| MFdef(\fa_accel_y).value(el.value) };
	q.verdesol.mktl.elAt( \accel, \y ).action = {|el| MFdef(\sol_accel_y).value(el.value) };
	q.lilassi.mktl.elAt( \accel, \y ).action = {|el| MFdef(\si_accel_y).value(el.value) };

	q.vermelhodo1.mktl.elAt( \accel, \z).action = { |el| MFdef(\do_accel_z).value(el.value) };
	q.laranjare.mktl.elAt( \accel, \z ).action = { |el| MFdef(\re_accel_z).value(el.value) };
	q.amarelomi.mktl.elAt( \accel, \z ).action = { |el| MFdef(\mi_accel_z).value(el.value) };
	q.verdefa1.mktl.elAt( \accel, \z ).action = { |el| MFdef(\fa_accel_z).value(el.value) };
	q.verdesol.mktl.elAt( \accel, \z ).action = {|el| MFdef(\sol_accel_z).value(el.value) };
	q.lilassi.mktl.elAt( \accel, \z ).action = {|el| MFdef(\si_accel_z).value(el.value) };

	q.scale = Scale.at(\lydianMinor);
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
		Ndef(\trigs_mov1).set( v[1], el.value )
	}};

	//////////////////////////////////////////////////

	// trigger instruments

	[
		[ MFdef(\do_gyro_yaw), \degdo1 ],
		[ MFdef(\re_gyro_yaw), \degre ],
		[ MFdef(\mi_gyro_yaw), \degmi ],
		[ MFdef(\fa_gyro_yaw), \degfa1 ],
		[ MFdef(\sol_gyro_yaw), \degsol ],
		[ MFdef(\si_gyro_yaw), \degsi ],
	].collect{ |v|
		v[0].add( \trigs, { |el| Ndef(\trigs_movs2_3).set(v[1], ( el.value * 8 ).asInteger) } )
	};

	[
		[ MFdef(\do_gyro_yaw), \degdo1 ],
		[ MFdef(\re_gyro_yaw), \degre ],
		[ MFdef(\mi_gyro_yaw), \degmi ],
		[ MFdef(\fa_gyro_yaw), \degfa1 ],
		[ MFdef(\sol_gyro_yaw), \degsol ],
		[ MFdef(\si_gyro_yaw), \degsi ],
	].collect{ |v|
		v[0].disable( \trigs)
	};

	////////////////////////////////////////////////

	[
		[ MFdef(\do_accel_y), \attdo1, 4, 1, -4 ],
		[ MFdef(\re_accel_y), \attre, 3, 0.5, -4 ],
		[ MFdef(\mi_accel_y), \attmi, 2, 0.25, -4 ],
		[ MFdef(\fa_accel_y), \attfa1, 1, 0.125, 4 ],
		[ MFdef(\sol_accel_y), \attsol, 0.5, 0.125, 4 ],
		[ MFdef(\si_accel_y), \attsi, 0.26, 0.06, 4 ],
	].collect{ |v|
		v[0].add( \attack, { |el|
			Ndef(\trigs_movs2_3).set( v[1], (el.value - 0.5).abs.lincurve(0, 0.25, v[2], v[3], v[4]) );
	} )
	};

	(0,0.01..0.5).lincurve(0, 0.25,  0.125, 0.0625, -6).plot;

	[
		[ MFdef(\do_accel_y), \attdo1 ],
		[ MFdef(\re_accel_y), \attre ],
		[ MFdef(\mi_accel_y), \attmi ],
		[ MFdef(\fa_accel_y), \attfa1 ],
		[ MFdef(\sol_accel_y), \attsol ],
		[ MFdef(\si_accel_y), \attsi ],
	].collect{ |v|
		v[0].enable( \attack )
	};

	/////////////////////////////////////////////////

	[
		[ MFdef(\do_accel_z), \reldo1, 2, 1, -5 ],
		[ MFdef(\re_accel_z), \relre, 1.5, 0.75, -4 ],
		[ MFdef(\mi_accel_z), \relmi, 1, 0.5, -4 ],
		[ MFdef(\fa_accel_z), \relfa1, 0.5, 0.25, 5 ],
		[ MFdef(\sol_accel_z), \relsol, 0.25, 0.125, 6 ],
		[ MFdef(\si_accel_z), \relsi, 0.125, 0.0625, 8 ],
	].collect{ |v|
		v[0].add( \release, { |el|
			Ndef(\trigs_movs2_3).set( v[1], (el.value - 0.5).abs.lincurve(0, 0.5, v[2], v[3], v[4]) );
		} )
	};

	[
		[ MFdef(\do_accel_z), \reldo1 ],
		[ MFdef(\re_accel_z), \relre ],
		[ MFdef(\mi_accel_z), \relmi ],
		[ MFdef(\fa_accel_z), \relfa1 ],
		[ MFdef(\sol_accel_z), \relsol ],
		[ MFdef(\si_accel_z), \relsi ],
	].collect{ |v|
		v[0].enable( \release )
	};

	q.vermelhodo1.mktl.elAt( \gyro, \pitch ).action = { |el| MFdef(\do_gyro_pitch).value(el.value) };
	q.laranjare.mktl.elAt( \gyro, \pitch  ).action = { |el| MFdef(\re_gyro_pitch).value(el.value) };
	q.amarelomi.mktl.elAt( \gyro, \pitch  ).action = { |el| MFdef(\mi_gyro_pitch).value(el.value) };
	q.verdefa1.mktl.elAt( \gyro, \pitch  ).action = { |el| MFdef(\fa_gyro_pitch).value(el.value) };
	q.verdesol.mktl.elAt( \gyro, \pitch  ).action = {|el| MFdef(\sol_gyro_pitch).value(el.value) };
	q.lilassi.mktl.elAt( \gyro, \pitch  ).action = {|el| MFdef(\si_gyro_pitch).value(el.value) };


	[
		[ MFdef(\do_gyro_pitch), q.vermelhodo1.tunel ],
		[ MFdef(\re_gyro_pitch), q.laranjare.tunel ],
		[ MFdef(\mi_gyro_pitch), q.amarelomi.tunel ],
		[ MFdef(\fa_gyro_pitch), q.verdefa1.tunel ],
		[ MFdef(\sol_gyro_pitch), q.verdesol.tunel ],
		[ MFdef(\si_gyro_pitch), q.lilassi.tunel ],
	].collect{ |v|
		v[0].add( \modFQ, { |el|
			v[1].set( \modFQ, ( (el.value + 0.5 % 1).linlin(0, 1, -pi, pi).sin + 2 ).linlin(1, 3, 0.5, 2) );
		} )
	};

	// ( (0,0.001..1).linlin(0, 1, -pi, pi).sin + 2 ).linlin(1, 3, 0.02, 2).plot

	q.vermelhodo1.mktl.elAt( \gyro, \roll ).action = { |el| MFdef(\do_gyro_roll).value(el.value) };
	q.laranjare.mktl.elAt( \gyro, \roll  ).action = { |el| MFdef(\re_gyro_roll).value(el.value) };
	q.amarelomi.mktl.elAt( \gyro, \roll  ).action = { |el| MFdef(\mi_gyro_roll).value(el.value) };
	q.verdefa1.mktl.elAt( \gyro, \roll  ).action = { |el| MFdef(\fa_gyro_roll).value(el.value) };
	q.verdesol.mktl.elAt( \gyro, \roll  ).action = {|el| MFdef(\sol_gyro_roll).value(el.value) };
	q.lilassi.mktl.elAt( \gyro, \roll  ).action = {|el| MFdef(\si_gyro_roll).value(el.value) };

		[
		[ MFdef(\do_gyro_roll), q.vermelhodo1.tunel ],
		[ MFdef(\re_gyro_roll), q.laranjare.tunel ],
		[ MFdef(\mi_gyro_roll), q.amarelomi.tunel ],
		[ MFdef(\fa_gyro_roll), q.verdefa1.tunel ],
		[ MFdef(\sol_gyro_roll), q.verdesol.tunel ],
		[ MFdef(\si_gyro_roll), q.lilassi.tunel ],
	].collect{ |v|
		v[0].add( \downsamp, { |el|
			v[1].set( \downsamp, ( (el.value + 0.5 % 1).linlin(0, 1, -pi, pi).sin + 2 ).linexp(1, 3, 1, 256).lag3(0.2) );
		} )
	};

///////////////////////////////////////// RELEASE ////////////////////////////////////////////////////

	MFdef(\do_accel_z).add(\post, {|el| (el.value).abs.postln }); MFdef(\do_accel_z).disable(\post);
	MFdef(\do_accel_z).add( \acid_freq, { |el|
		Ndef(\acidDo ).set( \rel, el.value * 2 )
	} );

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

	MFdef(\do_gyro_yaw).add(\post, {|el| el.postln});
	MFdef(\do_gyro_yaw).disable(\post);
	MFdef(\do_gyro_yaw).add( \acid_freq, { |el|
		Ndef(\acidDo ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 24 ).asInteger , 69.midicps, 1), \wform, el.value.lag(0.1) )
	} );
	// MFdef(\do_gyro_yaw).enable( \acid_freq );

	MFdef(\re_gyro_yaw).add(\post, {|el| el.postln});
	MFdef(\re_gyro_yaw).disable(\post);
	MFdef(\re_gyro_yaw).add( \acid_freq, { |el|
		Ndef(\acidRe ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 20 ).asInteger , 69.midicps, 1), \wform, 1 - el.value.lag(0.1) )
	} );
	// MFdef(\re_gyro_yaw).remove( \acid_freq );

	MFdef(\mi_gyro_yaw).add(\post, {|el| el.postln});
	MFdef(\mi_gyro_yaw).disable(\post);
	MFdef(\mi_gyro_yaw).add( \acid_freq, { |el|
		Ndef(\acidMi ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 16 ).asInteger , 69.midicps, 1), \wform, el.value.lag(0.1) )
	} );
	// MFdef(\mi_gyro_yaw).remove( \acid_freq );

	MFdef(\fa_gyro_yaw).add(\post, {|el| el.postln});
	MFdef(\fa_gyro_yaw).disable(\post);
	MFdef(\fa_gyro_yaw).add( \acid_freq, { |el|
		Ndef(\acidFa ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 12 ).asInteger , 69.midicps, 1), \wform, 1 - el.value.lag(0.1) )
	} );
	// MFdef(\fa_gyro_yaw).remove( \acid_freq );

	MFdef(\sol_gyro_yaw).add(\post, {|el| el.postln});
	MFdef(\sol_gyro_yaw).disable(\post);
	MFdef(\sol_gyro_yaw).add( \acid_freq, { |el|
		Ndef(\acidSol ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 8 ).asInteger , 69.midicps, 1), \wform, el.value.lag(0.1) )
	} );
	// MFdef(\sol_gyro_yaw).remove( \acid_freq );

	MFdef(\si_gyro_yaw).add(\post, {|el| el.postln});
	MFdef(\si_gyro_yaw).remove(\post);
	MFdef(\si_gyro_yaw).add( \acid_freq, { |el|
		Ndef(\acidSi ).set( \freq, q.scale.degreeToFreq(( el.value * 8 - 4 ).asInteger , 69.midicps, 1), \wform, 1 - el.value.lag(0.1) )
	} );
	// MFdef(\si_gyro_yaw).remove( \acid_freq );

///////////////////////////////////////////////// ATTACK /////////////////////////////////////////////////////

	MFdef(\do_accel_y).add(\post, {|el| (el.value - 0.5).abs.postln }); MFdef(\do_accel_y).disable(\post);
	MFdef(\do_accel_y).add( \acid_attack, { |el|
		Ndef(\acidDo ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\do_accel_y).remove( \acid_freq );

	MFdef(\re_accel_y).add(\post, {|el| el.postln}); MFdef(\re_accel_y).disable(\post);
	MFdef(\re_accel_y).add( \acid_attack, { |el|
		Ndef(\acidRe ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\re_accel_y).remove( \acid_freq );

	MFdef(\mi_accel_y).add(\post, {|el| el.postln}); MFdef(\mi_accel_y).disable(\post);
	MFdef(\mi_accel_y).add( \acid_attack, { |el|
		Ndef(\acidMi ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\mi_accel_y).remove( \acid_freq );

	MFdef(\fa_accel_y).add(\post, {|el| el.postln});
	MFdef(\fa_accel_y).disable(\post);
	MFdef(\fa_accel_y).add( \acid_attack, { |el|
		Ndef(\acidFa ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\fa_accel_y).remove( \acid_freq );

	MFdef(\sol_accel_y).add(\post, {|el| el.postln});
	MFdef(\sol_accel_y).disable(\post);
	MFdef(\sol_accel_y).add( \acid_attack, { |el|
		Ndef(\acidSol ).set( \att, (el.value - 0.5).abs )
	} );
	// MFdef(\si_accel_y).remove( \acid_freq );

	MFdef(\si_accel_y).add(\post, {|el| el.postln});
	MFdef(\si_accel_y).remove(\post);
	MFdef(\si_accel_y).add( \acid_attack, { |el|
		Ndef(\acidSi ).set( \att, (el.value - 0.5).abs )
	} );

	///////////////////////////////////////// RELEASE ////////////////////////////////////////////////////

	MFdef(\do_accel_z).add(\post, {|el| (el.value).abs.postln }); MFdef(\do_accel_z).disable(\post);
	MFdef(\do_accel_z).add( \acid_freq, { |el|
		Ndef(\acidDo ).set( \rel, el.value * 2 )
	} );
	// MFdef(\do_accel_z).remove( \acid_freq );

	MFdef(\re_accel_z).add(\post, {|el| el.postln}); MFdef(\re_accel_z).disable(\post);
	MFdef(\re_accel_z).add( \acid_freq, { |el|
		Ndef(\acidRe ).set( \rel, el.value * 1.8 )
	} );
	// MFdef(\re_accel_z).remove( \acid_freq );

	MFdef(\mi_accel_z).add(\post, {|el| el.postln}); MFdef(\mi_accel_z).disable(\post);
	MFdef(\mi_accel_z).add( \acid_freq, { |el|
		Ndef(\acidMi ).set( \rel, el.value * 1.6 )
	} );
	// MFdef(\mi_accel_z).remove( \acid_freq );

	MFdef(\fa_accel_z).add(\post, {|el| el.postln});
	MFdef(\fa_accel_z).disable(\post);
	MFdef(\fa_accel_z).add( \acid_freq, { |el|
		Ndef(\acidFa ).set( \rel, el.value * 1.4 )
	} );
	// MFdef(\fa_accel_z).remove( \acid_freq );

	MFdef(\sol_accel_z).add(\post, {|el| el.postln});
	MFdef(\sol_accel_z).disable(\post);
	MFdef(\sol_accel_z).add( \acid_freq, { |el|
		Ndef(\acidSol ).set( \rel, el.value * 1.2 )
	} );
	// MFdef(\fa_accel_z).remove( \acid_freq );

	MFdef(\si_accel_z).add(\post, {|el| el.postln});
	MFdef(\si_accel_z).remove(\post);
	MFdef(\si_accel_z).add( \acid_freq, { |el|
		Ndef(\acidSi ).set( \rel, el.value )
	} );

	//////////////////////////////////// RESONANCE ////////////////////////////////////////////

	MFdef(\do_gyro_roll).add(\post, {|el| (el.value).abs.postln }); MFdef(\do_gyro_roll).disable(\post);
	MFdef(\do_gyro_roll).add( \acid_dist, { |el|
		Ndef(\acidDo ).set(
			\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 3, 0.25, 0.75).lag(0.4),
			\reso, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 3, 0.25, 0.75).lag(0.4)  )
	} );

	MFdef(\re_gyro_roll).add(\post, {|el| el.postln}); MFdef(\re_gyro_roll).disable(\post);
	MFdef(\re_gyro_roll).add( \acid_dist, { |el|
		Ndef(\acidRe ).set(
			\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.4),
			\reso, (el.value * 1.25).clip2(0.75).lag(0.4)  )
	} );

	MFdef(\mi_gyro_roll).add(\post, {|el| el.postln}); MFdef(\mi_gyro_roll).disable(\post);
	MFdef(\mi_gyro_roll).add( \acid_dist, { |el|
		Ndef(\acidMi ).set(
			\dist, (el.value * 1.5).clip2(0.75).lag(0.4),
			\reso, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.4)  )
	} );

	MFdef(\fa_gyro_roll).add(\post, {|el| el.postln});
	MFdef(\fa_gyro_roll).disable(\post);
	MFdef(\fa_gyro_roll).add( \acid_dist, { |el|
		Ndef(\acidFa ).set(
			\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.4),
			\reso, (el.value * 1.2).softclip(0.8).lag(0.4)  )
	} );

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

};
