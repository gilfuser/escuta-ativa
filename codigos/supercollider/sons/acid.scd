Ndef(\acidDo, { | freq = 440 pan = 0 reso = 0.5 dist = 0.5 wform = 0 att = 0.04 amp = 0.4 rel = 0.5 |
	var slide = LFDNoise3.kr(0.25).range(0.1, 0.4);
	var trig = Trig1.kr(/*Impulse.kr(1)*/Changed.kr( freq ));
	var waves = [ DPW4Saw.ar( freq.lag2(slide) * 0.5, 0.75 ),  Pulse.ar( freq.lag2(slide) ) ];
	var env = EnvGen.kr(Env.adsr(att, LFNoise0.kr(10).range(0.05, 0.3), amp, rel), trig );
	var noise = { LFDNoise3.ar(0.3,0.0156,1) };
	var snd = SelectX.ar( wform, waves );
	// snd = snd.ring4(1);
	// snd = (snd*1.25).clip2(0.5);//.fold(-0.75, 0.75); //.softclip; // // clip2(0.5);
	snd = snd * noise * env;
	snd = ( RLPFD.ar( snd, freq.lag3(0.4), reso, dist ) * 0.5 ) + ( RLPF.ar(snd, freq.lag3(slide)) * 0.5 );
	// snd = snd + ( HPF.ar(snd, 400, 10).softclip * 0.04);
	snd = snd + PitchShift.ar(snd, 0.1, 1.0, 0.02, 0.2);
    Pan2.ar( snd, pan ) * amp
}).play;
Ndef(\acidDo).fadeTime_(0.2);
// Ndef(\vermelhodo1) <<> Ndef(\acidDo);
// Ndef(\acidDo).gui;

Ndef(\acidRe, { | freq = 440 pan = -0.1 reso = 0.5 dist = 0.5 wform = 0 att = 0.04 amp = 0.3 rel = 0.5 |
	var slide = LFDNoise3.kr(0.25).range(0.1, 0.4);
	var trig = Trig1.kr(Changed.kr( freq ));
	var waves = [ DPW4Saw.ar( freq.lag2(slide) * 0.56 ),  Pulse.ar( freq.lag2(slide) ) ];
	var env = EnvGen.kr(Env.adsr(att, 0.3, amp, rel), trig );
	var noise = { LFDNoise3.ar(0.3,0.0156,1) };
	var snd = SelectX.ar( wform, waves );
	// snd = (snd*1.25).clip2(0.5);//.fold(-0.75, 0.75); //.softclip; // // clip2(0.5);
	snd = snd * noise * env;
	snd = ( RLPFD.ar( snd, freq.lag3(0.4), reso, dist ) * 0.5 ) + ( RLPF.ar(snd, freq.lag3(slide)) * 0.5 );
	// snd = snd + ( HPF.ar(snd, 400, 10).softclip * 0.04);
	snd = snd + PitchShift.ar(snd, 0.1, 1.0, 0.02, 0.2);

    Pan2.ar( snd, pan ) * amp
}).play;
Ndef(\acidRe).gui;

Ndef(\acidMi, { | freq = 440 pan = 0.2 reso = 0.5 dist = 0.5 wform = 0 att = 0.04 amp = 0.2 rel = 0.5 |
	var slide = LFDNoise3.kr(0.25).range(0.1, 0.4);
	var trig = Trig1.kr(Changed.kr( freq ));
	var waves = [ DPW4Saw.ar( freq.lag2(slide) * 0.72, 0.75 ),  Pulse.ar( freq.lag2(slide) ) ];
	var env = EnvGen.kr(Env.adsr(att, LFNoise0.kr(10).range(0.05, 0.3), amp, rel), trig );
	var noise = { LFDNoise3.ar(0.3,0.0156,1) };
	var snd = SelectX.ar( wform, waves );
	snd = (snd*1.25).softclip(0.75); // // clip2(0.5);
	snd = snd * noise * env;
	snd = ( RLPFD.ar( snd, freq.lag3(0.4), reso, dist ) * 0.5 ) + ( RLPF.ar(snd, freq.lag3(slide)) * 0.5 );
	// snd = snd + ( HPF.ar(snd, 400, 10).softclip * 0.04);
	snd = snd + PitchShift.ar(snd, 0.1, 1.0, 0.02, 0.2);
    Pan2.ar( snd, pan ) * amp
}).play;
Ndef(\acidMi).gui;

Ndef(\acidFa, { | freq = 440 pan = -0.3 reso = 0.5 dist = 0.5 wform = 0 att = 0.04 amp = 0.2 rel = 0.5 |
	var slide = LFDNoise3.kr(0.25).range(0.1, 0.4);
	var trig = Trig1.kr(Changed.kr( freq ));
	var waves = [ DPW4Saw.ar( freq.lag2(slide) * 0.88, 0.75 ),  Pulse.ar( freq.lag2(slide) ) ];
	var env = EnvGen.kr(Env.adsr(att, LFNoise0.kr(10).range(0.05, 0.3), amp, rel), trig );
	var noise = { LFDNoise3.ar(0.3,0.0156,1) };
	var snd = SelectX.ar( wform, waves );
	snd = (snd*1.25).clip2(0.5);//.fold(-0.75, 0.75); //.softclip; // // clip2(0.5);
	snd = snd * noise * env;
	snd = ( RLPFD.ar( snd, freq.lag3(0.4), reso, dist ) * 0.5 ) + ( RLPF.ar(snd, freq.lag3(slide)) * 0.5 );
	// snd = snd + ( HPF.ar(snd, 400, 10).softclip * 0.04);
	snd = snd + PitchShift.ar(snd, 0.1, 1.0, 0.02, 0.2);
	snd = snd.ring4(noise);
    Pan2.ar( snd, pan ) * amp * AmpComp.kr(freq, 800)
}).play;
Ndef(\acidFa).gui;

Ndef(\acidSol, { | freq = 440 pan = 0.4 reso = 0.5 dist = 0.5 wform = 0 att = 0.04 amp = 0.2 rel = 0.5 |
	var slide = LFDNoise3.kr(0.25).range(0.1, 0.4);
	var trig = Trig1.kr(Changed.kr( freq ));
	var env = EnvGen.kr(Env.adsr(att, LFNoise0.kr(10).range(0.05, 0.3), amp, rel), trig );
	var waves = [ DPW4Saw.ar( freq.lag2(slide) * 1.04, 0.75 ),  Pulse.ar( freq.lag2(slide) ) ];
	var snd = SelectX.ar( wform, waves );
	var noise = LFDNoise3.ar(0.3,0.0156,1);
	// snd = (snd*1.25).clip2(0.5);//.fold(-0.75, 0.75); //.softclip; // // clip2(0.5);
	snd = snd.ring3(noise);
	snd = snd * noise * env;
	snd = ( RLPFD.ar( snd, freq.lag3(slide), reso, dist ) * 0.5 ) + ( RLPF.ar(snd, freq.lag3(slide)) * 0.5 );
	// snd = snd + ( HPF.ar(snd, 400, 10).softclip * 0.04);
	snd = snd + PitchShift.ar(snd, 0.1, 1.0, 0.02, 0.2);
    Pan2.ar( snd, pan ) * amp * AmpComp.kr(freq, 600)
}).play;
Ndef(\acidSol).gui;

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
Ndef(\acidSi).gui;
