SynthDef(\tunel, {| out = 0, t_trig=1, amp = 0.4, freq = 440, downsamp = 4, modFQ = 2, att = 0.01, rel = 0.1 |
	var son, env, noise, bitReduc, down, pan, initPhase;
	son = SyncSaw.ar( (freq * 0.5).lag3(0.2), freq) * 0.75 + Saw.ar(freq) + ( LFPulse.ar(freq) * 0.5 );
	env = EnvGen.ar( Env.asr(att, 1, rel, [4, -4] ), Trig1.kr(t_trig, att + rel), doneAction: Done.freeSelf );
	son = RLPF.ar(son, freq);
	noise = PinkNoise.ar(0.09);
	bitReduc = ( son + noise ).round(0.5 ** 8);
	down = Latch.ar(bitReduc, Impulse.ar(SampleRate.ir / downsamp.max(2)));
	initPhase = {1.rrand(0.01)};
	pan = LFTri.ar(modFQ, [initPhase, 1 - initPhase ]);
	son = son.ring3(down) /*+ son*/;
	son = son * pan * env;
	OffsetOut.ar(out, son * amp);
}, [\ir]).add;

q.vermelhodo1.tunel = NPVoicer(Ndef(\tunelDo));
q.vermelhodo1.tunel.prime(\tunel);
q.vermelhodo1.tunel.play( Ndef(\vermelhodo1).bus );

q.laranjare.tunel = NPVoicer(Ndef(\tunelRe));
q.laranjare.tunel.prime(\tunel);
q.laranjare.tunel.play( Ndef(\laranjare).bus );

q.amarelomi.tunel = NPVoicer(Ndef(\tunelMi));
q.amarelomi.tunel.prime(\tunel);
q.amarelomi.tunel.play( Ndef(\amarelomi).bus );

q.verdefa1.tunel = NPVoicer(Ndef(\tunelFa));
q.verdefa1.tunel.prime(\tunel);
q.verdefa1.tunel.play( Ndef(\verdefa1).bus );

q.verdesol.tunel = NPVoicer(Ndef(\tunelSol));
q.verdesol.tunel.prime(\tunel);
q.verdesol.tunel.play( Ndef(\verdesol).bus );

q.lilassi.tunel = NPVoicer(Ndef(\tunelSi));
q.lilassi.tunel.prime(\tunel);
q.lilassi.tunel.play( Ndef(\lilassi).bus );

q.vermelhodo2.tunel = NPVoicer(Ndef(\tunelDo));
q.vermelhodo2.tunel.prime(\tunel);
q.vermelhodo2.tunel.play;

q.verdefa2.tunel = NPVoicer(Ndef(\tunelFa));
q.verdefa2.tunel.prime(\tunel);
q.verdefa2.tunel.play;

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