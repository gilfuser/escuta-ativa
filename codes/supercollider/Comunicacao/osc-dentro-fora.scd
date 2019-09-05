q = q ? ();

{
	/************** OSC OUT ********************/

	q.net = NetAddr("127.0.0.1", 9999); // IP e Port do Processing
	0.1.wait;

	/*
	q.net.disconnect;
	q.net.connect;
	*/

	/************** OSC IN ********************/

	OSCdef(\imu, { | msg |
		MFdef(\imu).value(msg);
		q.net.sendMsg(\test, msg[1], msg[2], msg[3], /*msg[4], msg[5], msg[6]*/)
	},\imu);
	0.1.wait;
	MFdef(\imu).add(\post, {|msg| msg.round(0.0001).postln});

	/*
	MFdef(\imu).disable(\post)
	MFdef(\imu).enable(\post)
	OSCdef(\imu).free;
	*/

}.fork;
