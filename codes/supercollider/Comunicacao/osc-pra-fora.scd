/************** OSC OUT ********************/
q = q ? ();

{
	q.net = NetAddr("192.168.0.18", 12000); // IP e Port do Processing
	0.1.wait;
	MFdef(\imu).add(\send, {|msg| q.net.sendMsg(\test, msg[1], msg[2], msg[3], /*msg[4], msg[5], msg[6]*/)});
}.fork;

/*
MFdef(\imu).disable(\send);
MFdef(\imu).enable(\send);
q.net.disconnect;
*/
