SynthDef(\acid, { | out= 0, freq = 440, pan = 0, t_trig = 1, reso = 0.5, dist = 0.5, wform = 0, amp = 0.4, att = 0.04, rel = 0.5 |
	var env, slide = LFDNoise3.kr(0.25).range(0.1, 0.4);
	var waves = [ DPW4Saw.ar( freq.lag2(slide) * 0.5, 0.75 ),  Pulse.ar( freq.lag2(slide) ) ];
	var noise = { LFDNoise3.ar(0.3,0.0156,1) };
	var snd = SelectX.ar( wform, waves );
	env = EnvGen.kr(Env.adsr(att, 0.2, 0.5, rel, -4 ), Trig1.kr(t_trig, att + rel), doneAction: Done.freeSelf );
	snd = snd * noise;
	snd = ( RLPFD.ar( snd, freq.lag3(0.4), reso, dist ) * 0.5 ) + ( RLPF.ar(snd, freq.lag3(slide)) * 0.5 );
	snd = snd + PitchShift.ar(snd, 0.1, 1.0, 0.02, 0.2);
	snd = snd * env;
	OffsetOut.ar(out, Pan2.ar( snd, pan ) * amp);
}, [\ir]).add;

q.vermelhodo.acid = NPVoicer(Ndef(\aciddo));
q.vermelhodo.acid.prime(\acid);
q.vermelhodo.acid.play;

q.laranjare.acid = NPVoicer(Ndef(\acidre));
q.laranjare.acid.prime(\acid);
q.laranjare.acid.play;

q.amarelomi.acid = NPVoicer(Ndef(\acidmi));
q.amarelomi.acid.prime(\acid);
q.amarelomi.acid.play;

q.verdefa.acid = NPVoicer(Ndef(\acidfa));
q.verdefa.acid.prime(\acid);
q.verdefa.acid.play;

q.verdesol.acid = NPVoicer(Ndef(\acidsol));
q.verdesol.acid.prime(\acid);
q.verdesol.acid.play;

q.lilassi.acid = NPVoicer(Ndef(\acidsi));
q.lilassi.acid.prime(\acid);
q.lilassi.acid.play;
