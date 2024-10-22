#singleinstance force	; 跳过对话框并自动替换旧实例
#usehook

global speed := 5
global status := true

^!k::{
	global status
	status := !status
}

capslock::ctrl

;第二层
;数字，f区，符号
#HotIf status 
~\::reload

*Space up::{
	if (A_Priorkey == "Space" && !GetKeyState("`;","p") && !GetKeyState("tab","p")){
		send ("{blind}{Space}")
	}
}

;第三层
;方向，鼠标，编辑，音量
*`; up::{
	if (A_Priorkey == "`;" && !GetKeyState("space","p") && !GetKeyState("tab","p")){
		send ("{blind}{`;}")
	}
	global status
	speed := 5
}

;第四层
;宏 f区
*Tab up::{
	if (A_Priorkey == "Tab" && !GetKeyState("space","p") && !GetKeyState("`;","p")){
		send ("{blind}{Esc}")
	}
}

;第二层
#HotIf status && GetKeyState("space","p")
	tab::`
	q::1
	w::2
	e::3
	a::4
	s::5
	d::6
	z::7
	x::8
	c::9
	v::0
	r::f1
	t::f2
	y::f3
	u::f4
	f::f5
	g::f6
	h::f7
	j::f8
	,::f9
	m::f10
	n::f11
	b::f12
	i::[
	o::]
	p::\
	[::bs
	k::-
	l::=
	.::/
	`;::'
	'::enter
	/::del

;第三层
#HotIf status && GetKeyState("`;","p")
	space::lbutton
	f::lbutton
	e::rbutton
	r::mbutton

	q::tab
	tab::wheelup
	lshift::wheeldown

	global speed
	w::{
		global speed
		MouseMove 0, -50,speed,"R"
		speed+=20
	}
	s::{
		global speed
		mousemove 0, 50,speed,"R"
		speed+=20
	}
	a::{
		global speed
		mousemove -50, 0,speed,"R"
		speed+=20
	}
	d::{
		global speed
		mousemove 50, 0,speed,"R"
		speed+=20
	}

	w up:: speed:=5
	a up:: speed:=5
	s up:: speed:=5
	d up:: speed:=5

	space & w::mousemove 0, -15,speed,"R"
	space & s::mousemove 0, 15,speed,"R"
	space & a::mousemove -15, 0,speed,"R"
	space & d::mousemove 15, 0,speed,"R"

	capslock & w::wheelup
	capslock & s::wheeldown
	capslock & a::wheelleft
	capslock & d::wheelright

	h::left
	j::down
	k::up
	l::right

	n::home
	m::pgdn
	,::pgup
	.::end

	u::volume_mute
	i::volume_down
	o::volume_up
	p::media_play_pause

	c::capslock
	z::tab
	x::bs
	v::enter
	b::del

	;第四层
#HotIf status && GetKeyState("tab","p")
	q::f1
	w::f2
	e::f3
	r::f4
	a::f5
	s::f6
	d::f7
	f::f8
	z::f9
	x::f10
	c::f11
	v::f12
	space::tab
	h::send("houjiang123456")
	j::send("1034855223")


