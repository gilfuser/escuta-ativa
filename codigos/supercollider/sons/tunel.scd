Ndef(\tunelDo, {| amp = 0.4, freq = 440, downsamp = 4, modFQ = 2, att = 2, rel = 4 |
	var son = LFPulse.ar(freq);
	var trig = Trig1.kr(Changed.kr( freq ));
	var env = EnvGen.ar( Env.asr(att, 1, rel ), trig);
	var filt = RLPF.ar(son, freq);

	var bitReduc = (filt + HPF.ar(PinkNoise.ar(0.09), 2500)).round(0.5 ** 8);
	var down = Latch.ar(bitReduc, Impulse.ar(SampleRate.ir / downsamp.max(2)));
	//var mix = SelectX.ar(blend, [son,down]);
	var panMod = LFTri.ar(modFQ, [0, 1]);
	var pan = down * /* env * */panMod;
	pan * amp;
}).play;

Ndef(\tunelRe, {| amp = 0.3, freq = 440, downsamp = 4, modFQ = 2, att = 2, rel = 4 |
	var son = LFPulse.ar(freq);
	var trig = Trig1.kr(Changed.kr( freq ));
	var env = EnvGen.ar( Env.asr(att, 1, rel ), trig);
	var filt = RLPF.ar(son, freq);

	var bitReduc = (filt + HPF.ar(PinkNoise.ar(0.09), 2500)).round(0.5 ** 8);
	var down = Latch.ar(bitReduc, Impulse.ar(SampleRate.ir / downsamp.max(2)));
	//var mix = SelectX.ar(blend, [son,down]);
	var panMod = LFTri.ar(modFQ, [0, 1]);
	var pan = down * /* env * */panMod;
	pan * amp;
}).play;
Ndef(\tunelRe).gui;

Ndef(\tunelMi, {| amp = 0.2, freq = 440, downsamp = 4, modFQ = 2, att = 2, rel = 4 |
	var son = LFPulse.ar(freq);
	var trig = Trig1.kr(Changed.kr( freq ));
	var env = EnvGen.ar( Env.asr(att, 1, rel ), trig);
	var filt = RLPF.ar(son, freq);

	var bitReduc = (filt + HPF.ar(PinkNoise.ar(0.09), 2500)).round(0.5 ** 8);
	var down = Latch.ar(bitReduc, Impulse.ar(SampleRate.ir / downsamp.max(2)));
	//var mix = SelectX.ar(blend, [son,down]);
	var panMod = LFTri.ar(modFQ, [0, 1]);
	var pan = down * /* env * */panMod;
	pan * amp;
}).play;
Ndef(\tunelMi).gui;

Ndef(\tunelFa, {| amp = 0.1, freq = 440, downsamp = 4, modFQ = 2, att = 2, rel = 4 |
	var son = LFPulse.ar(freq);
	var trig = Trig1.kr(Changed.kr( freq ));
	var env = EnvGen.ar( Env.asr(att, 1, rel ), trig);
	var filt = RLPF.ar(son, freq);

	var bitReduc = (filt + HPF.ar(PinkNoise.ar(0.09), 2500)).round(0.5 ** 8);
	var down = Latch.ar(bitReduc, Impulse.ar(SampleRate.ir / downsamp.max(2)));
	//var mix = SelectX.ar(blend, [son,down]);
	var panMod = LFTri.ar(modFQ, [0, 1]);
	var pan = down * /* env * */panMod;
	pan * amp;
}).play;
Ndef(\tunelFa).gui;

Ndef(\tunelSol, {| amp = 0.1, freq = 440, downsamp = 4, modFQ = 2, att = 2, rel = 4 |
	var son = LFPulse.ar(freq);
	var trig = Trig1.kr(Changed.kr( freq ));
	var env = EnvGen.ar( Env.asr(att, 1, rel ), trig);
	var filt = RLPF.ar(son, freq);

	var bitReduc = (filt + HPF.ar(PinkNoise.ar(0.09), 2500)).round(0.5 ** 8);
	var down = Latch.ar(bitReduc, Impulse.ar(SampleRate.ir / downsamp.max(2)));
	//var mix = SelectX.ar(blend, [son,down]);
	var panMod = LFTri.ar(modFQ, [0, 1]);
	var pan = down * /* env * */panMod;
	pan * amp;
}).play;
Ndef(\tunelSol).gui;

Ndef(\tunelSi, {| amp = 0.1, freq = 440, downsamp = 4, modFQ = 2, att = 2, rel = 4 |
	var son = LFPulse.ar(freq);
	var trig = Trig1.kr(Changed.kr( freq ));
	var env = EnvGen.ar( Env.asr(att, 1, rel ), trig);
	var filt = RLPF.ar(son, freq);

	var bitReduc = (filt + HPF.ar(PinkNoise.ar(0.09), 2500)).round(0.5 ** 8);
	var down = Latch.ar(bitReduc, Impulse.ar(SampleRate.ir / downsamp.max(2)));
	//var mix = SelectX.ar(blend, [son,down]);
	var panMod = LFTri.ar(modFQ, [0, 1]);
	var pan = down * /* env * */panMod;
	pan * amp;
}).play;
Ndef(\tunelSi).gui;
