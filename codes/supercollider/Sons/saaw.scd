Ndef(\saaw, {
	arg cutoff = 1000, rq = 0.25, freq = 100;
	var sig;
	sig = Saw.ar(freq);
	sig = RLPF.ar(sig, cutoff.lag(0.2), rq.lag(0.2),0.4);
	Out.ar(0, sig);
});

Ndef(\saaw).gui;
