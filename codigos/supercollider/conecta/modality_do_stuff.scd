fork{

	q.vermelhodo1.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\do_gyro_yaw).value(el.value) };
	q.laranjare.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\re_gyro_yaw).value(el.value) };
	q.amarelomi.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\mi_gyro_yaw).value(el.value) };
	q.verdefa1.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\fa_gyro_yaw).value(el.value) };
	q.verdesol.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\sol_gyro_yaw).value(el.value) };
	q.lilassi.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\si_gyro_yaw).value(el.value) };

	q.vermelhodo1.mktl.elAt( \gyro, \pitch).action = {|el| MFdef(\do_gyro_pitch).value(el.value) };
	q.laranjare.mktl.elAt( \gyro, \pitch).action = {|el| MFdef(\re_gyro_pitch).value(el.value) };
	q.amarelomi.mktl.elAt( \gyro, \pitch).action = {|el| MFdef(\mi_gyro_pitch).value(el.value) };
	q.verdefa1.mktl.elAt( \gyro, \pitch).action = {|el| MFdef(\fa_gyro_pitch).value(el.value) };
	q.verdesol.mktl.elAt( \gyro, \pitch).action = {|el| MFdef(\sol_gyro_pitch).value(el.value) };
	q.lilassi.mktl.elAt( \gyro, \pitch).action = {|el| MFdef(\si_gyro_pitch).value(el.value) };

	q.vermelhodo1.mktl.elAt( \gyro, \roll).action = {|el| MFdef(\do_gyro_roll).value(el.value) };
	q.laranjare.mktl.elAt( \gyro, \roll).action = {|el| MFdef(\re_gyro_roll).value(el.value) };
	q.amarelomi.mktl.elAt( \gyro, \roll).action = {|el| MFdef(\mi_gyro_roll).value(el.value) };
	q.verdefa1.mktl.elAt( \gyro, \roll).action = {|el| MFdef(\fa_gyro_roll).value(el.value) };
	q.verdesol.mktl.elAt( \gyro, \roll).action = {|el| MFdef(\sol_gyro_roll).value(el.value) };
	q.lilassi.mktl.elAt( \gyro, \roll).action = {|el| MFdef(\si_gyro_roll).value(el.value) };

	q.vermelhodo1.mktl.elAt( \accel, \x).action = { |el| MFdef(\do_accel_x).value(el.value) };
	q.laranjare.mktl.elAt( \accel, \x ).action = { |el| MFdef(\re_accel_x).value(el.value) };
	q.amarelomi.mktl.elAt( \accel, \x ).action = { |el| MFdef(\mi_accel_x).value(el.value) };
	q.verdefa1.mktl.elAt( \accel, \x ).action = { |el| MFdef(\fa_accel_x).value(el.value) };
	q.verdesol.mktl.elAt( \accel, \x ).action = {|el| MFdef(\sol_accel_x).value(el.value) };
	q.lilassi.mktl.elAt( \accel, \x ).action = {|el| MFdef(\si_accel_x).value(el.value) };

	q.vermelhodo1.mktl.elAt( \accel, \y).action = { |el| MFdef(\do_accel_y).value(el.value) };
	q.laranjare.mktl.elAt( \accel, \y ).action = { |el| MFdef(\re_accel_y).value(el.value) };
	q.amarelomi.mktl.elAt( \accel, \y ).action = { |el| MFdef(\mi_accel_y).value(el.value) };
	q.verdefa1.mktl.elAt( \accel, \y ).action = { |el| MFdef(\fa_accel_y).value(el.value) };
	q.verdesol.mktl.elAt( \accel, \y ).action = {|el| MFdef(\sol_accel_y).value(el.value) };
	q.lilassi.mktl.elAt( \accel, \y ).action = {|el| MFdef(\si_accel_y).value(el.value) };

	q.vermelhodo1.mktl.elAt( \accel, \z).action = { |el| MFdef(\do_accel_z).value(el.value) };
	/*q.vermelhodo1.mktl.elAt( \accel, \z).resetAction; q.vermelhodo2.mktl.elAt( \accel, \z).action = { |el| MFdef(\do_accel_z).value(el.value) };*/
	q.laranjare.mktl.elAt( \accel, \z ).action = { |el| MFdef(\re_accel_z).value(el.value) };
	q.amarelomi.mktl.elAt( \accel, \z ).action = { |el| MFdef(\mi_accel_z).value(el.value) };
	q.verdefa1.mktl.elAt( \accel, \z ).action = { |el| MFdef(\fa_accel_z).value(el.value) };
	/*q.verdefa1.mktl.elAt( \accel, \z ).resetAction;
	q.verdefa2.mktl.elAt( \accel, \z ).action = { |el| MFdef(\fa_accel_z).value(el.value) };*/
	q.verdesol.mktl.elAt( \accel, \z ).action = {|el| MFdef(\sol_accel_z).value(el.value) };
	q.lilassi.mktl.elAt( \accel, \z ).action = {|el| MFdef(\si_accel_z).value(el.value) };

	0.2.wait;

	// MOV 1

	(
		[
			[ MFdef(\do_accel_z), \tvermelhodo ],
			[ MFdef(\re_accel_z), \tlaranjare ],
			[ MFdef(\mi_accel_z), \tamarelomi ],
			[ MFdef(\fa_accel_z), \tverdefa1 ],
			[ MFdef(\sol_accel_z), \tverdesol ],
			[ MFdef(\si_accel_z), \tlilassi ],
		].collect{ |v|
			v[0].add(\trigs, { |el|	Ndef(\trigs_mov1).set( v[1], el.value ) })
			// v[0].enable(\trigs)
		}
	);

	(
		[
			[ MFdef(\do_gyro_roll), q.vermelhodo1.pxChain ],
			[ MFdef(\re_gyro_roll), q.laranjare.pxChain ],
			[ MFdef(\mi_gyro_roll), q.amarelomi.pxChain ],
			[ MFdef(\fa_gyro_roll), q.verdefa1.pxChain ],
			[ MFdef(\sol_gyro_roll), q.verdesol.pxChain ],
			[ MFdef(\si_gyro_roll), q.lilassi.pxChain ],
		].collect{ |v|
			v[0].add(\lpf, { |el|
				v[1].set( \freq, ((el.value + 0.5 % 1).linlin(0, 1, -pi, pi).sin + 2).linexp(1, 2, 160, 20000).lag3(0.4) )
			})
			// v[0].enable(\lpf)
		}
	);

	//////////////////////////////////////////////////

	// MOV 2 /////////////////////////////////

	// NOTES, TRIGGERS + WAVEFORM //////////////////////////////

	(
		[
			[ MFdef(\do_gyro_yaw), Ndef(\acidDo), 12 ],
			[ MFdef(\re_gyro_yaw), Ndef(\acidRe), 10 ],
			[ MFdef(\mi_gyro_yaw), Ndef(\acidMi), 8 ],
			[ MFdef(\fa_gyro_yaw), Ndef(\acidFa), 6 ],
			[ MFdef(\sol_gyro_yaw), Ndef(\acidSol), 4 ],
			[ MFdef(\si_gyro_yaw), Ndef(\acidSi), 2 ],
		].collect{ |v|
			v[0].add(\notes, { |el|
				v[1].set( \freq, q.scale.degreeToFreq(( el.value * 13 ).asInteger , 69.midicps, 0) );
			});
			v[0].add(\waveform, { |el|
				v[1].set( \wform, el.value.lag(0.1) );
			});
		}
	);

	// ATTACK /////////////////////////////////////////////////////

	(
		[
			[ MFdef(\do_accel_y), Ndef(\acidDo) ],
			[ MFdef(\re_accel_y), Ndef(\acidRe) ],
			[ MFdef(\mi_accel_y), Ndef(\acidMi) ],
			[ MFdef(\fa_accel_y), Ndef(\acidFa) ],
			[ MFdef(\sol_accel_y), Ndef(\acidSol) ],
			[ MFdef(\si_accel_y), Ndef(\acidSi) ],
		].collect{ |v|
			v[0].add(\attack, { |el|
				v[1].set( \att, (el.value - 0.5).abs );
			});
		}
	);

	// RELEASE ////////////////////////////////////////////////////

	(
		[
			[ MFdef(\do_accel_z), Ndef(\acidDo), 2 ],
			[ MFdef(\re_accel_z), Ndef(\acidRe), 1.8 ],
			[ MFdef(\mi_accel_z), Ndef(\acidMi), 1.6 ],
			[ MFdef(\fa_accel_z), Ndef(\acidFa), 1.4 ],
			[ MFdef(\sol_accel_z), Ndef(\acidSol), 1.2 ],
			[ MFdef(\si_accel_z), Ndef(\acidSi), 1 ],
		].collect{ |v|
			v[0].add(\release, { |el|
				v[1].set( \rel, el.value * v[2] );
			});
		}
	);

	// DISTORTION & RESONANCE //////////////////////////////////////

	(
		MFdef(\do_gyro_roll).add(\dist_reso, { |el|
			Ndef(\acidDo).set(
				\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 3, 0.25, 0.75).lag(0.2),
				\reso, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 3, 0.25, 0.75).lag(0.2)
			);
		});
		MFdef(\re_gyro_roll).add(\dist_reso, { |el|
			Ndef(\acidRe).set(
				\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.2),
				\reso, (el.value * 1.25).clip2(0.75).lag(0.4)
			);
		});
		MFdef(\mi_gyro_roll).add(\dist_reso, { |el|
			Ndef(\acidMi).set(
				\dist, (el.value * 1.5).clip2(0.75).lag(0.4),
				\reso, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.7).lag(0.2)
			);
		});
		MFdef(\fa_gyro_roll).add(\dist_reso, { |el|
			Ndef(\acidFa).set(
				\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.7).lag(0.2),
				\reso, (el.value * 1.2).softclip(0.8).lag(0.4)
			);
		});
		MFdef(\sol_gyro_roll).add(\dist_reso, { |el|
			Ndef(\acidSol).set(
				\dist, (el.value).softclip(0.9).lag(0.4),
				\reso, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.2)
			);
		});
		MFdef(\si_gyro_roll).add(\dist_reso, { |el|
			Ndef(\acidSi).set(
				\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.2),
				\reso, (el.value).softclip(0.75).lag(0.4)
			);
		});
	);

	//////////////////////////////////////////////////

	// MOV 3

	// trigger ///////////////////////////////////////
	[
		[ MFdef(\do_gyro_yaw), \degdo1 ],
		[ MFdef(\re_gyro_yaw), \degre ],
		[ MFdef(\mi_gyro_yaw), \degmi ],
		[ MFdef(\fa_gyro_yaw), \degfa1 ],
		[ MFdef(\sol_gyro_yaw), \degsol ],
		[ MFdef(\si_gyro_yaw), \degsi ],
	].collect{ |v|
		v[0].add( \trigs, { |el| Ndef(\trigs_mov3).set(v[1], ( el.value * 8 ).asInteger) } );
	};

	// ATTACK
	[
		[ MFdef(\do_accel_y), \attdo1, 4, 1, -4 ],
		[ MFdef(\re_accel_y), \attre, 3, 0.5, -4 ],
		[ MFdef(\mi_accel_y), \attmi, 2, 0.25, -4 ],
		[ MFdef(\fa_accel_y), \attfa1, 1, 0.125, 4 ],
		[ MFdef(\sol_accel_y), \attsol, 0.5, 0.125, 4 ],
		[ MFdef(\si_accel_y), \attsi, 0.26, 0.06, 4 ],
	].collect{ |v|
		v[0].add( \attack, { |el|
			Ndef(\trigs_mov3).set( v[1], (el.value - 0.5).abs.lincurve(0, 0.25, v[2], v[3], v[4]) );
			v[0].enable( \attack )
		} )
	};

	// (0,0.01..0.5).lincurve(0, 0.25,  0.125, 0.0625, -6).plot;

	// RELEASE
	[
		[ MFdef(\do_accel_z), \reldo1, 2, 1, -5 ],
		[ MFdef(\re_accel_z), \relre, 1.5, 0.75, -4 ],
		[ MFdef(\mi_accel_z), \relmi, 1, 0.5, -4 ],
		[ MFdef(\fa_accel_z), \relfa1, 0.5, 0.25, 5 ],
		[ MFdef(\sol_accel_z), \relsol, 0.25, 0.125, 6 ],
		[ MFdef(\si_accel_z), \relsi, 0.125, 0.0625, 8 ],
	].collect{ |v|
		v[0].add( \release, { |el|
			Ndef(\trigs_mov3).set( v[1], (el.value - 0.5).abs.lincurve(0, 0.5, v[2], v[3], v[4]) );
			v[0].enable( \release )
		} )
	};

// Modulation Freq
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

	// DownSampling
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

	// ((0.00, 0.01..1).linlin(0, 1, -pi, pi).sin + 2).linlin(1, 3, 0.02, 2).plot

};
