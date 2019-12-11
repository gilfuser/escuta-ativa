// Samples
// s.waitForBoot{

// Mono SynthDefs //-------------------------------------
// synthdef to play a buffer
SynthDef(\simpsamp, { |out, buf, amp=0.1, rate = 1, pan=0, start|
	var snd = PlayBuf.ar(1,
		buf, rate, 1,
		start * BufSampleRate.ir(buf),
		loop: 0, doneAction:Done.freeSelf
	);
	Out.ar(out, Pan2.ar(snd, pan, amp));
}).add;

SynthDef(\simpsampGlitch, { |out, buf, amp=0.1, rate = 1, pan=0, start|
	var snd, blendMess = Line.kr(-2,2, BufDur.ir(buf)).clip(0, 1);

	rate = rate * blend(1, LFNoise1.kr(Rand(2, 30), 5, 1).clip2(1), blendMess);
	snd = PlayBuf.ar(1,
		buf, rate, 1,
		start * BufSampleRate.ir(buf),
		loop: 0, doneAction:Done.freeSelf
	);
	Out.ar(out, Pan2.ar(snd, pan, amp));
}).add;

// synthdef to play a sction from a buffer
SynthDef(\sampEnv, { |out, buf, amp=0.1, rate = 1, pan, start, sustain=0.8|
	var snd = PlayBuf.ar(1,
		buf, rate, 1,
		start * BufSampleRate.ir(buf),
		loop: 0, doneAction:Done.freeSelf
	);
	var env = EnvGen.ar(Env.linen(0.001, sustain, 0.001), doneAction: 2);
	Out.ar(out, Pan2.ar(snd * env, pan, amp))
}).add;

// Stereo SynthDefs //--------------------------------------
SynthDef(\simpsamp_st, { |out, buf, amp=0.1, rate = 1, start|
	var snd = PlayBuf.ar(2,
		buf, rate, 1,
		start * BufSampleRate.ir(buf),
		loop: 0, doneAction:Done.freeSelf
	);
	Out.ar(out, snd * amp);
}).add;
SynthDef(\sampEnv_st, { |out, buf, amp=0.1, rate = 1,start, sustain=0.8|
	var snd = PlayBuf.ar(2,
		buf, rate, 1,
		start * BufSampleRate.ir(buf),
		loop: 0, doneAction:Done.freeSelf
	);
	var env = EnvGen.ar(Env.linen(0.001, sustain, 0.001), doneAction: 2);
	Out.ar(out, snd * env * amp)
}).add;
/// e.o. SynthDefs -----------------------------------------------------------

// sound file load mechanism
q=q?();
// have all the samples stored in this Dir !!
q.mainSampDir = (q.topDir +/+ "samples").pathMatch.first;

// single function to load folders of sounds into Buffer Arrays;
// supports a number of sample formats
q.loadSamples = { |q, dir, mainDir|
	var formaz = ["aif*", "wav", "AIF*", "WAV"];
	var myDir = (mainDir ? q.mainSampDir) +/+ dir;
	var mySFs = if (PathName(myDir).folders.isEmpty.not)
	{
		formaz.collect{|format|
		(myDir +/+ "*" +/+ "*." ++ format).pathMatch.postcln
	}.flatten(1).sort;}
	{
		formaz.collect{|format|
		(myDir +/+ "*." ++ format).pathMatch.postcln
	}.flatten(1).sort;};
	postf("\n\n>>>>> about to load the following % files: \n\n", mySFs.size);
	mySFs.collect{|f|f.basename}.printAll;
	mySFs.postln.collect { |path, i|
		Buffer.read(s, path);
	};
	// "\n\n".postln;
};
// };
// use like this!
q.samBrazil = q.loadSamples("BRAZILPERC");
q.surdo = q.loadSamples("BRAZILPERC/surdo");
q.cabassa = q.loadSamples("ONE SHOTS/CABASSA");
q.snares = q.loadSamples("snare-center") ++ q.loadSamples("snare-edge");

fork { 0.2.wait; q.snares.choose.play };
fork { 0.4.wait; (instrument: \simpsamp, buf: q.samBrazil.choose, rate: 0.75).play };