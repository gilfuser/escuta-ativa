q = q ? ();
q.fx = q.fx ? ();
// q.views = q.views ? ();

{
	Pdefn(\scaleA, Scale.choose(7, 12).tuning_(Tuning.choose(12)));
	Pdefn(\scaleA).source.name;
	Pdefn(\scaleA).source.tuning;
	q.scl = Scale.chromatic;
	q.deltas = Bus.control(s, 5).setn(1!5);
	0.2.wait;
	q.deg = [];
	(-23..23).do{ |d i| q.deg = q.deg ++ q.scl.degreeToRatio(d, 0) };

	0.2.wait;

	ProxyChain.add3( \hpf, \filter -> { |in freq = 80 rq = 1|
		BHiPass.ar( in, freq.lag(0.2), rq.lag(0.2) ); // mul
	},
	1,
	);

	ProxyChain.add3( 'orbx', \filterIn -> { |in, redir = 4|
		var bus = Select.ar( redir, [ InFeedback.ar(~dirt.numChannels, ~dirt.numChannels), InFeedback.ar(~dirt.numChannels * 2, ~dirt.numChannels), InFeedback.ar(~dirt.numChannels * 3, ~dirt.numChannels), InFeedback.ar(~dirt.numChannels * 4, ~dirt.numChannels), DC.ar(0) ] );
		in + bus;
	},
	1,
	(
		[
			\redir: [0, 4, \lin, 1, 1],
			// \in1: [0, 3, \lin, 1, 1]
		]
	)
	);

	ProxyChain.add3( 'pitch', \filterIn -> { | in, pideg = 0, pdisp = 0.05, tdisp = 0.2, slide = 0.4 |
		var wSize, timeDisp, pitchRatio;
		var scl = Scale.at(\lydianMinor);
		// var scl = { Pdefn(\scaleA).source }.value;
		pitchRatio = LinSelectX.kr( pideg + 5, q.deg ).lag(slide);
		wSize =  0.15;
		timeDisp = LFDNoise3.ar( 0.0626).range(0, wSize) * tdisp;
		PitchShift.ar( in, wSize, pitchRatio, pdisp, timeDisp );
	},
	0.5,
	(
		[
			\pdisp: [0, 0.5],
			\tdisp: [0, 1],
			\slide: [0.02, 2],
			\pideg: [-48, 48, \lin, 1, 0],
		]
	)
	);

	/*'tape' -> { |in,  trate = 1, tphase = 1.5, tdepth = 1, toffset = 1, cps = 1 |
	var curve = SinOsc.ar(( trate * {cps}/*.reciprocal TempoClock.default.tempo */), ( tphase.lag(0.1) * 2pi + 1.5pi) % 2pi, tdepth, toffset.lag(0.1) );
	DelayC.ar(in, 2, curve, in);
	},*/


	ProxyChain.add3( 'tape', \filterIn -> { |in /*tempo */ trate=1 tphase=1.5 tdepth = 1 toffset = 1 |
		var curve = SinOsc.ar(( trate * {TempoClock.default.tempo})/*.reciprocal.lag(0.2)*/, ( /*trate **/ tphase.lag(0.1) * 2pi + 1.5pi) % 2pi, tdepth, toffset.lag(0.1) );
		DelayC.ar(in, 2, curve/*, in*/);
	},
	1,
	(
		[
			\toffset: [0, 1],
			\tdepth: [0.001,1, \lin],
			\trate: [ 0.25, 4, \lin, 0.25, 1 ],
			\tphase: [ 0, 2],
			\cps: [ 0.1, 10],
		]
	)
	);

	/* 'hole' -> {  | in , hrate = 0.1, damp = 0.1, hsize = 1, hdif = 0.707, hfb = 0.1, cps , hhpf, hlpf | */
	// var delayTime = (hrate * {TempoClock.default.tempo}).reciprocal.lag(0.2);
	// Greyhole.ar( in, delayTime, damp, hsize.lag(0.2), hdif, hfb, modDepth: 0.2 );
	/* },
	*/

	ProxyChain.add3( 'llfo', \filterIn -> { | in,  sisap = 0,  cps = 1, lrate = 0, iphase = 0, lwidth = 0.5,  midfreq = 60,  hifreq = 20000 |
		var tempo = (lrate * {cps /* TempoClock.default.tempo */}).reciprocal.lag(0.2);
		var mod = Select.ar(sisap, [
			SinOsc.ar( tempo, (  lrate *  iphase * 2pi + 1.5pi) % 2pi),
			LFSaw.ar( tempo, iphase % 2, lwidth ), // change to LFTri
			LFPulse.ar(tempo, (lrate * iphase) % 1, lwidth.clip(0.02, 0.998) )*2-1,
		]);
		BLowPass.ar(in, mod.lag2(0.05).exprange(midfreq.lag(0.1), hifreq.lag(0.1)));
	},
	1,
	(
		[
			\iphase, [ 0.001, 1, \exp, 0, 0.5 ],
			\hifreq, [ 200, 20000, \exp, 0, 220, "Hz" ],
			\lwidth, [ 0, 1 ],
			\sisap, [ 0, 2, \lin, 1, 1 ],
			\lrate, [ 0, 16, \lin, 0.125, 1 ],
			\cps, [ 0.05, 2 ]
		]
	)
	);

	ProxyChain.add3( 'lpf', \filterIn -> { | in, freq = 20000, rq = 0.2 |
		BLowPass.ar(in, freq.lag2(0.2), rq.lag2(0.2) );
	},
	1,
	(
		[
			\rq, [0.2, 2],
		]
	)
	);

	ProxyChain.add3( 'wah', \filterIn -> { |in, wrate = 1, depth = 0.5, sinsaw = 0, wphase = 0, jfreq = 1, jdepth = 0 |
		var  wring = 0.002, wrq = 0.8,  ggain = 1.25 ;
		var jitter = LFNoise2.ar(jfreq, jdepth);
		var mod = Select.kr(sinsaw, [
			SinOsc.ar( wrate, wphase + ( jitter * 2pi) % 2pi, depth).exprange(100, 5000),
			VarSaw.kr(wrate, jitter, 0.1, depth).lag(0.1).exprange(100, 5000),
		]);
		var ringz = Ringz.ar( in, mod, wring );
		var sig = RLPF.ar(ringz, mod, wrq.lag(0.1)) * ggain.tanh.lag(0.0003) / ggain.sqrt;
		Limiter.ar(sig, 0.9);
	},
	1,
	(
		[
			\wrate, [0, 10, \lin],
			\depth, [0, 1],
			\jdepth, [0, 1],
			\wring, [0.001, 1, \exp],
			\sinsaw, [0, 1, \lin, 1, 0],
			\jfreq, [0.1, 10, \exp],
			\wphase, [1.5pi, 0.5pi],
		]
	)
	);

	ProxyChain.add3( \compT, \filterIn -> { | in, cctrl = 0, thresh = 0.25, slopea = 0.5, clamp = 0.001, relax = 0.1, deltas = 1 |
		var deltaSel = Select.kr(deltas, q.deltas);
		var bus = Select.kr(cctrl, q.outBusses);
		var comp = Compander.ar( in, In.ar( bus, ~dirt.numChannels), thresh.linexp(0, 1, 0.001, 1), 1, slopea, clamp, relax * deltas );
		Limiter.ar( comp );
	},
	1,
	(
		[
			\cctrl: [0, 3, \lin, 1, 1 ],
			\thresh: [-60.dbamp, 1, \amp ],
			// \slopeb, [0.5, 4]);
			\slopea: [0.05, 1 ],
			\clamp: [0.001, 0.4 ],
			\relax: [0.1, 1 ],
			\deltas: [0, 4, 1, 4 ],
			\delta: [0.01, 10 ]
		]
	)
	);

	ProxyChain.add3( \leakDC,  \filterIn -> { |in, leak=0.99| LeakDC.ar(in, leak) },
		1,
		(\leak: [0.5, 0.999, \exp])
	);

	ProxyChain.add3( \comp, \filterIn -> { | in, thresh = 0.33, slopea = 0.33, clamp = 0.03, relax = 0.35 |
		var comp = Compander.ar( in, in, thresh.linexp(0, 1, 0.001, 1), 1, slopea, clamp, relax );
		Limiter.ar( comp );
	},
	1,
	(
		\thresh: [-60.dbamp, 1, \amp],
		\slopea: [0.05, 1],
		\clamp: [0.001, 0.4],
		\relax: [0.1, 1]
	)
	);

	ProxyChain.add3( \ampFin, \filter -> { |in, drive=3, ampLimit=0.8 |
		Limiter.ar(in * drive, ampLimit);
	},
	1,
	(
		\drive: [1, 10, \exp],
		\ampLimit: \amp
	)
	);

	ProxyChain.add3( \verb, \filterIn -> { |in mix = 0.5 room = 0.5 damp = 0.5 |
		FreeVerb.ar(in, mix, room, damp)
	},
	1,
	(
		\mix: [0,1],
		\room: [0,1],
		\damp: [0,1]
	)
	);

	ProxyChain.add3( \verbPan, \filterIn -> { |in mix = 0.5 room = 0.5 damp = 0.5 pan = 0 |
		var sig2v = PanAz.ar( s.options.numOutputBusChannels,  in, pan, 1, s.options.numOutputBusChannels );
		PanAz.ar( s.options.numOutputBusChannels,  FreeVerb.ar(in, mix, room, damp), pan, 1, s.options.numOutputBusChannels );
	},
	1,
	(
		\mix: [0,1],
		\room: [0,1],
		\damp: [0,1]
	)
	);

	ProxyChain.add3(
		\leakDC,  \filter -> { |in, leak=0.99| LeakDC.ar(in, leak) },
		1,
		(\leak: [0.5, 0.999, \exp])
	);

	ProxyChain.add3(
		\analysissi,  \filter -> { | in |
			var trig = Impulse.kr(\rate.kr(8));
			var amp = Amplitude.kr( in, 0.05, 0.05 );
			SendReply.kr( trig, '/analysissi', amp[0] );
			in;
		},
		1,
		( \rate: [8, 60, \lin, 1, 8] )
	);

	ProxyChain.add3(
		\analysisdo,  \filter -> { | in |
			var trig = Impulse.kr(\rate.kr(8));
			var amp = Amplitude.kr( in, 0.05, 0.05 );
			SendReply.kr( trig, '/analysisdo', amp[0] );
			in;
		},
		1,
		( \rate: [8, 60, \lin, 1, 8] )
	);

	ProxyChain.add3(
		\analysisre,  \filter -> { | in |
			var trig = Impulse.kr(\rate.kr(8));
			var amp = Amplitude.kr( in, 0.05, 0.05 );
			SendReply.kr( trig, '/analysisre', amp[0] );
			in;
		},
		1,
		( \rate: [8, 60, \lin, 1, 8] )
	);

	ProxyChain.add3(
		\analysismi,  \filter -> { | in |
			var trig = Impulse.kr(\rate.kr(8));
			var amp = Amplitude.kr( in, 0.05, 0.05 );
			SendReply.kr( trig, '/analysismi', amp[0] );
			in;
		},
		1,
		( \rate: [8, 60, \lin, 1, 8] )
	);

	ProxyChain.add3(
		\analysisfa,  \filter -> { | in |
			var trig = Impulse.kr(\rate.kr(8));
			var amp = Amplitude.kr( in, 0.05, 0.05 );
			SendReply.kr( trig, '/analysisfa', amp[0] );
			in;
		},
		1,
		( \rate: [8, 60, \lin, 1, 8] )
	);

	ProxyChain.add3(
		\analysissol,  \filter -> { | in |
			var trig = Impulse.kr(\rate.kr(8));
			var amp = Amplitude.kr( in, 0.05, 0.05 );
			SendReply.kr( trig, '/analysissol', amp[0] );
			in;
		},
		1,
		( \rate: [8, 60, \lin, 1, 8] )
	);

	"\n FX Library -> ProxyChain - LOADED \n ".postln;

}.fork;