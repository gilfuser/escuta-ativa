SynthDef(\acid, { | out= 0, freq = 440, pan = 0, t_trig = 1, reso = 0.5, dist = 0.5, wform = 0, amp = 0.4, att = 0.04, rel = 0.5 |
	var env, slide = LFDNoise3.kr(0.25).range(0.1, 0.4);
	var trig = Trig1.kr(Impulse.kr(1) /*Changed.kr( freq )*/);
	var waves = [ DPW4Saw.ar( freq.lag2(slide) * 0.5, 0.75 ),  Pulse.ar( freq.lag2(slide) ) ];
	var noise = { LFDNoise3.ar(0.3,0.0156,1) };
	var snd = SelectX.ar( wform, waves );
	env = EnvGen.kr(Env.adsr(att, 0.2, 0.5, rel, -4 ), Trig1.kr(t_trig, att + rel), doneAction: Done.freeSelf );
	// snd = snd.ring4(1);
	// snd = (snd*1.25).clip2(0.5);//.fold(-0.75, 0.75); //.softclip; // // clip2(0.5);
	snd = snd * noise;
	snd = ( RLPFD.ar( snd, freq.lag3(0.4), reso, dist ) * 0.5 ) + ( RLPF.ar(snd, freq.lag3(slide)) * 0.5 );
	// snd = snd + ( HPF.ar(snd, 400, 10).softclip * 0.04);
	snd = snd + PitchShift.ar(snd, 0.1, 1.0, 0.02, 0.2);
	snd = snd * env;
	OffsetOut.ar(out, Pan2.ar( snd, pan ) * amp);
}, [\ir]).add;

q.vermelhodo.acid = NPVoicer(Ndef(\acidDo));
q.vermelhodo.acid.prime(\acid);
q.vermelhodo.acid.play();
// q.vermelhodo.acid.set(\out, Ndef(\vermelhodo).in)

q.laranjare.acid = NPVoicer(Ndef(\acidRe));
q.laranjare.acid.prime(\acid);
q.laranjare.acid.play();

q.amarelomi.acid = NPVoicer(Ndef(\acidMi));
q.amarelomi.acid.prime(\acid);
q.amarelomi.acid.play();

q.verdefa.acid = NPVoicer(Ndef(\acidFa));
q.verdefa.acid.prime(\acid);
q.verdefa.acid.play();

q.verdesol.acid = NPVoicer(Ndef(\acidSol));
q.verdesol.acid.prime(\acid);
q.verdesol.acid.play();

q.lilassi.acid = NPVoicer(Ndef(\acidSi));
q.lilassi.acid.prime(\acid);
q.lilassi.acid.play();

/*
Ndef(\acidDo).fadeTime_(0.2);
Ndef(\acidSi, { | freq = 440 pan = -0.5 reso = 0.5 dist = 0.5 wform = 0 att = 0.04 amp = 0.1 rel = 0.5 |
	var slide = LFDNoise3.kr(0.25).range(0.1, 0.4);
	var trig = Trig1.kr(Changed.kr( freq ));
	var waves = [ DPW4Saw.ar( freq.lag2(slide) * 0.8, 0.75 ),  Pulse.ar( freq.lag2(slide) ) ];
	var env = EnvGen.kr(Env.adsr(att, LFNoise0.kr(10).range(0.05, 0.3), amp, rel), trig );
	var noise = LFDNoise3.ar(0.3,0.0156,1);
	var snd = SelectX.ar( wform, waves );
	snd = snd.ring1(noise);
	// snd = (snd*1.25).clip2(0.5);//.fold(-0.75, 0.75); //.softclip; // // clip2(0.5);
	snd = snd * noise * env;
	snd = ( RLPFD.ar( snd, freq.lag3(0.4), reso, dist ) * 0.5 ) + ( RLPF.ar(snd, freq.lag3(slide)) * 0.5 );
	// snd = snd + ( HPF.ar(snd, 400, 10).softclip * 0.04);
	snd = snd + PitchShift.ar(snd, 0.1, 1.0, 0.02, 0.2);

    Pan2.ar( snd, pan ) * amp * AmpComp.kr(freq, 600)
}).play;
Ndef(\acidSi).gui;*/
