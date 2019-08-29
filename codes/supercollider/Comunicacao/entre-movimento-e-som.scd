MFdef(\imu).add(\gyros, { |msg|
	Ndef(\saaw).set(\cutoff, msg[1].round(0.0001).linexp(-180, 180, 80, 800));
	Ndef(\saaw).set(\rq, msg[2].round(0.0001).linlin(-180, 180, 0.1, 1));
	Ndef(\saaw).set(\freq, msg[3].round(0.0001).linexp(-180, 180, 20, 200));
});

/*
MFdef(\imu).disable(\gyros);
MFdef(\imu).enable(\gyros);
*/