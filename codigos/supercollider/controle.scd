//////////////////////////////// MOV 1 ////////////////////////////////

(
q.vermelhodo1.pxChain.remove(\pitch).remove(\wah).add(\lpf, 1);
q.laranjare.pxChain.remove(\pitch).remove(\wah).add(\lpf, 1);
q.amarelomi.pxChain.remove(\pitch);
q.verdefa1.pxChain.remove(\pitch);
q.verdesol.pxChain.remove(\pitch).remove(\wah).add(\lpf, 1);
q.lilassi.pxChain.remove(\pitch);
);

// trigger
(
[ MFdef(\do_accel_z), MFdef(\re_accel_z), MFdef(\mi_accel_z),
	MFdef(\fa_accel_z), MFdef(\sol_accel_z), MFdef(\si_accel_z)
].collect{ |v|
	v.disable(\trigs)
}
);

// LPF Cutoff Freq
(
[
	MFdef(\do_gyro_roll), MFdef(\re_gyro_roll), MFdef(\mi_gyro_roll),
	MFdef(\fa_gyro_roll), MFdef(\sol_gyro_roll), MFdef(\si_gyro_roll)
].collect{ |v|
	v.disable(\lpf)
}
);

//////////////////////////////// MOV 2 ////////////////////////////////

(
q.vermelhodo1.pxChain.remove(\lpf);
q.laranjare.pxChain.remove(\lpf);
q.verdesol.pxChain.remove(\lpf);
q.lilassi.pxChain.remove(\pitch);
)

// NOTES, TRIGGERS + WAVEFORM //////////////////////////////
(
[
	MFdef(\do_gyro_yaw), MFdef(\re_gyro_yaw), MFdef(\mi_gyro_yaw),
	MFdef(\fa_gyro_yaw), MFdef(\sol_gyro_yaw), MFdef(\si_gyro_yaw)
].collect{ |v|
	v.enable(\notes);
	v.enable(\waveform);
}
);

// ATTACK /////////////////////////////////////////////////////
(
[
	MFdef(\do_accel_y), MFdef(\re_accel_y), MFdef(\mi_accel_y),
	MFdef(\fa_accel_y), MFdef(\sol_accel_y),  MFdef(\si_accel_y)
].collect{ |v|
	v.disable(\attack);
}
);

// RELEASE ////////////////////////////////////////////////////
(
[
	MFdef(\do_accel_z), MFdef(\re_accel_z), MFdef(\mi_accel_z),
	MFdef(\fa_accel_z), MFdef(\sol_accel_z), MFdef(\si_accel_z)
].collect{ |v|
	v.disable(\release);
}
);

// DISTORTION & RESONANCE //////////////////////////////////////
(
[
	MFdef(\do_gyro_roll), MFdef(\re_gyro_roll), MFdef(\mi_gyro_roll),
	MFdef(\fa_gyro_roll), MFdef(\sol_gyro_roll), MFdef(\si_gyro_roll)
].collect{ |v|
	v.disable(\dist_reso)
}
);

//////////////////////////////// MOV 3 ////////////////////////////////

(
	q.vermelhodo1.pxChain.add(\pitch, 0.5);
	q.laranjare.pxChain.add(\pitch, 0.5);
	q.amarelomi.pxChain.add(\pitch, 0.5);
	q.verdefa1.pxChain.add(\wah, 0.9);
	q.verdesol.pxChain.add(\wah, 0.9);
	q.lilassi.pxChain.add(\wah, 0.82);
);

// trigger
(
[
	MFdef(\do_gyro_yaw), MFdef(\re_gyro_yaw), MFdef(\mi_gyro_yaw),
	MFdef(\fa_gyro_yaw), MFdef(\sol_gyro_yaw), MFdef(\si_gyro_yaw)
].collect{ |v|
	v.enable( \trigs );
};
);

// ATTACK
(
[
	MFdef(\do_accel_y), MFdef(\re_accel_y), MFdef(\mi_accel_y),
	MFdef(\fa_accel_y), MFdef(\sol_accel_y), MFdef(\si_accel_y)
].collect{ |v|
	v.enable( \attack )
};
);

// RELEASE
(
[
	MFdef(\do_accel_z), MFdef(\re_accel_z), MFdef(\mi_accel_z),
	MFdef(\fa_accel_z), MFdef(\sol_accel_z), MFdef(\si_accel_z)
].collect{ |v|
	v.enable( \release )
};
);

// Modulation Freq
(
[
	MFdef(\do_gyro_pitch), MFdef(\re_gyro_pitch), MFdef(\mi_gyro_pitch),
	MFdef(\fa_gyro_pitch), MFdef(\sol_gyro_pitch), MFdef(\si_gyro_pitch)
].collect{ |v|
	v.enable( \modFQ)
};
);

// DownSampling
(
[
	MFdef(\do_gyro_roll),  MFdef(\re_gyro_roll), MFdef(\mi_gyro_roll),
	MFdef(\fa_gyro_roll), MFdef(\sol_gyro_roll), MFdef(\si_gyro_roll)
].collect{ |v|
	v.enable( \downsamp)
};
);

(
Ndef(\envCtrl, {|att = 8 rel = 8|
	[att, rel]
});
Ndef(\envCtrl).addSpec(\att, [0.02, 8, \lin], \rel, [0.08, 8, \lin]);
Ndef(\envCtrl).gui;
);
