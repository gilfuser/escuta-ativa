(
SynthDef(\tunel, {| out = 0, t_trig=1, amp = 0.4, freq = 440, downsamp = 4, modFQ = 2, att = 0.01, rel = 0.1 |
	var son, env, noise, bitReduc, down, pan, initPhase;
	son = ( Saw.ar(freq * 0.5, mul: 0.5) + BlitB3Square.ar(freq, mul: 0.25) + LFPulse.ar(freq * 2, mul: 0.25) ).softclip * 1.5;
	env = EnvGen.ar( Env.asr(att, 1, rel, [4, -4] ), Trig1.kr(t_trig, att + rel), doneAction: Done.freeSelf );
	son = RLPF.ar(son, freq);
	noise = PinkNoise.ar(0.15);
	bitReduc = ( son + noise ).round(0.5 ** 8);
	down = Latch.ar(bitReduc, Impulse.ar(SampleRate.ir / downsamp.max(2)));
	initPhase = {1.rrand(0.01)};
	pan = LFTri.ar(modFQ, [initPhase, 1 - initPhase ]);
	son = son.ring3(down) /*+ son*/;
	son = son * pan * env;
	OffsetOut.ar(out, son * amp);
}, [\ir]).add;
);
q.vermelhodo.tunel = NPVoicer(Ndef(\tuneldo));
q.vermelhodo.tunel.prime(\tunel);
q.vermelhodo.tunel.play();

q.laranjare.tunel = NPVoicer(Ndef(\tunelre));
q.laranjare.tunel.prime(\tunel);
q.laranjare.tunel.play();

q.amarelomi.tunel = NPVoicer(Ndef(\tunelmi));
q.amarelomi.tunel.prime(\tunel);
q.amarelomi.tunel.play();

q.verdefa.tunel = NPVoicer(Ndef(\tunelfa));
q.verdefa.tunel.prime(\tunel);
q.verdefa.tunel.play();

q.verdesol.tunel = NPVoicer(Ndef(\tunelsol));
q.verdesol.tunel.prime(\tunel);
q.verdesol.tunel.play();

q.lilassi.tunel = NPVoicer(Ndef(\tunelsi));
q.lilassi.tunel.prime(\tunel);
q.lilassi.tunel.play;

/*Ndef(\tunelDo, {| amp = 0.4, freq = 440, downsamp = 4, modFQ = 2, att = 2, rel = 4 |
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
}).play;*/