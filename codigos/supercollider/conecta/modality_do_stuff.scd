fork{
	(
		q.vermelhodo.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\do_gyro_yaw).value(el.value) };
		// q.vermelhodo.mktl.elAt( \gyro, \yaw).resetAction; q.vermelhodo.mktl2.elAt( \gyro, \yaw).action = {|el| MFdef(\do_gyro_yaw).value(el.value) };
		q.laranjare.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\re_gyro_yaw).value(el.value) };
		q.amarelomi.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\mi_gyro_yaw).value(el.value) };
		q.verdefa.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\fa_gyro_yaw).value(el.value) };
		// q.verdefa.mktl.elAt( \gyro, \yaw).resetAction; q.verdefa.mktl2.elAt( \gyro, \yaw).action = {|el| MFdef(\fa_gyro_yaw).value(el.value) };
		q.verdesol.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\sol_gyro_yaw).value(el.value) };
		q.lilassi.mktl.elAt( \gyro, \yaw).action = {|el| MFdef(\si_gyro_yaw).value(el.value) };

		q.vermelhodo.mktl.elAt( \gyro, \pitch).action = {|el| MFdef(\do_gyro_pitch).value(el.value) };
		// q.vermelhodo.mktl.elAt( \gyro, \pitch).resetAction; q.vermelhodo.mktl2.elAt( \gyro, \pitch).action = {|el| MFdef(\do_gyro_pitch).value(el.value) };
		q.laranjare.mktl.elAt( \gyro, \pitch).action = {|el| MFdef(\re_gyro_pitch).value(el.value) };
		q.amarelomi.mktl.elAt( \gyro, \pitch).action = {|el| MFdef(\mi_gyro_pitch).value(el.value) };
		q.verdefa.mktl.elAt( \gyro, \pitch).action = {|el| MFdef(\fa_gyro_pitch).value(el.value) };
		// q.verdefa.mktl2.elAt( \gyro, \pitch).action = {|el| MFdef(\fa_gyro_pitch).value(el.value) };
		q.verdesol.mktl.elAt( \gyro, \pitch).action = {|el| MFdef(\sol_gyro_pitch).value(el.value) };
		q.lilassi.mktl.elAt( \gyro, \pitch).action = {|el| MFdef(\si_gyro_pitch).value(el.value) };

		q.vermelhodo.mktl.elAt( \gyro, \roll).action = {|el| MFdef(\do_gyro_roll).value(el.value) };
		// q.vermelhodo.mktl.elAt( \gyro, \roll).resetAction; q.vermelhodo.mktl2.elAt( \gyro, \roll).action = {|el| MFdef(\do_gyro_roll).value(el.value) };
		q.laranjare.mktl.elAt( \gyro, \roll).action = {|el| MFdef(\re_gyro_roll).value(el.value) };
		q.amarelomi.mktl.elAt( \gyro, \roll).action = {|el| MFdef(\mi_gyro_roll).value(el.value) };
		q.verdefa.mktl.elAt( \gyro, \roll).action = {|el| MFdef(\fa_gyro_roll).value(el.value) };
		// q.verdefa.mktl.elAt( \gyro, \roll).resetAction; q.verdefa.mktl2.elAt( \gyro, \roll).action = {|el| MFdef(\fa_gyro_roll).value(el.value) };
		q.verdesol.mktl.elAt( \gyro, \roll).action = {|el| MFdef(\sol_gyro_roll).value(el.value) };
		q.lilassi.mktl.elAt( \gyro, \roll).action = {|el| MFdef(\si_gyro_roll).value(el.value) };

		q.vermelhodo.mktl.elAt( \accel, \x).action = { |el| MFdef(\do_accel_x).value(el.value) };
		// q.vermelhodo.mktl.elAt( \accel, \x).resetAction; q.vermelhodo.mktl2.elAt( \accel, \x).action = { |el| MFdef(\do_accel_x).value(el.value) };
		q.laranjare.mktl.elAt( \accel, \x ).action = { |el| MFdef(\re_accel_x).value(el.value) };
		q.amarelomi.mktl.elAt( \accel, \x ).action = { |el| MFdef(\mi_accel_x).value(el.value) };
		q.verdefa.mktl.elAt( \accel, \x ).action = { |el| MFdef(\fa_accel_x).value(el.value) };
		// q.verdefa.mktl.elAt( \accel, \x ).resetAction; q.verdefa.mktl2.elAt( \accel, \x ).action = { |el| MFdef(\fa_accel_x).value(el.value) };
		q.verdesol.mktl.elAt( \accel, \x ).action = {|el| MFdef(\sol_accel_x).value(el.value) };
		q.lilassi.mktl.elAt( \accel, \x ).action = {|el| MFdef(\si_accel_x).value(el.value) };

		q.vermelhodo.mktl.elAt( \accel, \y).action = { |el| MFdef(\do_accel_y).value(el.value) };
		// q.vermelhodo.mktl.elAt( \accel, \y).resetAction; q.vermelhodo.mktl2.elAt( \accel, \y).action = { |el| MFdef(\do_accel_y).value(el.value) };
		q.laranjare.mktl.elAt( \accel, \y ).action = { |el| MFdef(\re_accel_y).value(el.value) };
		q.amarelomi.mktl.elAt( \accel, \y ).action = { |el| MFdef(\mi_accel_y).value(el.value) };
		q.verdefa.mktl.elAt( \accel, \y ).action = { |el| MFdef(\fa_accel_y).value(el.value) };
		// q.verdefa.mktl.elAt( \accel, \y ).resetAction; q.verdefa.mktl2.elAt( \accel, \y ).action = { |el| MFdef(\fa_accel_y).value(el.value) };
		q.verdesol.mktl.elAt( \accel, \y ).action = {|el| MFdef(\sol_accel_y).value(el.value) };
		q.lilassi.mktl.elAt( \accel, \y ).action = {|el| MFdef(\si_accel_y).value(el.value) };

		q.vermelhodo.mktl.elAt( \accel, \z).action = { |el| MFdef(\do_accel_z).value(el.value) };
		// q.vermelhodo.mktl.elAt( \accel, \z).resetAction; q.vermelhodo.mktl2.elAt( \accel, \z).action = { |el| MFdef(\do_accel_z).value(el.value) };
		q.laranjare.mktl.elAt( \accel, \z ).action = { |el| MFdef(\re_accel_z).value(el.value) };
		q.amarelomi.mktl.elAt( \accel, \z ).action = { |el| MFdef(\mi_accel_z).value(el.value) };
		q.verdefa.mktl.elAt( \accel, \z ).action = { |el| MFdef(\fa_accel_z).value(el.value) };
		// q.verdefa.mktl.elAt( \accel, \z ).resetAction; q.verdefa.mktl2.elAt( \accel, \z ).action = { |el| MFdef(\fa_accel_z).value(el.value) };
		q.verdesol.mktl.elAt( \accel, \z ).action = {|el| MFdef(\sol_accel_z).value(el.value) };
		q.lilassi.mktl.elAt( \accel, \z ).action = {|el| MFdef(\si_accel_z).value(el.value) };
	);
	0.2.wait;


	(
		Ndef(\envCtrl, {|att = 1 rel = 1|
			[att, rel]
		});
		Ndef(\envCtrl).addSpec(\att, [0.02, 8, \lin], \rel, [0.08, 8, \lin]);
		{Ndef(\envCtrl).gui}.defer;
	);


	// MOV 1

	(
		[
			[ MFdef(\do_accel_z), \tvermelhodo ],
			[ MFdef(\re_accel_z), \tlaranjare ],
			[ MFdef(\mi_accel_z), \tamarelomi ],
			[ MFdef(\fa_accel_z), \tverdefa ],
			[ MFdef(\sol_accel_z), \tverdesol ],
			[ MFdef(\si_accel_z), \tlilassi ],
		].collect{ |v|
			v[0].add( \trigs_m1, { |el|	Ndef(\trigs_mov1).set( v[1], el.value ) } );
			// v[0].remove(\trigs_m1)
		}
	);

	(
		[
			[ MFdef(\do_gyro_roll), q.vermelhodo.pxChain ],
			[ MFdef(\re_gyro_roll), q.laranjare.pxChain ],
			[ MFdef(\mi_gyro_roll), q.amarelomi.pxChain ],
			[ MFdef(\fa_gyro_roll), q.verdefa.pxChain ],
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

	// trigger-note ///////////////////////////////////////
	(
		[
			[ MFdef(\do_gyro_yaw), \degdo ],
			[ MFdef(\re_gyro_yaw), \degre ],
			[ MFdef(\mi_gyro_yaw), \degmi ],
			[ MFdef(\fa_gyro_yaw), \degfa ],
			[ MFdef(\sol_gyro_yaw), \degsol ],
			[ MFdef(\si_gyro_yaw), \degsi ],
		].collect{ |v|
			// v[0].remove(\notes_m3);
			v[0].add( \notes_m2, { |el| Ndef(\trigs_mov2).set( v[1], ( el.value * 8 ).asInteger) } );
			// v[0].add( \notes_m2, { |el| Ndef(\trigs_mov2).set(v[1], ((el.value + 0.5 % 1).linlin(0, 1, -pi, pi).sin + 2).linlin(1, 2, -1, 8).asInteger ) } );
			// v[0].remove(\notes_m2)
		};
	);
	// ATTACK /////////////////////////////////////////////////////

	(
		[
			[ MFdef(\do_accel_y), q.vermelhodo.acid ],
			[ MFdef(\re_accel_y), q.laranjare.acid ],
			[ MFdef(\mi_accel_y), q.amarelomi.acid ],
			[ MFdef(\fa_accel_y), q.verdefa.acid ],
			[ MFdef(\sol_accel_y), q.verdesol.acid ],
			[ MFdef(\si_accel_y), q.lilassi.acid ],
		].collect{ |v|
			v[0].add(\attack, { |el|
				v[1].set( \att, (el.value - 0.5).abs );
			});
		}
	);

	// RELEASE ////////////////////////////////////////////////////

	(
		[
			[ MFdef(\do_accel_z), q.vermelhodo.acid, 2 ],
			[ MFdef(\re_accel_z), q.laranjare.acid, 1.8 ],
			[ MFdef(\mi_accel_z), q.amarelomi.acid, 1.6 ],
			[ MFdef(\fa_accel_z), q.verdefa.acid, 1.4 ],
			[ MFdef(\sol_accel_z), q.verdesol.acid, 1.2 ],
			[ MFdef(\si_accel_z), q.lilassi.acid, 1 ],
		].collect{ |v|
			v[0].add(\release, { |el|
				v[1].set( \rel, el.value * v[2] );
			});
		}
	);

	// WAVEFORM //////////////////////////////////////
	(
		[
			[ MFdef(\do_gyro_roll), q.vermelhodo.acid ],
			[ MFdef(\re_gyro_roll), q.laranjare.acid ],
			[ MFdef(\mi_gyro_roll), q.amarelomi.acid ],
			[ MFdef(\fa_gyro_roll), q.verdefa.acid ],
			[ MFdef(\sol_gyro_roll), q.verdesol.acid ],
			[ MFdef(\si_gyro_roll), q.lilassi.acid ],
		].collect{ |v|
			v[0].add(\waveform, { |el|
				v[1].set( \wform, el.value.lag(0.1) );
			});
		};
	);


	(
		MFdef(\do_gyro_pitch).add(\dist_reso, { |el|
			q.vermelhodo.acid.set(
				\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 3, 0.25, 0.75).lag(0.2),
				\reso, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 3, 0.25, 0.75).lag(0.2)
			);
		});
		MFdef(\re_gyro_pitch).add(\dist_reso, { |el|
			q.laranjare.acid.set(
				\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.2),
				\reso, (el.value * 1.25).clip2(0.75).lag(0.4)
			);
		});
		MFdef(\mi_gyro_pitch).add(\dist_reso, { |el|
			q.amarelomi.acid.set(
				\dist, (el.value * 1.5).clip2(0.75).lag(0.4),
				\reso, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.7).lag(0.2)
			);
		});
		MFdef(\fa_gyro_pitch).add(\dist_reso, { |el|
			q.verdefa.acid.set(
				\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.7).lag(0.2),
				\reso, (el.value * 1.2).softclip(0.8).lag(0.4)
			);
		});
		MFdef(\sol_gyro_pitch).add(\dist_reso, { |el|
			q.verdesol.acid.set(
				\dist, (el.value).softclip(0.9).lag(0.4),
				\reso, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.2)
			);
		});
		MFdef(\si_gyro_pitch).add(\dist_reso, { |el|
			q.lilassi.acid.set(
				\dist, (el.value.linlin(0, 1, pi, -pi).sin + 2).linlin(1, 2, 0.02, 0.75).lag(0.2),
				\reso, (el.value).softclip(0.75).lag(0.4)
			);
		});
	);


	// MOV 3
	//////////////////////////////////////////////////

	// trigger ///////////////////////////////////////
	[
		[ MFdef(\do_gyro_yaw), \degdo ],
		[ MFdef(\re_gyro_yaw), \degre ],
		[ MFdef(\mi_gyro_yaw), \degmi ],
		[ MFdef(\fa_gyro_yaw), \degfa ],
		[ MFdef(\sol_gyro_yaw), \degsol ],
		[ MFdef(\si_gyro_yaw), \degsi ]
	].collect{ |v|
		v[0].add( \notes_m3, { |el| Ndef(\trigs_mov3).set(v[1], ( el.value * 10 ).round(0.1)/*asInteger*/) } );
		// v[0].remove(\notes_m3);
	};

	// ATTACK
	[
		[ MFdef(\do_accel_y), \attdo, 4, 1, -4 ],
		[ MFdef(\re_accel_y), \attre, 3, 0.5, -4 ],
		[ MFdef(\mi_accel_y), \attmi, 2, 0.25, -4 ],
		[ MFdef(\fa_accel_y), \attfa, 1, 0.125, 4 ],
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
		[ MFdef(\do_accel_z), \reldo, 2, 1, -5 ],
		[ MFdef(\re_accel_z), \relre, 1.5, 0.75, -4 ],
		[ MFdef(\mi_accel_z), \relmi, 1, 0.5, -4 ],
		[ MFdef(\fa_accel_z), \relfa, 0.5, 0.25, 5 ],
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
		[ MFdef(\do_gyro_pitch), q.vermelhodo.tunel ],
		[ MFdef(\re_gyro_pitch), q.laranjare.tunel ],
		[ MFdef(\mi_gyro_pitch), q.amarelomi.tunel ],
		[ MFdef(\fa_gyro_pitch), q.verdefa.tunel ],
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
		[ MFdef(\do_gyro_roll), q.vermelhodo.tunel ],
		[ MFdef(\re_gyro_roll), q.laranjare.tunel ],
		[ MFdef(\mi_gyro_roll), q.amarelomi.tunel ],
		[ MFdef(\fa_gyro_roll), q.verdefa.tunel ],
		[ MFdef(\sol_gyro_roll), q.verdesol.tunel ],
		[ MFdef(\si_gyro_roll), q.lilassi.tunel ],
	].collect{ |v|
		v[0].add( \downsamp, { |el|
			v[1].set( \downsamp, ( (el.value + 0.5 % 1).linlin(0, 1, -pi, pi).sin + 2 ).linexp(1, 3, 1, 16).lag3(0.2) );
		} )
	};

	// ((0.00, 0.01..1).linlin(0, 1, -pi, pi).sin + 2).linlin(1, 3, 0.02, 2).plot

};
