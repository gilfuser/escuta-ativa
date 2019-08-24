s.boot;

OSCdef(\init, {|msg| msg.postln}, \espInit);

(
OSCdef(\espData, { | msg |
	MFdef(\acel).value(msg)
},\espData);
)

MFdef(\acel).add(\post, {|msg| msg.postln})
MFdef(\acel).disable(\post)
MFdef(\acel).enable(\post)

MFdef(\acel).add(\xyz, { |msg|
	Ndef(\saaw).set(\cutoff, msg[1].linexp(-5000, 15000, 80, 800));
	Ndef(\saaw).set(\rq, msg[2].linlin(-16000, 10000, 0.1, 1));
	Ndef(\saaw).set(\freq, msg[3].linexp(-3000, 1400, 20, 200));
})

OSCdef(\espData).free;

Ndef(\saaw, {
	arg cutoff = 1000, rq = 0.25, freq = 100;
	var sig;
	sig = Saw.ar(freq);
	sig = RLPF.ar(sig, cutoff.lag(0.2), rq.lag(0.2),0.4);
	Out.ar(0, sig);
}).play;

Ndef(\saaw).gui;
