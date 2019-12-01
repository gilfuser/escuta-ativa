
SynthDef(\tones, {|amp = 0.1, rel = 2, t_trig = 1, freq = 440, downsamp = 4, modFQ = 2, att = 0.001|
	var son = LFPulse.ar(freq, 0);
	var env = Env.perc(att, rel, 1, -2);
	var volEnv = EnvGen.ar(env, t_trig, doneAction: 2);
	var filt = RLPF.ar(son, freq);

	var bitReduc = (filt + HPF.ar(PinkNoise.ar(0.09), 2500)).round(0.5 ** 8);
	var down = Latch.ar(bitReduc, Impulse.ar(SampleRate.ir / downsamp.max(2)));
	//var mix = SelectX.ar(blend, [son,down]);
	var panMod = LFTri.ar(modFQ, [0, 1]);
	var pan = down* volEnv * panMod;
	Out.ar(0, (pan * amp ));
}).add;



Pdef(\test).gui;


(
Pdef(\test, {
	Pbind(
		\instrument, \tones,
		\degree, Pseq([0, 3, 5, -12, -15, -7, -5] -12, inf),
		\att, Pbrown(0.1, 4.0, 0.25, inf),
		\rel, Pbrown(0.2, 4.0, 0.25, inf),
		// \amp, 0.25,
		\modFQ, Pbrown(0.5, 8, 0.25, inf),
		\dur, 1
		// \bits, 4
	)
}).play
)

Spec.add(\bits, [2, 16, 1,1]);
Spec.add(\downsamp, [1, 128, 1,1]);

Pdef(\test).set(\bits, 4, \amp, 0.2, \downsamp, 4);
