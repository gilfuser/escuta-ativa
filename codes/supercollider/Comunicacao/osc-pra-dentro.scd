/************** OSC IN ********************/

{
	OSCdef(\imu, { | msg | MFdef(\imu).value(msg) },\imu);
	0.1.wait;
	MFdef(\imu).add(\post, {|msg| msg.round(0.0001).postln});
}.fork;

/*
MFdef(\imu).disable(\post)
MFdef(\imu).enable(\post)
OSCdef(\imu).free;
*/